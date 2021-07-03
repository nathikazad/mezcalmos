import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';

class SmsController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;

  RxString _phoneNumber = "".obs;
  RxString _otpCode = "".obs;

  fireAuth.FirebaseAuth get auth => _auth;

  // First Screen when putting a valid phone number , this will gets updated !
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String val) => _phoneNumber.value = val;

  // After Setting the OTP code this will gets updated !
  String get otpCode => _otpCode.value;
  set otpCode(String val) => _otpCode.value = val;

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  @override
  void dispose() {
    super.dispose();
    print("--------------------> SmsController Auto Disposed !");
  }
}
