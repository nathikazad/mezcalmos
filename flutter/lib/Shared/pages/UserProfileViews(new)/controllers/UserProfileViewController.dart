import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

enum UserProfileViewMode { Editing, FirstTime, None }

class UserProfileViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  RxString name = RxString("");

// Obs //
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  Rx<UserProfileViewMode> mode = Rx(UserProfileViewMode.None);

// getters //
  UserInfo? get user => _authController.user;
  bool get isEditingInfo => mode == UserProfileViewMode.Editing;
  bool get showImageSetter =>
      mode == UserProfileViewMode.Editing ||
      mode == UserProfileViewMode.FirstTime;
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

  void initProfileView() {
    name.value = user?.name ?? "";
    newImageUrl.value = user?.image;
    mode.value = UserProfileViewMode.None;
  }

  void switchMode(UserProfileViewMode mode) {
    this.mode.value = mode;
  }

  Future<void> setInfo() async {
    await _setImage();
    _authController.setUserInfo =
        _authController.user?.clone(image: newImageUrl.value, name: name.value);

    await _authController.updateUserProfile();

    if (mode == UserProfileViewMode.Editing) {
      switchMode(UserProfileViewMode.None);
    } else if (mode == UserProfileViewMode.FirstTime) {
      // ignore: inference_failure_on_function_invocation, unawaited_futures
      await MezRouter.back();
      // ignore: unawaited_futures
      MezRouter.toNamed(SharedRoutes.kHomeRoute);
    }
  }

  Future<void> _setImage() async {
    if (newImageFile.value != null) {
      newImageUrl.value = await _authController.uploadImgToFbStorage(
          imageFile: newImageFile.value!, isCompressed: false);
    }
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

  Future<ServerResponse> deleteAccount() {
    return _authController.deleteAccount();
  }
}
