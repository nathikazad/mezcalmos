import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;

  Function _onSignOutCallback;
  Function _onSignInCallback;

  Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  Rxn<fireAuth.User> _fireAuthUser = Rxn<fireAuth.User>();
  fireAuth.User? get fireAuthUser => _fireAuthUser.value;

  StreamSubscription? _userNodeListener;

  // Rxn<fireAuth.User> _userRx = Rxn();
  StreamController<fireAuth.User?> _authStateStream =
      StreamController.broadcast();
  // _authStateStream.addStream(_auth.authStateChanges());
  Stream<fireAuth.User?> get authStateChange => _authStateStream.stream;

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  AuthController(this._onSignInCallback, this._onSignOutCallback);
  String? _previousUserValue = "init";
  @override
  void onInit() {
    super.onInit();
    // _authStateStream.addStream(_auth.authStateChanges());
    mezDbgPrint('Auth controller init!');
    Get.lazyPut(() => LanguageController());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      if (user?.toString() == _previousUserValue) {
        mezDbgPrint(
            'Authcontroller:: same sign in event fired again, skipping it');
        return;
      }
      _previousUserValue = user?.toString();
      _authStateStream.add(user);
      mezDbgPrint('Authcontroller:: Auth state change!');
      mezDbgPrint(user?.hashCode);
      mezDbgPrint(user ?? "empty");
      _fireAuthUser.value = user;
      if (user == null) {
        mezDbgPrint('AuthController: User is currently signed out!');
        _userNodeListener?.cancel();
        _userNodeListener = null;
        _user.value = null;
      } else {
        mezDbgPrint('AuthController: User is currently signed in!');
        _onSignInCallback();
        _userNodeListener = _databaseHelper.firebaseDatabase
            .reference()
            .child(userInfo(user.uid))
            .onValue
            .listen((event) {
          if (event.snapshot.value['language'] == null) {
            event.snapshot.value['language'] =
                Get.find<LanguageController>().userLanguageKey;
          }

          _user.value = User.fromSnapshot(user, event.snapshot);
          Get.find<LanguageController>()
              .userLanguageChanged(_user.value!.language);
          GetStorage().write(getUserId, user.uid);
        });
      }
    });
    super.onInit();
  }

  Future<String> getImageUrl(File imageFile, String uid) async {
    String x;

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref("users/${uid}/avatar/${imageFile.path}")
          .putFile(imageFile);
    } on firebase_core.FirebaseException catch (e) {
      print("{{{{{{{{{{{{{{{{{{{{" +
          e.message.toString() +
          "}}}}}}}}}}}}}}}}}}}}}}}}}}}}");
    } finally {
      x = await firebase_storage.FirebaseStorage.instance
          .ref('users/${uid}/avatar/${imageFile.path}')
          .getDownloadURL();
    }

    return x;
  }

  Future<void> editUserProfile(String? displayName, String? photo) async {
    Map<String, String> newProfileInfo = <String, String>{};
    if (displayName != null) {
      newProfileInfo["displayName"] = displayName;
    }
    if (photo != null) {
      newProfileInfo["photo"] = photo;
    }
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(userInfo(_user.value!.uid))
        .update(newProfileInfo);
  }

  Future<void> signOut() async {
    try {
      mezDbgPrint("AuthController: Sign out function");
      await _onSignOutCallback();
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

  void changeLanguage(String newLanguage) {
    if (_user.value != null) {
      if (newLanguage == "en" || newLanguage == "es") {
        _databaseHelper.firebaseDatabase
            .reference()
            .child(userLanguage(_user.value!.uid))
            .set(newLanguage);
      }
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

  dynamic sendOTPForLogin(String phoneNumber) async {
    HttpsCallable sendOTPForLoginFunction =
        FirebaseFunctions.instance.httpsCallable('sendOTPForLogin');
    HttpsCallableResult? response;
    try {
      // _waitingResponse.value = true;
      response = await sendOTPForLoginFunction.call(<String, dynamic>{
        'phoneNumber': phoneNumber,
        'messageType': 'SMS',
        'language': tDefaultLanguage,
        // 'language': _settings.appLanguage.userLanguageKey,
        'database': _databaseHelper.dbType
      });
      print(response);
      mezcalmosSnackBar(
          "Notice ~",
          responseStatusChecker(response.data,
              onSuccessMessage: "OTP message has been sent !"));
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      print("Exception happend in sendOTPForLogin : $e"); // i
      print(e);
    }
    return response!.data;
  }

  Future<void> signInUsingOTP(String phoneNumber, String otpCode) async {
    print("$phoneNumber  < phone ------ otp > $otpCode");
    HttpsCallable getAuthUsingOTPFunction =
        FirebaseFunctions.instance.httpsCallable('getAuthUsingOTP');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response =
          await getAuthUsingOTPFunction.call(<String, dynamic>{
        'phoneNumber': phoneNumber,
        'OTPCode': otpCode,
        'language': tDefaultLanguage,
        // 'language': _settings.appLanguage.userLanguageKey,
        'database': _databaseHelper.dbType
      });
      // mezcalmosSnackBar("Notice ~", "OTP message has been sent !");
      // _waitingResponse.value = false;
      print("GetAuthUsingOTP Response");
      print(
          "################################ DATA ###############################\n\n${response.data}\n\n");
      fireAuth.FirebaseAuth.instance
          .signInWithCustomToken(response.data["token"]);

    } catch (e) {
      mezcalmosSnackBar("Error", "OTP Code confirmation failed :(");

      print("Exception happend in GetAuthUsingOTP : $e");
    }
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
      mezcalmosSnackBar("Notice ~", "Failed SignIn with Facebook !");
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

      print(appleCredential.authorizationCode);

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = fireAuth.OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      fireAuth.FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (exception) {
      print(exception);
      mezcalmosSnackBar("Notice ~", "Failed SignIn with Apple !");
    }
  }

  @override
  void dispose() {
    _userNodeListener?.cancel();
    _userNodeListener = null;
    super.dispose();
    print("--------------------> AuthController Auto Disposed !");
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
