import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

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
      
      try 
      {
        await _auth.signInWithEmailAndPassword(email: email, password: password).timeout(Duration(seconds: 5), onTimeout: () => Future.error(Exception("Timed out , Check your Internet.")));
      } 
      catch (e) 
      {
        Get.snackbar("Failed to Sign you in!" , e.toString() , snackPosition: SnackPosition.BOTTOM);
      }
  }


  Future<void> signOut() async
  {
      try 
      {
        
        OrderController refController = Get.find<OrderController>();
        await refController.dispose();
        await _auth.signOut();

      } 
      catch (e) 
      {
        Get.snackbar("Failed to Sign you out!" , e.toString() , snackPosition: SnackPosition.BOTTOM);
      }
  }

  
}