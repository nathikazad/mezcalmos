import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class EditInfoController {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn();
  TextEditingController laundryNameController = TextEditingController();
  String currentImageUrl = '';

  Rx<String?> primaryLang = null.obs;
  Rx<String?> secondaryLang = null.obs;

  Future init() async {
    laundry = laundryInfoController.laundry;
    if (laundry.value != null) {
      laundryNameController.text = laundry.value?.info.name ?? '';
      currentImageUrl = laundry.value?.info.image ?? '';
    }
  }

  void setPrimaryLang(String value) {
    //  mezDbgPrint(value);
    primaryLang.value = value;
    //  mezDbgPrint(primaryLang.value);
  }

  void setSecondaryLang(String value) {
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
  }
}

enum LanguagePriority { PrimaryLanguage, SecondaryLanguage }
