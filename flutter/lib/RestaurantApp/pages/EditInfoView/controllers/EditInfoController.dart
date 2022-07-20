import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["EditInfoView"]["controllers"]["EditInfoController"];

//
class ROpEditInfoController {
  RestaurantInfoController restaurantInfoController =
      Get.find<RestaurantInfoController>();
  final Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  TextEditingController restaurantNameTxt = TextEditingController();
  final Rxn<String> newImageUrl = Rxn();
  final Rxn<Location> newLocation = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();
  final Rxn<File> newImageFile = Rxn();

  final RxBool imageLoading = RxBool(false);
  final RxBool btnClicked = RxBool(false);
  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  void init() {
    restaurant.value = restaurantInfoController.restaurant.value;

    if (restaurant.value != null) {
      restaurantNameTxt.text = restaurant.value?.info.name ?? '';
      settingSchedules();
      newLocation.value = restaurant.value!.info.location;
      newImageUrl.value = restaurant.value?.info.image ?? '';
      primaryLang.value = restaurant.value!.primaryLanguage;
      secondaryLang.value = restaurant.value!.secondaryLanguage;
    }
  }

  void settingSchedules() {
    newSchedule.value = Schedule.clone(restaurant.value!.schedule!);
    schedulePreview.value = Schedule.clone(newSchedule.value!);
    oldSchedule.value = Schedule.clone(restaurant.value!.schedule!);
  }

  Future<void> updateLaundryInfo() async {
    btnClicked.value = true;
    if (restaurantNameTxt.text != '' &&
        restaurantNameTxt.text != restaurant.value?.info.name) {
      await restaurantInfoController.setRestaurantName(restaurantNameTxt.text);
    }
    if (newImageFile.value != null) {
      await restaurantInfoController
          .uploadImgToDb(imageFile: newImageFile.value!)
          .then((String value) {
        restaurantInfoController.setRestaurantImage(value);
      });
    }
    if (newLocation.value != null &&
        newLocation.value?.address != restaurant.value?.info.location.address) {
      await restaurantInfoController.setLocation(newLocation.value!);
    }
    if (primaryLang.value != null &&
        primaryLang.value != restaurant.value?.primaryLanguage) {
      await restaurantInfoController.setPrimaryLanguage(primaryLang.value!);
    }
    if (secondaryLang.value != null &&
        secondaryLang.value != restaurant.value?.secondaryLanguage) {
      await restaurantInfoController.setSecondaryLanguage(secondaryLang.value!);
    } else if (secondaryLang.value == null) {
      await restaurantInfoController.setSecondaryLanguage(null);
    }

    if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
      await restaurantInfoController.setSchedule(newSchedule.value!);
    }

    btnClicked.value = false;
  }

  void setNewLocation(Location? newLoc) {
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  bool validatePrimaryLanguUpdate(LanguageType value) {
    if (value != secondaryLang.value) {
      return true;
    } else {
      return false;
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

  //

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

  Future<void> dispose() async {
    restaurant.close();
    restaurantNameTxt.clear();

    newLocation.close();
    newImageUrl.close();
    primaryLang.close();
    secondaryLang.close();
  }
}
