import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundryInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  late String laundryId;
  Rxn<LanguageType> laundryPrimaryLanguage = Rxn();

  Rxn<Laundry> laundry = Rxn();
  StreamSubscription? _laundryInfoListener;
  Future<void> init(String laundryId) async {
    this.laundryId = laundryId;
    mezDbgPrint(
        "--------------------> Start listening service providers info  ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundryId)}");
    await _laundryInfoListener?.cancel();
    _laundryInfoListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Laundry, providerId: laundryId))
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        laundry.value = Laundry.fromLaundryData(
            laundryId: laundryId, laundryData: event.snapshot.value);
        laundryPrimaryLanguage.value = laundry.value?.primaryLanguage;
      }
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
  }

  Future<String> uploadUserImgToFbStorage(
      {required File imageFile, bool isCompressed = false}) async {
    String _uploadedImgUrl;
    final List<String> splitted = imageFile.path.split('.');
    final String imgPath =
        "laundries/${laundry.value?.info.id}/avatar/${laundry.value?.info.id}.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .putFile(imageFile);
    } on firebase_core.FirebaseException catch (e) {
      mezDbgPrint(e.message.toString());
    } finally {
      _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .getDownloadURL();
    }

    return _uploadedImgUrl;
  }

  Future<void> setLaundryName(String newName) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundry.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Laundry,
                providerId: laundry.value!.info.id) +
            '/info')
        .child('name')
        .set(newName);
  }

  Future<void> setLaundryImage(String newImage) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Laundry, providerId: laundry.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Laundry,
                providerId: laundry.value!.info.id) +
            '/info')
        .child('image')
        .set(newImage);
  }

  Future<void> setSchedule(Schedule schedule) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderSchedule(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(schedule.toFirebaseFormattedJson());
  }

  Future<void> setCosts(LaundryCosts laundryCosts) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderCosts(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(laundryCosts.toFirebasFormat());
  }

  Future<void> setAverageNumberOfDays(num averageNumberOfDays) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderAverageNumberOfDays(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(averageNumberOfDays);
  }

  Future<void> setMinCost(num minCost) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderMinCost(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(minCost);
  }

  Future<void> setPrimaryLanguage(LanguageType lang) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderPrimaryLanguage(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(lang.toFirebaseFormatString());
  }

  Future<void> setSecondaryLanguage(LanguageType? lang) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderSecondaryLanguage(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(lang?.toFirebaseFormatString() ?? null);
  }

  Future<void> setLocation(Location loc) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderLocation(
            orderType: OrderType.Laundry, providerId: laundryId))
        .set(loc.toFirebaseFormattedJson());
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
