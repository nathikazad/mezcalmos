import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';

class AuthController extends GetxController {
 
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  final GetStorage _storage = GetStorage();
  // final SettingsController _settings = Get.find<SettingsController>();

  User? get user => _user.value;
  fireAuth.FirebaseAuth get auth => _auth;

  // RxInt _isWaitingRresponse = 0.obs;

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  late StreamSubscription<Event> _userInfoListener;

  // # REGION ------------- OTP Code ---------------
  RxInt _timeBetweenResending = 0.obs;
  int get timeBetweenResending => _timeBetweenResending.value;

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
    // _user.bindStream(_auth.authStateChanges());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _user.value = null;
      } else {
        print("Putting Taxi Auth Controller");
        Get.lazyPut(() => TaxiAuthController());
        Get.lazyPut(() => DeviceNotificationsController());
        Get.lazyPut(() => MessageController());
        Get.lazyPut(() => FBNotificationsController());
        _userInfoListener = _databaseHelper.firebaseDatabase
            .reference()
            .child(userInfo(user.uid))
            .onValue
            .listen((event) {
          print(
              "AuthController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value}");
          print(
              "++++++++++++++++++++++++++++++++++++++++++++++\n\n${event.snapshot.value}\n\n++++++++++++++++++++++++++++++++");
          // if language is not set in db, then get it from lang controller which gets it from device
          if (event.snapshot.value['language'] == null) {
            event.snapshot.value['language'] =
                Get.find<LanguageController>().userLanguageKey;
          }
          _user.value = User.fromSnapshot(user, event.snapshot);
          Get.find<LanguageController>()
              .userLanguageChanged(_user.value!.language);
        });
      }
    });
    super.onInit();
  }

  Future<void> signOut() async {
    try {
      _userInfoListener.pause();
      // TaxiInjectionHelper.revokeListenersOnSignOut();
      Get.find<TaxiAuthController>().dispose();
      Get.find<DeviceNotificationsController>().dispose();
      Get.find<MessageController>().dispose();
      Get.find<FBNotificationsController>().dispose();
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
      // Get.snackbar(lang.strings['shared']['login']["welcomeTitle"],
      //     "${lang.strings['shared']['login']["hello"]} ${value.user?.displayName}, ${lang.strings['shared']['login']["welcomeDesc2"]}",
      //     colorText: Colors.white,
      //     backgroundColor: Colors.black87,
      //     snackPosition: SnackPosition.BOTTOM,
      //     snackStyle: SnackStyle.FLOATING);
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
    } else {
      mezcalmosSnackBar("Notice ~", "Failed SignIn with Facebook !");
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   print("--------------------> AuthController Auto Disposed !");
  // }
}
