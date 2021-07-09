import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/models/User.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  final GetStorage _storage = GetStorage();
  final SettingsController _settings = Get.find<SettingsController>();

  User? get user => _user.value;
  fireAuth.FirebaseAuth get auth => _auth;

  // RxInt _isWaitingRresponse = 0.obs;

  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>(); // Already Injected in main function

  late StreamSubscription<Event> _userInfoListener;

  // # REGION ------------- OTP Code ---------------
  RxInt _timeBetweenResending = 0.obs;
  int get timeBetweenResending => _timeBetweenResending.value;

  void resendOtpTimerActivate() {
    _timeBetweenResending.value = 60;
    const second = const Duration(seconds: 1);
    Timer.periodic(
      second,
      (Timer __t) {
        print("OTP Code resending available after $timeBetweenResending Seconds !");
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
    // _user.bindStream(_auth.authStateChanges());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _user.value = null;
      } else {
        _userInfoListener = _databaseHelper.firebaseDatabase.reference().child(userId(user.uid)).onValue.listen((event) {
          print("AuthController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value}");
          print("++++++++++++++++++++++++++++++++++++++++++++++\n\n${event.snapshot.value}\n\n++++++++++++++++++++++++++++++++");
          _user.value = User.fromSnapshot(user, event.snapshot);
        });
      }
    });
    super.onInit();
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.back();
    } catch (e) {
      Get.snackbar("Error creating your account!", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password).timeout(Duration(seconds: 10), onTimeout: () => Future.error(Exception("Timed out , Check your Internet."))).then((value) {
      Get.snackbar("Welcome Back :D", "Hello ${value.user?.displayName}, We are glad you're back!",
          colorText: Colors.white, backgroundColor: Colors.black87, snackPosition: SnackPosition.BOTTOM, snackStyle: SnackStyle.FLOATING);
    }, onError: ((Object e, StackTrace stackTrace) {
      Get.snackbar("Failed to Sign you in!", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }));
  }

  dynamic sendOTPForLogin(String phoneNumber) async {
    HttpsCallable sendOTPForLoginFunction = FirebaseFunctions.instance.httpsCallable('sendOTPForLogin');
    HttpsCallableResult? response;
    try {
      // _waitingResponse.value = true;
      response = await sendOTPForLoginFunction
          .call(<String, dynamic>{'phoneNumber': phoneNumber, 'messageType': 'SMS', 'language': _settings.appLanguage.userLanguageKey, 'database': _databaseHelper.dbType});
      mezcalmosSnackBar("Notice ~", "OTP message has been sent !");
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      print("Exception happend in sendOTPForLogin : $e"); // i
    }
    return response!.data;
  }

  Future<void> signInUsingOTP(String phoneNumber, String otpCode) async {
    print("$phoneNumber  < phone ------ otp > $otpCode");
    HttpsCallable getAuthUsingOTPFunction = FirebaseFunctions.instance.httpsCallable('getAuthUsingOTP');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response =
          await getAuthUsingOTPFunction.call(<String, dynamic>{'phoneNumber': phoneNumber, 'OTPCode': otpCode, 'language': _settings.appLanguage.userLanguageKey, 'database': _databaseHelper.dbType});
      // mezcalmosSnackBar("Notice ~", "OTP message has been sent !");
      // _waitingResponse.value = false;
      print("GetAuthUsingOTP Response");
      print("################################ DATA ###############################\n\n${response.data}\n\n");
      await fireAuth.FirebaseAuth.instance.signInWithCustomToken(response.data["token"]);
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

    if (result.status == LoginStatus.failed) {
      mezcalmosSnackBar("Notice ~", "Failed SignIn with Facebook !");
    } else {
      // Create a credential from the access token
      final facebookAuthCredential = fireAuth.FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      fireAuth.FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
  }

  Future<void> signOut() async {
    try {
      detachListeners();
      // TaxiInjectionHelper.revokeListenersOnSignOut();
      await _auth.signOut();
      Get.offAllNamed(kMainAuthWrapperRoute);
    } catch (e) {
      Get.snackbar("Failed to Sign you out!", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void detachListeners() {
    _userInfoListener
        .cancel()
        .then((value) => print("_userInfoListener was disposed on authController::detachListeners !"))
        .catchError((err) => print("Error happend while trying to dispose _userInfoListener in authController::detachListeners !"));
  }

  @override
  void dispose() {
    super.dispose();
    print("--------------------> AuthController Auto Disposed !");
  }
}
