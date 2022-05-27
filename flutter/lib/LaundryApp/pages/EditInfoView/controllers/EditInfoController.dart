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
  final Rxn<Laundry> laundry = Rxn<Laundry>();
  TextEditingController laundryNameController = TextEditingController();
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
  final Rxn<LaundryCosts> laundryCosts = Rxn();
  final Rxn<List<LaundryCostLineItem>> categories = Rxn();

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  void init() {
    // laundryInfoController.laundry.stream.
    laundry.value = laundryInfoController.laundry.value;
    //laundry = laundry
    if (laundry.value != null) {
      mezDbgPrint("Controlllller init =======>");

      laundryNameController.text = laundry.value?.info.name ?? '';
      settingSchedules();

      // laundryCosts.value = laundry.value!.laundryCosts;
      // laundry.value!.laundryCosts.lineItems
      //     .forEach((LaundryCostLineItem element) {
      //   categories.value!.add(element.copyWith());
      // });

      newLocation.value = laundry.value!.info.location;
      newImageUrl.value = laundry.value?.info.image ?? '';
      primaryLang.value = laundry.value!.primaryLanguage;
      secondaryLang.value = laundry.value!.secondaryLanguage;
    }
  }

  void settingSchedules() {
    mezDbgPrint("AFFFFFFECTIN clone -------------------------------->");
    newSchedule.value = Schedule.clone(laundry.value!.schedule!);
    schedulePreview.value = Schedule.clone(newSchedule.value!);
    oldSchedule.value = Schedule.clone(laundry.value!.schedule!);
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
        newLocation.value?.address != laundry.value?.info.location.address) {
      await laundryInfoController.setLocation(newLocation.value!);
    }
    if (primaryLang.value != null &&
        primaryLang.value != laundry.value?.primaryLanguage) {
      await laundryInfoController.setPrimaryLanguage(primaryLang.value!);
    }
    if (secondaryLang.value != null &&
        secondaryLang.value != laundry.value?.secondaryLanguage) {
      await laundryInfoController.setSecondaryLanguage(secondaryLang.value!);
    } else if (secondaryLang.value == null) {
      await laundryInfoController.setSecondaryLanguage(null);
    }

    if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
      await laundryInfoController.setSchedule(newSchedule.value!);
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
      if (value != primaryLang.value) {
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

  Future<void> editImage(context) async {
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

  Future<void> dispose() async {
    laundry.value = laundryInfoController.laundry.value;

    mezDbgPrint("Controlllller Dispose =======>");
    laundryNameController.text = laundry.value?.info.name ?? '';

    newLocation.value = laundry.value!.info.location;
    newImageUrl.value = laundry.value?.info.image ?? '';
    primaryLang.value = laundry.value!.primaryLanguage;
    secondaryLang.value = laundry.value!.secondaryLanguage;
  }
}
