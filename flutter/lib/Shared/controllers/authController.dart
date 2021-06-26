import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';
import 'package:mezcalmos/TaxiApp/models/User.dart';

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;
  fireAuth.FirebaseAuth get auth => _auth;

  @override
  void onInit() {
    super.onInit();
    // _user.bindStream(_auth.authStateChanges());
    _auth.authStateChanges().listen((fireAuth.User? user) {
      if (user == null) {
        print('User is currently signed out!');
        _user.value = null;
      } else {
        _user.value = User.fromSnapshot(user);
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
