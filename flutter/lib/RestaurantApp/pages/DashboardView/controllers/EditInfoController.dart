import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/TabsView/controllers/ROpTabsViewViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpEditInfoView"]["controllers"]["ROpEditInfoController"];

//
class ROpEditInfoController {
  // instances //

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  ROpTabsViewViewController? tabsViewViewController;
  // TEXT INPUTS //
  TextEditingController restaurantNameTxt = TextEditingController();
  TextEditingController prRestaurantDescTxt = TextEditingController();
  TextEditingController scRestaurantDescTxt = TextEditingController();

  // OBS //

  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<Location> newLocation = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();
  final Rxn<LanguageType> editablePrLang = Rxn();
  final Rxn<LanguageType> editableScLang = Rxn();
  final Rxn<File> newImageFile = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool isAvailable = RxBool(false);
  final RxBool isApproved = RxBool(true);

  RxDouble cuurentPage = RxDouble(0);
// LATE VARS
  late int restaurantId;

  int? newDescId;
// INIT //

  Future<void> init({
    required int restaurantId,
    ROpTabsViewViewController? tabsViewViewController,
  }) async {
    this.restaurantId = restaurantId;
    mezDbgPrint("INIT EDIT PROFILE VIEW =======>$restaurantId");
    this.tabsViewViewController = tabsViewViewController;
    await fetchRestaurant();
    _updateResTInfo();
  }

  Future<void> fetchRestaurant() async {
    restaurant.value =
        await get_restaurant_by_id(id: restaurantId, withCache: false);
    _serviceStatus.value =
        await get_restaurant_status(restaurantId: restaurantId);
    isApproved.value =
        await get_restaurant_approved(restaurantId: restaurantId) ?? false;
  }

  void _updateResTInfo() {
    if (restaurant.value != null) {
      isAvailable.value = restaurant.value!.state.available;
      restaurantNameTxt.text = restaurant.value?.info.name ?? '';

      newLocation.value = restaurant.value!.info.location;
      newImageUrl.value = restaurant.value?.info.image;
      primaryLang.value = restaurant.value!.primaryLanguage;
      secondaryLang.value = restaurant.value!.secondaryLanguage;
      editablePrLang.value = restaurant.value!.primaryLanguage;
      editableScLang.value = restaurant.value!.secondaryLanguage;

      prRestaurantDescTxt.text =
          restaurant.value?.info.description?[primaryLang] ?? '';
      scRestaurantDescTxt.text =
          restaurant.value?.info.description?[secondaryLang] ?? '';
    }
  }

  Future<void> updateRestaurantInfo() async {
    if (!fd.mapEquals(restaurant.value!.info.description, _contructDesc())) {
      if (restaurant.value!.info.descriptionId != null) {
        _contructDesc().forEach((LanguageType key, String value) {
          update_translation(
              langType: key,
              value: value,
              translationId: restaurant.value!.info.descriptionId!);
        });
      } else {
        newDescId = await insert_translation(
            translation: _contructDesc(),
            serviceType: ServiceProviderType.Restaurant,
            serviceId: restaurantId);
      }
    }

    await update_restaurant_info(
        id: restaurantId,
        restaurant: restaurant.value!.copyWith(
          primaryLanguage: primaryLang.value,
          userInfo: restaurant.value!.info.copyWith(
              name: restaurantNameTxt.text,
              location: newLocation.value,
              image: newImageUrl.value,
              descId: newDescId),
        ));
  }

  void switchAv(bool value) {
    isAvailable.value = value;
  }

  void setNewLocation(Location? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  void changePrimaryLang(LanguageType value) {
    editablePrLang.value = value;
    editableScLang.value = value.toOpLang();
  }

  Future<void> switchSelfDelivery(bool v) async {
    try {
      final bool? res =
          await switch_restaurant_self_delivery(id: restaurantId, value: v);
      if (res == true) {
        await fetchRestaurant();
      }
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  bool validateSecondaryLanguUpdate(LanguageType value) {
    if (primaryLang.value != null) {
      if (value != primaryLang.value) {
        return true;
      } else {
        return false;
      }
    } else {
      Get.snackbar("${_i18n()["error"]}", "${_i18n()["selectPrimaryFirst"]}");
      return false;
    }
  }

  Future<void> turnOffOrders() async {
    _serviceStatus.value = await update_restaurant_status(
        id: restaurantId, status: ServiceStatus.Closed_temporarily);
  }

  Future<void> turnOnOrders() async {
    _serviceStatus.value = await update_restaurant_status(
        id: restaurantId, status: ServiceStatus.Open);
  }

  //
  bool get getAvailable {
    return restaurant.value!.state.available;
  }

  Future<void> editImage(context) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      imageLoading.value = true;

      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          newImageFile.value = File(_res.path);
        }
        imageLoading.value = false;
      } catch (e) {
        imageLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  bool _updatePrDesc() {
    return (prRestaurantDescTxt.text != '' &&
        prRestaurantDescTxt.text !=
            restaurant.value?.info.description?[primaryLang]);
  }

  bool _updateScDesc() {
    return (scRestaurantDescTxt.text != '' &&
        scRestaurantDescTxt.text !=
            restaurant.value?.info.description?[secondaryLang]);
  }

  LanguageMap _contructDesc() {
    return {
      primaryLang.value!: prRestaurantDescTxt.text,
      secondaryLang.value!: scRestaurantDescTxt.text
    };
  }

  String getPageTitle() {
    switch (cuurentPage.value.toInt()) {
      case 0:
        return '${_i18n()["dashboard"]}';
        break;
      case 1:
        return '${_i18n()["informations"]}';
        break;
      case 2:
        return '${_i18n()["schedule"]}';
        break;
      case 3:
        return '${_i18n()["payments"]}';
        break;
      case 4:
        return 'Reviews';
      case 5:
        return 'Operators';
      case 6:
        return 'Drivers';
      case 7:
        return 'Delivery Cost';
        break;
      default:
        return "";
    }
  }

  void dispose() {
    newLocation.close();
    newImageUrl.close();
    primaryLang.close();
    secondaryLang.close();
    restaurant.close();
    restaurantNameTxt.clear();

    Get.delete<RestaurantInfoController>();
  }
}
