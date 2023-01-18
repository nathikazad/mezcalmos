import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class UserProfileViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  RxString name = RxString("");

// Obs //
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  final RxBool editMode = RxBool(false);
  final RxBool welcomeMode = RxBool(false);

// getters //
  UserInfo? get user => _authController.user;
  bool get isInfoSet {
    return (newImageFile.value != null || newImageUrl.value != null) &&
        name.value.isNotEmpty &&
        name.value.length > 4;
  }

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(newImageFile.value!);
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }
  // methods //

  void init() {
    name.value = user?.name ?? "";
    newImageUrl.value = user?.image;
  }

  void switchEditMode() {
    editMode.value = !editMode.value;
  }

  Future<void> setInfo() async {
    await _setImage();
    _authController.setUserInfo =
        _authController.user?.clone(image: newImageUrl.value, name: name.value);

    await _authController.updateUserProfile();

    if (editMode.isTrue) {
      switchEditMode();
    } else if (welcomeMode.isTrue) {
      MezRouter.back();
    }
  }

  Future<void> _setImage() async {
    if (newImageFile.value != null) {
      newImageUrl.value = await _authController.uploadUserImgToFbStorage(
          imageFile: newImageFile.value!, isCompressed: false);
    }
  }

  Future<void> editImage(context) async {
    if (1 == 2) {
      final imPicker.ImageSource? _from =
          await imagePickerChoiceDialog(context);

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
    } else {
      newImageUrl.value =
          "https://unsplash.com/photos/RGKdWJOUFH0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mnx8Z2lybHxlbnwwfHx8fDE2NzQwNTEyNjg&force=true";
    }
  }

  Future<ServerResponse> deleteAccount() {
    return _authController.deleteAccount();
  }
}
