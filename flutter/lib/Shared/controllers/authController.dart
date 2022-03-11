import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']
    ['controllers']['authController'];

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Function _onSignOutCallback;
  Function _onSignInCallback;

  Rxn<MainUserInfo> _user = Rxn<MainUserInfo>();
  MainUserInfo? get user => _user.value;

  Rxn<fireAuth.User> _fireAuthUser = Rxn<fireAuth.User>();
  fireAuth.User? get fireAuthUser => _fireAuthUser.value;

  StreamSubscription? _userNodeListener;

  // Rxn<fireAuth.User> _userRx = Rxn();
  StreamController<fireAuth.User?> _authStateStreamController =
      StreamController.broadcast();

  StreamController<MainUserInfo?> _userInfoStreamController =
      StreamController.broadcast();

  Stream<fireAuth.User?> get authStateStream =>
      _authStateStreamController.stream;
  Stream<MainUserInfo?> get userInfoStream => _userInfoStreamController.stream;

  bool get isUserSignedIn => _fireAuthUser.value != null;
  FirebaseDb _databaseHelper =
      Get.find<FirebaseDb>(); // Already Injected in main function

  AuthController(this._onSignInCallback, this._onSignOutCallback);
  String? _previousUserValue = "init";

  @override
  void onReady() {
    Get.lazyPut(() => LanguageController());
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    // _authStateStream.addStream(_auth.authStateChanges());

    mezDbgPrint('Auth controller init!');
    _auth.authStateChanges().listen((fireAuth.User? user) async {
      if (user?.toString() == _previousUserValue) {
        mezDbgPrint(
            'Authcontroller:: same sign in event fired again, skipping it');
        return;
      }
      _previousUserValue = user?.toString();
      mezDbgPrint('Authcontroller:: Auth state change!');
      mezDbgPrint(user?.hashCode);
      mezDbgPrint(user ?? "empty");
      _fireAuthUser.value = user;

      if (user == null) {
        await _onSignOutCallback();
        _authStateStreamController.add(null);
        _userInfoStreamController.add(null);

        mezDbgPrint('AuthController: User is currently signed out!');
        _userNodeListener?.cancel();
        _userNodeListener = null;
        _user.value = null;
      } else {
        mezDbgPrint('AuthController: User is currently signed in!');
        _onSignInCallback();
        _authStateStreamController.add(user);
        GetStorage().write(getxUserId, user.uid);
        _userNodeListener?.cancel();
        _userNodeListener = _databaseHelper.firebaseDatabase
            .reference()
            .child(userInfoNode(user.uid))
            .onValue
            .listen((event) {
          if (event.snapshot.value == null) return;
          if (event.snapshot.value['language'] == null) {
            event.snapshot.value['language'] = Get.find<LanguageController>()
                .userLanguageKey
                .toFirebaseFormatString();
            _databaseHelper.firebaseDatabase
                .reference()
                .child(userLanguageNode(user.uid))
                .set(Get.find<LanguageController>()
                    .userLanguageKey
                    .toFirebaseFormatString());
          }
          _user.value = MainUserInfo.fromData(event.snapshot.value);
          _userInfoStreamController.add(_user.value);
          if (_user.value!.language != null)
            Get.find<LanguageController>().setLanguage(_user.value!.language!);
        });
      }
    });
    super.onInit();
  }

  bool isDisplayNameSet() {
    return _user.value?.name != null;
  }

  bool isUserImgSet() {
    return _user.value?.image != null &&
        _user.value?.image != defaultUserImgUrl;
  }

  /// This Functions takes a File (Image) and an optional [isCompressed]
  ///
  /// And Upload it to firebaseStorage with at users/[uid]/avatar/[uid].[isCompressed ? 'cmpressed' : 'original'].[extension]
  Future<String> uploadUserImgToFbStorage(
      {required File imageFile, bool isCompressed = false}) async {
    String _uploadedImgUrl;
    var splitted = imageFile.path.split('.');
    String imgPath =
        "users/${this._fireAuthUser.value!.uid}/avatar/${this._fireAuthUser.value!.uid}.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .putFile(imageFile);
    } on firebase_core.FirebaseException catch (e) {
      mezDbgPrint(e.message.toString());
    } finally {
      _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .getDownloadURL();
    }

    return _uploadedImgUrl;
  }

  /// this is for setting the Original size of the image that was picked by the user,
  ///
  /// Made as a seprated function and not along with [editUserProfile]'s parameteres,
  ///
  /// because that was we won't need to wait for them both to get uploaded.
  Future<void> setOriginalUserImage(String? originalImageUrl) async {
    if (originalImageUrl != null) {
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(userInfoNode(fireAuthUser!.uid))
          .child('bigImage')
          .set(originalImageUrl);
    }
  }

  Future<void> editUserProfile(String? name, String? compressedImageUrl) async {
    if (name != null) {
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(userInfoNode(fireAuthUser!.uid))
          .child('name')
          .set(name);
    }
    if (compressedImageUrl != null && compressedImageUrl.isURL) {
      await _databaseHelper.firebaseDatabase
          .reference()
          .child(userInfoNode(fireAuthUser!.uid))
          .child('image')
          .set(compressedImageUrl);
    }
  }

  Future<void> signOut() async {
    try {
      mezDbgPrint("AuthController: Sign out function");

      mezDbgPrint("AuthController: Sign out callbacks finished");
      _userNodeListener?.cancel();
      _userNodeListener = null;
      _user.value = null;
      await _auth.signOut();
      mezDbgPrint("AuthController: Sign out finished");
    } catch (e) {
      Get.snackbar("Failed to Sign you out!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  void changeLanguage(LanguageType newLanguage) {
    if (_user.value != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(userLanguageNode(_user.value!.id))
          .set(newLanguage.toFirebaseFormatString());
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar("Error creating your account!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .timeout(Duration(seconds: 10),
            onTimeout: () =>
                Future.error(Exception("Timed out , Check your Internet.")))
        .then((value) {}, onError: ((Object e, StackTrace stackTrace) {
      Get.snackbar("Failed to Sign you in!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }));
  }

  Future<ServerResponse> sendOTPForLogin(String phoneNumber) async {
    HttpsCallable sendOTPForLoginFunction =
        FirebaseFunctions.instance.httpsCallable('otp-sendOTPForLogin');
    HttpsCallableResult? response;
    try {
      // _waitingResponse.value = true;
      response = await sendOTPForLoginFunction.call(<String, dynamic>{
        'phoneNumber': phoneNumber,
        'messageType': 'SMS',
        'language': tDefaultLanguage.toFirebaseFormatString(),
        // 'language': _settings.appLanguage.userLanguageKey,
      });
      // var c = json.decode(response.data);
      // mezDbgPrint("-----------------");
      // mezDbgPrint(c);
      // mezDbgPrint(response);
      // mezDbgPrint("-----------------");

      // mezcalmosSnackBar(
      //     "Notice ~",
      //     responseStatusChecker(response.data,
      //         onSuccessMessage: "OTP message has been sent !"));
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in sendOTPForLogin : $e"); // i
      mezDbgPrint(e);
    }
    return ServerResponse.fromJson(response?.data ?? {"status": "Error"});
  }

  Future<ServerResponse?> signInUsingOTP(
      String phoneNumber, String otpCode) async {
    mezDbgPrint("$phoneNumber  < phone ------ otp > $otpCode");
    HttpsCallable getAuthUsingOTPFunction =
        FirebaseFunctions.instance.httpsCallable('otp-getAuthUsingOTP');
    HttpsCallableResult? response;
    ServerResponse? serverResponse;

    try {
      // _waitingResponse.value = true;
      response = await getAuthUsingOTPFunction.call(<String, dynamic>{
        'phoneNumber': phoneNumber,
        'OTPCode': otpCode,
        'language': tDefaultLanguage.toFirebaseFormatString(),
        // 'language': _settings.appLanguage.userLanguageKey,
      });

      serverResponse = ServerResponse.fromJson(response.data ?? {});

      mezDbgPrint('---------------------');
      mezDbgPrint(serverResponse.status);
      mezDbgPrint(serverResponse.data);
      mezDbgPrint(serverResponse.errorMessage);
      mezDbgPrint(serverResponse.errorCode);
      mezDbgPrint('---------------------');

      if (serverResponse.success) {
        fireAuth.FirebaseAuth.instance
            .signInWithCustomToken(response.data["token"]);
      }
    } catch (e) {
      MezSnackbar("Oops ..", _i18n()['failedOTPConfirmRequest']);
      print("Exception happend in GetAuthUsingOTP : $e");
    }

    return serverResponse;
  }

  // flutter_facebook_auth Package causes a conflict with GetStorage !

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();
    print(" FB AUTH STATUS +++++++++++++++++++++ ${result.status.toString()}");

    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final facebookAuthCredential =
          fireAuth.FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      fireAuth.FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    } else {
      MezSnackbar("Notice ~", "Failed SignIn with Facebook !");
      throw Exception("Failed SignIn with Facebook !");
    }
  }

  Future signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    try {
      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      mezDbgPrint(appleCredential.authorizationCode);

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = fireAuth.OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      fireAuth.FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (exception) {
      mezDbgPrint(exception);
      MezSnackbar("Notice ~", "Failed SignIn with Apple !");
      throw exception;
    }
  }

  @override
  void dispose() {
    _userNodeListener?.cancel();
    _userNodeListener = null;
    super.dispose();
    mezDbgPrint("--------------------> AuthController Auto Disposed !");
  }
}

String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
