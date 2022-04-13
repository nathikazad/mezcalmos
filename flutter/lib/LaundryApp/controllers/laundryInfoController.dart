import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  Rxn<Laundry> laundry = Rxn();
  StreamSubscription? _laundryInfoListener;
  Future<void> init(String laundryId) async {
    mezDbgPrint(
        "--------------------> Start listening service providers info  ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _laundryInfoListener?.cancel();
    _laundryInfoListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        .listen((Event event) {
      mezDbgPrint(
          "eveeeeeeennnnnnnnnnnnnnnnnnnnnnnnnnnnt ====> ${event.snapshot.value} ");
      if (event.snapshot.value != null) {
        laundry.value = Laundry.fromLaundryData(
            laundryId: laundryId, laundryData: event.snapshot.value);
      }
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
  }

  void setSchedule(Schedule newSchedule) {

  }



  Future<void> setLaundryName(String newName) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundry.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
                orderType: OrderType.Laundry,
                providerId: laundry.value!.info.id) +
            '/info')
        .child('name')
        .set(newName);
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] LaundryAuthController::dispose ---------> Was invoked ! $hashCode");

    _laundryInfoListener?.cancel();
    _laundryInfoListener = null;
    super.onClose();
  }
}
