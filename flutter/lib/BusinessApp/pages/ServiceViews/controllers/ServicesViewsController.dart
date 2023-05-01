import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

abstract class ServicesViewsController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  TabController? tabController;

  // instances //

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

  Future<void> saveItemDetails();
  Future<void> save();
}
