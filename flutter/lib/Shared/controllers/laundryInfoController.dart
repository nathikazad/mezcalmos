import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
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
        .reference()
        .child(serviceProviderInfos(orderType: OrderType.Laundry))
        .once()
        .then<List<Laundry>>((snapshot) {
      List<Laundry> laundries = [];
      snapshot.value.forEach((dynamic key, dynamic value) {
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
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .once()
        .then<Laundry>((snapshot) {
      return Laundry.fromLaundryData(
          laundryId: laundryId, laundryData: snapshot.value);
    });
  }
}
