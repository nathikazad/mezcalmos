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
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  late String restaurantId;
  Rxn<LanguageType> restaurantPrimaryLanguage = Rxn();

  Rxn<Restaurant> restaurant = Rxn();
  StreamSubscription? _restaurantInfoListener;
  Future<void> init(String restaurantId) async {
    this.restaurantId = restaurantId;
    mezDbgPrint(
        "--------------------> Start listening service providers info  ${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restaurantId)}");
    await _restaurantInfoListener?.cancel();
    _restaurantInfoListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((Event event) {
      mezDbgPrint(
          "eveeeeeeennnnnnnnnnnnnnnnnnnnnnnnnnnnt ====> ${event.snapshot.value} ");
      if (event.snapshot.value != null) {
        restaurant.value = Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: event.snapshot.value);
        restaurantPrimaryLanguage.value = restaurant.value?.primaryLanguage;
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
        "laundries/${restaurant.value?.info.id}/avatar/${restaurant.value?.info.id}.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
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

  Future<void> setRestaurantName(String newName) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restaurant.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant,
                providerId: restaurant.value!.info.id) +
            '/info')
        .child('name')
        .set(newName);
  }

  Future<void> setRestaurantImage(String newImage) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restaurant.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant,
                providerId: restaurant.value!.info.id) +
            '/info')
        .child('image')
        .set(newImage);
  }

  Future<void> setSchedule(Schedule schedule) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderSchedule(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(schedule.toFirebaseFormattedJson());
  }

  Future<void> setPrimaryLanguage(LanguageType lang) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderPrimaryLanguage(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(lang.toFirebaseFormatString());
  }

  Future<void> setSecondaryLanguage(LanguageType? lang) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderSecondaryLanguage(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(lang?.toFirebaseFormatString() ?? null);
  }

  Future<void> setLocation(Location loc) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderLocation(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(loc.toFirebaseFormattedJson());
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] RestaurantAuthController::dispose ---------> Was invoked ! $hashCode");

    _restaurantInfoListener?.cancel();
    _restaurantInfoListener = null;
    super.onClose();
  }
}
