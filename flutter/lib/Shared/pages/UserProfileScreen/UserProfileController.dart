import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum UserProfileMode { Edit, Show }

class UserProfileController {
  final AuthController _authController = Get.find<AuthController>();
  TextEditingController textEditingController = TextEditingController();
  // Picker object.
  final imPicker.ImagePicker picker = imPicker.ImagePicker();
  String? originalImgUrl;
  String? compressedImgUrl;
  Rx<UserProfileMode> stateMode = UserProfileMode.Show.obs;
  Rxn<imPicker.XFile> userImg = Rxn();
  Rxn<Uint8List> userImgBytes = Rxn();
  Rxn<String> userName = Rxn();
  Rxn<String> errorReport = Rxn();

  bool didUserChangedInfos() {
    return (userName.value != _authController.user!.name &&
            userName.value != null &&
            userName.value!.length >= 3) ||
        userImg.value != null;
  }

  /// Set Error Text to be shown to the user that takes [duration] as a rendring out time.
  void setErrorTextForXDuration(String error,
      {Duration duration = const Duration(seconds: 5)}) {
    errorReport.value = error;
    Future.delayed(duration, () {
      errorReport.value = null;
    });
  }

  /// called when user actually clicks Cancel or Clicked on Pick Image (we reset back to the initial states)
  void reset() {
    userImg.value = null;
    userImgBytes.value = null;
    userName.value = _authController.user!.name!;
    originalImgUrl = null;
    compressedImgUrl = null;
  }

  void setTextFieldText(String value) {
    this.textEditingController.text = value;
  }

  void setUserProfileMode(UserProfileMode _mode) {
    this.stateMode.value = _mode;
  }

  void disposeController() {
    textEditingController.dispose();
  }

  bool checkIfUserHasAllInfosSet() {
    return _authController.isDisplayNameSet() && _authController.isUserImgSet();
  }

  /// Check if the name only contains alphabet letters, and not null
  bool nameIsValidString() {
    if (userName.value != null) {
      return userName.value!.replaceAll(' ', '').isAlphabetOnly;
    }
    return false;
  }

  /// This should be called on initState of the page, In order to do Initial Setup and checks.
  void initSetup() {
    // first we check the user if he has everything Set
    if (checkIfUserHasAllInfosSet()) {
      // we set the TextField's Text to user name
      userName.value = _authController.user!.name!;
    } else {
      // in case Name null then we set userName to empty String cuz TextField does not accept null.
      userName.value = _authController.user?.name ?? "";
      // and we straight forward go to edit mode.
      setUserProfileMode(UserProfileMode.Edit);
    }

    // Initial TextFieldValue.
    this.setTextFieldText(userName.value!);
  }
}
