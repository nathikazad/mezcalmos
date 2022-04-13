import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class EditInfoController {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn<Laundry>();
  TextEditingController laundryNameController = TextEditingController();
  String currentImageUrl = '';

  Rxn<String> primaryLang = Rxn<String>();
  Rxn<String> secondaryLang = Rxn<String>();
  // Rx<Null> secondaryLang = null.obs;

  Future init() async {
    laundry = laundryInfoController.laundry;
    if (laundry.value != null) {
      laundryNameController.text = laundry.value?.info.name ?? '';
      currentImageUrl = laundry.value?.info.image ?? '';
      primaryLang.value = toLanguageName(laundry.value!.primaryLanguage);
      secondaryLang.value = toLanguageName(laundry.value!.secondaryLanguage);
    }
  }

  void setPrimaryLang(String? value) {
    //  mezDbgPrint(value);
    if (secondaryLang.value == null) {
      primaryLang.value = value;
    } else if (value != secondaryLang.value) {
      primaryLang.value = value;
    } else {
      Get.snackbar("Error", "Select different language then primary language");
    }
    mezDbgPrint(primaryLang.value);
  }

  void setSecondaryLang(String? value) {
    if (primaryLang.value != null) {
      if (value != primaryLang) {
        secondaryLang.value = value;
      } else {
        Get.snackbar(
            "Error", "Select different language then primary language");
      }
    } else {
      Get.snackbar("Error", "Select primary first");
    }
    mezDbgPrint(secondaryLang.value);
  }

  String? toLanguageName(LanguageType? languageType) {
    if (languageType != null) {
      switch (languageType) {
        case LanguageType.EN:
          return "English";
        case LanguageType.ES:
          return "Spanish";

        default:
          return null;
      }
    } else {
      return null;
    }
  }
}

enum LanguagePriority { PrimaryLanguage, SecondaryLanguage }
