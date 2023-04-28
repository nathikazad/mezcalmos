import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

abstract class ServicesViewsController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  // instances //
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // streams //

  // variables //
  String get imagesUploadFolder;

  List<TimeUnit> get timeUnits;

  // states variables //
  RxBool isAvailable = RxBool(false);
  RxList<String> imagesUrls = RxList.empty();
  RxMap<TextEditingController, TimeUnit> priceTimeUnitMap =
      RxMap<TextEditingController, TimeUnit>();
  RxList<File?> images = RxList.filled(5, null);
  // getters//
  List<TimeUnit> get units => units
      .where((TimeUnit element) =>
          priceTimeUnitMap.values.contains(element) == false)
      .toList();

  // methods //
  Future<void> init() async {}

  void addPriceTimeUnit(TimeUnit timeUnit) {
    priceTimeUnitMap[TextEditingController()] = timeUnit;
  }

  void removeTimeUnit(TimeUnit timeUnit) {
    priceTimeUnitMap.removeWhere(
        (TextEditingController key, TimeUnit value) => value == timeUnit);
  }

  Future<void> addItemImage(
      {required int itemIndex, required BuildContext context}) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          images[itemIndex] = File(_res.path);
        }
      } catch (e) {
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  void dispose() {}

  Future<void> save();

  Future<List<String>> _uploadItemsImages() async {
    List<String> _imagesUrls = [];
    await Future.forEach(images, (File? value) async {
      if (value != null) {
        await uploadImgToFbStorage(
                imageFile: imPicker.XFile(value.path),
                storageFolder: "$imagesUploadFolder")
            .then((String url) => _imagesUrls.add(url));
      }
    });
    return _imagesUrls;
  }
}
