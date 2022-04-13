import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class EditInfoController {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn<Laundry>();
  TextEditingController laundryNameController = TextEditingController();
  String currentImageUrl = '';
  Rxn<String> newImageUrl = Rxn();
  Rxn<Location> newLocation = Rxn();
  Rxn<Schedule> newSchedule = Rxn<Schedule>();

  Rxn<LanguageType> primaryLang = Rxn();
  Rxn<LanguageType> secondaryLang = Rxn();
  Rxn<File> newImageFile = Rxn();

  RxBool imageLoading = RxBool(false);
  RxBool btnClicked = RxBool(false);
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  // Rx<Null> secondaryLang = null.obs;

  void init() {
    laundry = laundryInfoController.laundry;
    if (laundry.value != null) {
      mezDbgPrint("Controlllller init =======>");
      laundryNameController.text = laundry.value?.info.name ?? '';
      currentImageUrl = laundry.value?.info.image ?? '';
      newLocation.value = laundry.value!.info.location;
      newImageUrl.value = laundry.value?.info.image ?? '';
      primaryLang.value = laundry.value!.primaryLanguage;
      secondaryLang.value = laundry.value!.secondaryLanguage;
      newSchedule.value = laundry.value!.schedule;
    }
  }

  Future updateLaundryInfo() async {
    mezDbgPrint("${newLocation.value!.address}");
    btnClicked.value = true;
    if (laundryNameController.text != '' &&
        laundryNameController.text != laundry.value?.info.name) {
      await laundryInfoController.setLaundryName(laundryNameController.text);
    }
    if (newImageFile.value != null) {
      await laundryInfoController
          .uploadUserImgToFbStorage(imageFile: newImageFile.value!)
          .then((String value) {
        laundryInfoController.setLaundryImage(value);
      });
    }
    if (newLocation.value != null &&
        newLocation.value?.address != laundry.value?.info.location?.address) {
      await laundryInfoController.setLocation(newLocation.value!);
    }
    btnClicked.value = false;
  }

  void setNewLocation(Location? newLoc) {
    mezDbgPrint("The new loc ==========> $newLoc");
    if (newLoc != null) {
      newLocation.value = newLoc;
    }
  }

  bool validatePrimaryLanguUpdate(LanguageType value) {
    if (secondaryLang.value == null) {
      return true;
    } else if (value != secondaryLang.value) {
      return true;
    } else {
      Get.snackbar("Error", "Select different language then primary language");
      return false;
    }
  }

  bool validateSecondaryLanguUpdate(LanguageType value) {
    if (primaryLang.value != null) {
      mezDbgPrint("value : $value  ====================> $primaryLang ");
      if (value != primaryLang.value) {
        //  secondaryLang.value = value;
        //  mezDbgPrint("set Secondary while primary  ====================> ${primaryLang} ");
        return true;
      } else {
        Get.snackbar(
            "Error", "Select different language then primary language");
        return false;
      }
    } else {
      Get.snackbar("Error", "Select primary first");
      return false;
    }
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

  //

  void editImage(context) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);
    mezDbgPrint("------------>  $_from");
    if (_from != null) {
      imageLoading.value = true;
      //  widget.userProfileController.reset();
      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        mezDbgPrint("TRYYYYYING UPLOAD IMAGE");

        if (_res != null) {
          mezDbgPrint(_res);
          mezDbgPrint(_res.readAsBytes());
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
}

enum LanguagePriority { PrimaryLanguage, SecondaryLanguage }
