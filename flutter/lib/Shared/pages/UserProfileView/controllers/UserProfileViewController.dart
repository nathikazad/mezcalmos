import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

enum UserProfileViewMode { Editing, FirstTime, None }

class UserProfileViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  RxString name = RxString("");

// Obs //
  final Rxn<imPicker.XFile> newImageFile = Rxn();

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
        name.value.length > 2;
  }

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      if (kIsWeb)
        return CachedNetworkImageProvider(newImageFile.value!.path);
      else
        return FileImage(File(newImageFile.value!.path));
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }
  // methods //

  void initProfileView(UserProfileViewMode intialMode) {
    name.value = user?.name ?? "";
    newImageUrl.value = user?.image;
    mode.value = intialMode;
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
      newImageUrl.value = await uploadImgToFbStorage(
          imageFile: newImageFile.value!,
          storageFolder: "users/${_authController.hasuraUserId!}/avatar");
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
          newImageFile.value = _res;
          // newImageFile.value = File(_res.path);
        }
        imageLoading.value = false;
      } catch (e) {
        imageLoading.value = false;
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    await CloudFunctions.user2_deleteUserAccount();
    Navigator.pop(context);
    unawaited(_authController.signOut());
  }

  void dispose() {}
}
