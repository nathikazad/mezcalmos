import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/TaxiApp/helpers/authHooks.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

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

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  RxBool authStateNotifierInvoked = false
      .obs; // THIS IS BEING CHECKED ON THE ROOT MAIN.DART To wait for the first invoke!

  dynamic _onSignOutCallback;
  dynamic _onSignInCallback;

  User? get user => _user.value;

  fireAuth.FirebaseAuth get auth => _auth;

  // RxInt _isWaitingRresponse = 0.obs;

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  late StreamSubscription<Event> _userInfoListener;
  StreamSubscription<Event> get userInfoListener => _userInfoListener;

  // # REGION ------------- OTP Code ---------------
  RxInt _timeBetweenResending = 0.obs;
  int get timeBetweenResending => _timeBetweenResending.value;

  void attachOnSignOutHook(Function f) => _onSignOutCallback = f;
  void attachOnSignInHook(Function f) {
    if (_onSignInCallback == null) f();
    _onSignOutCallback = f;
  }

  void resendOtpTimerActivate(int time) {
    _timeBetweenResending.value = time;
    const second = const Duration(seconds: 1);
    Timer.periodic(
      second,
      (Timer __t) {
        print(
            "OTP Code resending available after $timeBetweenResending Seconds !");
        if (_timeBetweenResending.value == 0)
          __t.cancel();
        else
          _timeBetweenResending.value--;
      },
    );
  }

  //------------------------------------------------

  @override
  void onInit() {
    Get.lazyPut(() => LanguageController());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      authStateNotifierInvoked.value = true;
      print("authStateNotifierInvoked ====> $authStateNotifierInvoked");
      if (user == null) {
        print('User is currently signed out!');
        _user.value = null;
      } else {
        _userInfoListener = _databaseHelper.firebaseDatabase
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

  Future<void> signOut() async {
    try {
      _onSignOutCallback();
      await _auth.signOut();
      Get.offAllNamed(kMainAuthWrapperRoute);
    } catch (e) {
      Get.snackbar("Failed to Sign you out!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
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
        .then((value) {
      _onSignInCallback();
      _userInfoListener.resume();
    }, onError: ((Object e, StackTrace stackTrace) {
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
      mezcalmosSnackBar(
          "Notice ~",
          responseStatusChecker(response.data,
              onSuccessMessage: "OTP message has been sent !"));
      if (response.data['secondsLeft'] != null) {
        resendOtpTimerActivate(response.data['secondsLeft']);
      }
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      print("Exception happend in sendOTPForLogin : $e"); // i
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
      await fireAuth.FirebaseAuth.instance
          .signInWithCustomToken(response.data["token"]);
      _onSignInCallback();
      _userInfoListener.resume();

      await Get.offAllNamed(kMainAuthWrapperRoute);
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
      _userInfoListener.resume();
      AuthHooks();
      print("+++++++++++++++++++==> $_onSignInCallback <==++++++++++++++++++");
      // await _onSignInCallback();
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
      _onSignInCallback();
      _userInfoListener.resume();
    } catch (exception) {
      print(exception);
      mezcalmosSnackBar("Notice ~", "Failed SignIn with Apple !");
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   print("--------------------> AuthController Auto Disposed !");
  // }
}
