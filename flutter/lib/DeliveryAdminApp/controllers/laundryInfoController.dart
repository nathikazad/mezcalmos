import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryInfoController extends GetxController {
  LanguageController lang = Get.find<LanguageController>();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  @override
  void onInit() {
    super.onInit();
    print("--------------------> LaundrysInfoController Initialized !");
  }

  Future<List<Laundry>> getLaundries() {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(orderType: OrderType.Laundry))
        .once()
        .then<List<Laundry>>((DatabaseEvent event) {
      final List<Laundry> laundries = [];
      (event.snapshot.value as dynamic).forEach((key, value) {
        try {
          laundries
              .add(Laundry.fromLaundryData(laundryId: key, laundryData: value));
        } catch (e) {
          print(e);
        }
      });
      return laundries;
    });
  }

  Future<Laundry> getLaundry(String laundryId) async {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .once()
        .then<Laundry>((DatabaseEvent event) {
      return Laundry.fromLaundryData(
          laundryId: laundryId, laundryData: event.snapshot.value);
    });
  }

  Future<ServerResponse> createLaundry(
      {required String laundryName,
      required String laundryPhoneOrEmail}) async {
    final HttpsCallable createLaundryFunc =
        FirebaseFunctions.instance.httpsCallable('laundry-createLaundry');
    try {
      final HttpsCallableResult<dynamic> response = await createLaundryFunc
          .call({
        "laundryName": laundryName,
        "emailIdOrPhoneNumber": laundryPhoneOrEmail
      });
      mezDbgPrint('HttpsCallableResult response: ${response.data}');
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(
        ResponseStatus.Error,
        errorMessage: "Server Error",
        errorCode: "serverError",
      );
    }
  }
}
