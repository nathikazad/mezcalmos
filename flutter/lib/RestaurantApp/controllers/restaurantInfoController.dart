import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
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
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        restaurant.value = Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: event.snapshot.value);
        restaurantPrimaryLanguage.value = restaurant.value?.primaryLanguage;
      }
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });
  }

  Future<void> setRestaurantName(String newName) async {
    mezDbgPrint(
        "------->>> ${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restaurant.value!.info.id)}/name");
    await _databaseHelper.firebaseDatabase
        .ref()
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
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant,
                providerId: restaurant.value!.info.id) +
            '/info')
        .child('image')
        .set(newImage);
  }

  Future<void> setSchedule(Schedule schedule) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderSchedule(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(schedule.toFirebaseFormattedJson());
  }

  Future<void> setPrimaryLanguage(LanguageType lang) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderPrimaryLanguage(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(lang.toFirebaseFormatString());
  }

  Future<void> setSecondaryLanguage(LanguageType? lang) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderSecondaryLanguage(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(lang?.toFirebaseFormatString() ?? null);
  }

  Future<void> setLocation(Location loc) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderLocation(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .set(loc.toFirebaseFormattedJson());
  }

// ----------------------------------------------------- ITEMS FUNCTIONS ----------------------------------------------------- //

  Future<void> addItem({required Item item, String? categoryId}) async {
    mezDbgPrint("Final item ===========================>>>>>${item.toJson()}");
    final DatabaseReference newItemNode;
    // adding to new category
    if (categoryId != null) {
      newItemNode = _databaseHelper.firebaseDatabase
          .ref()
          .child(itemsNode(uid: restaurantId, categoryId: categoryId))
          .push();
    }
    // adding to noCatgeory
    else {
      newItemNode = _databaseHelper.firebaseDatabase
          .ref()
          .child(noCategoryNode(uid: restaurantId))
          .push();
    }

    await newItemNode.set(item.toJson());
  }

  Future<void> editItem(
      {required Item item, required String itemId, String? categoryId}) async {
    mezDbgPrint("Final item ===========================>>>>>${item.toJson()}");

    // adding to new category
    if (categoryId != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(
              uid: restaurantId, itemId: itemId, categoryId: categoryId))
          .set(item.toJson());
    }
    // adding to noCatgeory
    else {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(uid: restaurantId, itemId: itemId))
          .set(item.toJson());
    }
  }

  Future<void> deleteItem({required String itemId, String? categoryId}) async {
    // ignore: unawaited_futures
    if (categoryId != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(
              uid: restaurantId, categoryId: categoryId, itemId: itemId))
          .remove();
    } else {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(uid: restaurantId, itemId: itemId))
          .remove();
    }
  }

  Future<void> switchItemAvailable(
      {required String itemId, required bool value, String? caytegoryId}) {
    mezDbgPrint(
        itemNode(uid: restaurantId, itemId: itemId, categoryId: caytegoryId) +
            "/available");
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(itemNode(
                uid: restaurantId, itemId: itemId, categoryId: caytegoryId) +
            "/available")
        .set(value);
  }

  Future<void> setItemCost(String itemId, num cost) {
    mezDbgPrint(itemNode(uid: restaurantId, itemId: itemId) + "/available");
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(itemNode(uid: restaurantId, itemId: itemId) + "/cost")
        .set(cost);
  }

  Future<void> switchChoiceAvailablity(
      {required String choiceId,
      required String optionId,
      required String itemId,
      required bool value,
      String? catgeoryId}) async {
    mezDbgPrint(value);
    mezDbgPrint(choiceNode(
            uid: restaurantId,
            itemId: itemId,
            optionId: optionId,
            categoryId: catgeoryId,
            choiceId: choiceId) +
        "/available");
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(choiceNode(
                uid: restaurantId,
                itemId: itemId,
                optionId: optionId,
                categoryId: catgeoryId,
                choiceId: choiceId) +
            "/available")
        .set(value)
        .catchError((e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    });
  }

  // ----------------------------------------------------- CATEGORIES ----------------------------------------------------- //

  Future<void> addCategory({required Category category}) async {
    final DatabaseReference categoryNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(menuNode(uid: restaurantId))
        .push();

    await categoryNode.set(category.toJson()).catchError((e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    });
  }

  Future<void> EditCatgeory(
      {required Category category, required String categoryId}) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(categoryNode(uid: restaurantId, categoryId: categoryId))
        .set(category.toJson());
  }

  Future<void> deleteCategory({required String categoryId}) async {
    // ignore: unawaited_futures
    _databaseHelper.firebaseDatabase
        .ref()
        .child(categoryNode(uid: restaurantId, categoryId: categoryId))
        .remove();
    mezDbgPrint("Deleting $categoryId");
    mezDbgPrint(categoryNode(uid: restaurantId, categoryId: categoryId));
  }
// ----------------------------------------------------- Images upload ----------------------------------------------------- //

  Future<String> uploadImgToDb(
      {required File imageFile, bool isCompressed = false}) async {
    String _uploadedImgUrl;
    final List<String> splitted = imageFile.path.split('.');
    final String imgPath =
        "restaurants/${restaurant.value?.info.id}/items/${getRandomString(8)}.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
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

  @override
  void onClose() {
    mezDbgPrint(
        "[+] RestaurantAuthController::dispose ---------> Was invoked ! $hashCode");

    _restaurantInfoListener?.cancel();
    _restaurantInfoListener = null;
    super.onClose();
  }
}
