import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

abstract class ServicesViewsController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  TabController? tabController;

  // instances //
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // streams //

  // variables //
  String get imagesUploadFolder;
  bool shouldRefetch = false;

  List<TimeUnit> get timeUnits;

  // states variables //
  RxBool isAvailable = RxBool(false);
  RxList<String?> imagesUrls = RxList.filled(5, null);
  RxMap<TextEditingController, TimeUnit> priceTimeUnitMap =
      RxMap<TextEditingController, TimeUnit>();
  RxList<File?> images = RxList.filled(5, null);
  // getters//
  List<TimeUnit> get units => timeUnits
      .where((TimeUnit element) =>
          priceTimeUnitMap.values.contains(element) == false)
      .toList();

  // methods //
  Future<void> initEditMode({required int id});
  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> save();
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

  Future<List<String>> uploadItemsImages() async {
    List<String> _imagesUrls = List.from(imagesUrls);

    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        _imagesUrls[i] = await uploadImgToFbStorage(
            imageFile: imPicker.XFile(images[i]!.path),
            storageFolder: "$imagesUploadFolder");
      }
    }

    return _imagesUrls;
  }

  ImageProvider? getImage(int index) {
    mezDbgPrint("Image url $index : ${imagesUrls[index]}");
    if (images[index] != null) {
      return FileImage(images[index]!);
    } else if (imagesUrls[index] != null) {
      return CachedNetworkImageProvider(imagesUrls[index]!);
    }
    return null;
  }

  void dispose();
}
