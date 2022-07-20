import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["EditInfoView"]["controllers"]["EditInfoController"];

//
class EditInfoController {
  late OpLaundryInfoController laundryInfoController;

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
  late String laundryId;

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  Future<void> init({required String laundryID}) async {
    laundryId = laundryID;
    Get.put(OpLaundryInfoController(), permanent: false);
    laundryInfoController = Get.find<OpLaundryInfoController>();
    laundry.value = await laundryInfoController.getLaundryAsFuture(laundryId);

    if (laundry.value != null) {
      laundryNameController.text = laundry.value?.info.name ?? '';
      settingSchedules();
      newLocation.value = laundry.value!.info.location;
      newImageUrl.value = laundry.value?.info.image ?? '';
      primaryLang.value = laundry.value!.primaryLanguage;
      secondaryLang.value = laundry.value!.secondaryLanguage;
    }
  }

  void settingSchedules() {
    newSchedule.value = Schedule.clone(laundry.value!.schedule!);
    schedulePreview.value = Schedule.clone(newSchedule.value!);
    oldSchedule.value = Schedule.clone(laundry.value!.schedule!);
  }

  Future<void> updateLaundryInfo() async {
    btnClicked.value = true;
    if (laundryNameController.text != '' &&
        laundryNameController.text != laundry.value?.info.name) {
      await laundryInfoController.setLaundryName(
          laundryId: laundryId, newName: laundryNameController.text);
    }
    if (newImageFile.value != null) {
      await laundryInfoController
          .uploadUserImgToFbStorage(
              laundryId: laundryId, imageFile: newImageFile.value!)
          .then((String value) {
        laundryInfoController.setLaundryImage(
            laundryId: laundryId, newImage: value);
      });
    }
    if (newLocation.value != null &&
        newLocation.value?.address != laundry.value?.info.location.address) {
      await laundryInfoController.setLocation(
          laundryId: laundryId, loc: newLocation.value!);
    }
    if (primaryLang.value != null &&
        primaryLang.value != laundry.value?.primaryLanguage) {
      await laundryInfoController.setPrimaryLanguage(
          laundryId: laundryId, lang: primaryLang.value!);
    }
    if (secondaryLang.value != null &&
        secondaryLang.value != laundry.value?.secondaryLanguage) {
      await laundryInfoController.setSecondaryLanguage(
          laundryId: laundryId, lang: secondaryLang.value!);
    } else if (secondaryLang.value == null) {
      await laundryInfoController.setSecondaryLanguage(
          laundryId: laundryId, lang: null);
    }

    if (newSchedule.value != null && newSchedule.value != oldSchedule.value) {
      await laundryInfoController.setSchedule(
          laundryId: laundryId, schedule: newSchedule.value!);
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

  void dispose() {
    Get.delete<OpLaundryInfoController>(force: true);
  }
}
