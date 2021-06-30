import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/models/User.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;
  fireAuth.FirebaseAuth get auth => _auth;

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  late StreamSubscription<Event> _userInfoListener;

  @override
  void onInit() {
    super.onInit();
    // _user.bindStream(_auth.authStateChanges());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _user.value = null;
      } else {
        _userInfoListener = _databaseHelper.firebaseDatabase
            .reference()
            .child(userId(user.uid))
            .onValue
            .listen((event) {
          print(
              "AuthController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value}");
          print(
              "++++++++++++++++++++++++++++++++++++++++++++++\n\n${event.snapshot.value}\n\n++++++++++++++++++++++++++++++++");
          _user.value = User.fromSnapshot(user, event.snapshot);
        });
      }
    });
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
        .timeout(Duration(seconds: 5),
            onTimeout: () =>
                Future.error(Exception("Timed out , Check your Internet.")))
        .then((value) {
      Get.snackbar("Welcome Back :D",
          "Hello ${value.user?.displayName}, We are glad you're back!",
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.FLOATING);
    }, onError: ((Object e, StackTrace stackTrace) {
      Get.snackbar("Failed to Sign you in!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }));
  }

  Future<void> sendOTPForLogin(String phoneNumber) async {
    HttpsCallable sendOTPForLoginFunction =
        FirebaseFunctions.instance.httpsCallable('sendOTPForLogin');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response =
          await sendOTPForLoginFunction.call(<String, dynamic>{
        'phoneNumber': phoneNumber,
        'messageType': 'SMS',
        'language': _user.value!.language
      });
      // mezcalmosSnackBar("Notice ~", "OTP message has been sent !");
      // _waitingResponse.value = false;

      print("Send Otp For Login Response");
      print(response.data);
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      print("Exception happend in sendOTPForLogin : $e");
    }
  }

  Future<void> signInUsingOTP(String phoneNumber, String otpCode) async {
    HttpsCallable getAuthUsingOTPFunction =
        FirebaseFunctions.instance.httpsCallable('getAuthUsingOTP');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await getAuthUsingOTPFunction.call(
          <String, dynamic>{'phoneNumber': phoneNumber, 'OTPCode': otpCode});
      // mezcalmosSnackBar("Notice ~", "OTP message has been sent !");
      // _waitingResponse.value = false;
      print("GetAuthUsingOTP Response");
      print(response.data);
      fireAuth.FirebaseAuth.instance
          .signInWithCustomToken(response.data["token"]);
    } catch (e) {
      // mezcalmosSnackBar("Notice ~", "Failed to send OTP message :( ");
      // _waitingResponse.value = false;
      print("Exception happend in GetAuthUsingOTP : $e");
    }
  }

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
        fireAuth.FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    fireAuth.FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      TaxiInjectionHelper.revokeListenersOnSignOut();
    } catch (e) {
      Get.snackbar("Failed to Sign you out!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void dispose() {
    super.dispose();
    print("--------------------> AuthController Auto Disposed !");
  }
}
