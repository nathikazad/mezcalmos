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
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

class RestaurantInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  late String restaurantId;
  Rxn<LanguageType> restaurantPrimaryLanguage = Rxn();

  Rxn<Restaurant> restaurant = Rxn();
  @override
  void init({required String restId}) {
    restaurantId = restId;
  }

  StreamSubscription? _restaurantInfoListener;
  Stream<Restaurant?> getRestaurant(String restaurantId) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .map<Restaurant?>((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        return Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: event.snapshot.value);
      }
      return null;
    });
  }

  Future<Restaurant> getRestaurantAsFuture(String restId) async {
    mezDbgPrint(
        "PAth ==========>${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restId)}");
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restId))
        .once()
        .then<Restaurant>((DatabaseEvent event) {
      return Restaurant.fromRestaurantData(
          restaurantId: restaurantId, restaurantData: event.snapshot.value);
    });
  }

  // Future<void> init(String restaurantId) async {
  //   this.restaurantId = restaurantId;
  //   mezDbgPrint(
  //       "--------------------> Start listening service providers info  ${serviceProviderInfos(orderType: OrderType.Restaurant, providerId: restaurantId)}");
  //   await _restaurantInfoListener?.cancel();
  //   _restaurantInfoListener = _databaseHelper.firebaseDatabase
  //       .ref()
  //       .child(serviceProviderInfos(
  //           orderType: OrderType.Restaurant, providerId: restaurantId))
  //       .onValue
  //       .listen((DatabaseEvent event) {
  //     if (event.snapshot.value != null) {
  //       restaurant.value = Restaurant.fromRestaurantData(
  //           restaurantId: restaurantId, restaurantData: event.snapshot.value);
  //       restaurantPrimaryLanguage.value = restaurant.value?.primaryLanguage;
  //     }
  //   }, onError: (error) {
  //     mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
  //   });
  // }

  Future<void> setRestaurantName(String newName) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant, providerId: restaurantId) +
            '/info')
        .child('name')
        .set(newName);
  }

  Future<void> setRestaurantDesc(LanguageMap newDesc) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant, providerId: restaurantId) +
            '/details')
        .child('description')
        .set(newDesc.toFirebaseFormat());
  }

  Future<void> setRestaurantImage(String newImage) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
                orderType: OrderType.Restaurant, providerId: restaurantId) +
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
    mezDbgPrint(
        "Adding  item to db ===========================>>>>>${item.toJson()}");
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

  Future<void> editItemPosition(
      {required int position,
      required String itemId,
      String? categoryId}) async {
    // adding to new category
    if (categoryId != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(
                  uid: restaurantId, itemId: itemId, categoryId: categoryId) +
              "/position")
          .set(position);
    }
    // adding to noCatgeory
    else {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(uid: restaurantId, itemId: itemId) + "/position")
          .set(position);
    }
  }

  Future<void> deleteItem({required String itemId, String? categoryId}) async {
    // ignore: unawaited_futures
    if (categoryId != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(
              uid: restaurantId, categoryId: categoryId, itemId: itemId))
          .remove()
          .catchError((e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      });
    } else {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(itemNode(uid: restaurantId, itemId: itemId))
          .remove()
          .catchError((e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      });
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

  Future<String?> addCategory({required Category category}) async {
    final DatabaseReference categoryNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(dailyMenuNode(uid: restaurantId))
        .push();

    await categoryNode.set(category.toJson()).catchError((e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    });
    return categoryNode.key;
  }

  Future<void> editCategory(
      {required Category category, required String categoryId}) async {
    if (category.name != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(
              categoryNode(uid: restaurantId, categoryId: categoryId) + "/name")
          .set(category.name!.toFirebaseFormat());
    }
    if (category.dialog != null) {
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(categoryNode(uid: restaurantId, categoryId: categoryId) +
              "/dialog")
          .set(category.dialog!.toFirebaseFormat());
    }
  }

  Future<void> editCategoryPosition(
      {required int position, required String categoryId}) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(categoryNode(uid: restaurantId, categoryId: categoryId) +
            "/position")
        .set(position);
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

  // ----------------------------------------------------- Options ----------------------------------------------------- //
  Future<void> deleteOption(
      {required String itemId,
      required String optionId,
      String? categoryId}) async {
    // ignore: unawaited_futures
    _databaseHelper.firebaseDatabase
        .ref()
        .child(optionNode(
            uid: restaurantId,
            itemId: itemId,
            optionId: optionId,
            categoryId: categoryId))
        .remove();
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

  // ----------------------------------------------------- Specials ----------------------------------------------------- //
  Future<void> addSpecialItem({
    required Item item,
  }) async {
    mezDbgPrint("Adding special item ---------");
    final DatabaseReference newItemNode;

    newItemNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(currentSpecialsNode(uid: restaurantId))
        .push();

    await newItemNode.set(item.toJson());
  }

  Future<void> removeSpecial({
    required Item item,
  }) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(currentSpecialsNode(uid: restaurantId) + "/${item.id}")
        .remove();
    final DatabaseReference newItemNode;

    newItemNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(pastSpecialsNode(uid: restaurantId))
        .push();

    await newItemNode.set(item.toJson());
  }

  Future<void> addToSpecials({
    required Item item,
  }) async {
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(pastSpecialsNode(uid: restaurantId) + "/${item.id}")
        .remove();
    final DatabaseReference newItemNode;

    newItemNode = _databaseHelper.firebaseDatabase
        .ref()
        .child(currentSpecialsNode(uid: restaurantId))
        .push();

    await newItemNode.set(item.toJson());
  }

  // ----------------------------------------------------- Stripe ----------------------------------------------------- //
  Future<void> setCardPayment(
    bool value,
  ) async {
    mezDbgPrint("Setting card payment to ====>$value");
    await _databaseHelper.firebaseDatabase
        .ref()
        .child(acceptedPaymentNode(uid: restaurantId) + "/card/")
        .set(value);
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
