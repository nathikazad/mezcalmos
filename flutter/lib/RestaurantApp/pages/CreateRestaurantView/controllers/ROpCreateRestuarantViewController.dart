import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpCreateRestuarantViewController {
  // instances //
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  // text inputs //
  TextEditingController restaurantName = TextEditingController();
  TextEditingController restaurantDescription = TextEditingController();
  // state variables //
  Rxn<Location> restaurantLocation = Rxn();
  RxnString restaurantImage = RxnString();
  RxBool imageLoading = RxBool(false);
  Rxn<File> newImageFile = Rxn();

  Future<void> addImage(context) async {
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

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(newImageFile.value!);
    } else if (restaurantImage.value != null) {
      return CachedNetworkImageProvider(restaurantImage.value!);
    } else
      return null;
  }

  Map<String, Object?> _constructRestaurant() {
    return {
      "name": restaurantName.text,
      "image": restaurantImage.value,
      "location": restaurantLocation.value?.toFirebaseFormattedJson(),
    };
  }

  Future<ServerResponse> createRestaurant() async {
    if (restaurantImage.value == null) {
      restaurantImage.value =
          "https://img.freepik.com/premium-vector/restaurant-logo-design-template_79169-56.jpg?w=2000";
    }
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-createRestaurant');
    try {
      final HttpsCallableResult response =
          await cloudFunction.call(_constructRestaurant());
      mezDbgPrint("Response : ${response.data}");

      return ServerResponse.fromJson(response.data);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e,$stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
