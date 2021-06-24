import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class AuthController extends GetxController {

  FirebaseAuth  _auth  = FirebaseAuth.instance;
  Rxn<User>     _user  = Rxn<User>();

  User? get user    => _user.value;
  FirebaseAuth get auth  => _auth;

  
  @override
  void onInit() 
  {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> signUp(String email , String password) async
  {
      try 
      {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        Get.back();
      } 
      catch (e) 
      {
        Get.snackbar("Error creating your account!" , e.toString() , snackPosition: SnackPosition.BOTTOM);
      }
  }


  Future<void> signIn(String email , String password) async
  {
    await _auth.signInWithEmailAndPassword(email: email, password: password)
      .timeout(Duration(seconds: 5), onTimeout: () => Future.error(Exception("Timed out , Check your Internet.")))
      .then((value)
      {
        Get.snackbar(
          "Welcome Back :D",
          "Hello ${value.user?.displayName}, We are glad you're back!",
          colorText: Colors.white,
          backgroundColor: Colors.black87,
          snackPosition: SnackPosition.BOTTOM,
          snackStyle:  SnackStyle.FLOATING
        );
        
        TaxiInjectionHelper.toInjectAtSignIn();
      }, onError: ((Object e, StackTrace stackTrace) {
          Get.snackbar("Failed to Sign you in!" , e.toString() , snackPosition: SnackPosition.BOTTOM);
        }
      )
    );
    
  } 

  Future<void> signOut() async
  {
      try 
      {
        await _auth.signOut();
        TaxiInjectionHelper.revokeListenersOnSignOut();
      } 
      catch (e) 
      {
        Get.snackbar("Failed to Sign you out!" , e.toString() , snackPosition: SnackPosition.BOTTOM);
      }
  }

  
}