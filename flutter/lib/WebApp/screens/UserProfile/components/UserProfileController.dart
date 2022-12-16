import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
// import 'package:mezcalmos/Shared/controllers/authController.dart';

// ignore: constant_identifier_names
enum UserProfileMode { Edit, Show }

class UserProfileController {
  final FirbaseAuthController _authController =
      Get.find<FirbaseAuthController>();
  TextEditingController textEditingController = TextEditingController();
  // Picker object.
  final imPicker.ImagePicker picker = imPicker.ImagePicker();
  String? originalImgUrl;
  String? compressedImgUrl;
  Rx<UserProfileMode> stateMode = UserProfileMode.Show.obs;
  Rxn<imPicker.XFile> userImg = Rxn<imPicker.XFile>();
  Rxn<Uint8List> userImgBytes = Rxn<Uint8List>();
  Rxn<String> userName = Rxn<String>();
  Rxn<String> errorReport = Rxn<String>();
  DateTime? userCreationTime;

  // bool didUserChangedInfos() {
  //   return userName.value != _authController.user?.name &&
  //       userName.value != null &&
  //       userName.value!.length >= 4 &&
  //       (userImg.value != null ||
  //           _authController.user?.image != defaultUserImgUrl);
  // }

  /// Set Error Text to be shown to the user that takes [duration] as a rendring out time.
  void setErrorTextForXDuration(String error,
      {Duration duration = const Duration(seconds: 5)}) {
    errorReport.value = error;
    Future<void>.delayed(duration, () {
      errorReport.value = null;
    });
  }

  /// called when user actually clicks Cancel or Clicked on Pick Image (we reset back to the initial states)
  void reset() {
    userImg.value = null;
    userImgBytes.value = null;
    originalImgUrl = null;
    compressedImgUrl = null;
    if (userName.value == _authController.user?.name) {
      userName.value = _authController.user?.name;
    }
  }

  void setTextFieldText(String value) {
    textEditingController.text = value;
  }

  void setUserProfileMode(UserProfileMode _mode) {
    stateMode.value = _mode;
  }

  void disposeController() {
    textEditingController.dispose();
  }

  bool checkIfUserHasAllInfosSet() {
    return _authController.isDisplayNameSet() && _authController.isUserImgSet();
  }

  /// Check if the name only contains alphabet letters, and not null
  bool nameLengthIsValid() {
    return userName.value != null &&
        userName.value!.isNotEmpty &&
        userName.value!.replaceAll(' ', '').length >= 4;
  }

  /// This should be called on initState of the page, In order to do Initial Setup and checks.
  void initSetup() {
    userCreationTime = _authController.getUserCreationDate();
    // first we check the user if he has everything Set
    if (checkIfUserHasAllInfosSet()) {
      // we set the TextField's Text to user name
      userName.value = _authController.user!.name;
    } else {
      // in case Name null then we set userName to empty String cuz TextField does not accept null.
      userName.value = _authController.user?.name ?? "";
      // and we straight forward go to edit mode.
      setUserProfileMode(UserProfileMode.Edit);
    }

    // Initial TextFieldValue.
    setTextFieldText(userName.value!);
  }
}
