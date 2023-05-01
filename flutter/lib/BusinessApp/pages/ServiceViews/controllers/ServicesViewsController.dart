import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as imPicker;

abstract class ServicesViewsController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  TabController? tabController;

  // instances //

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // streams //

  bool shouldRefetch = false;

  // methods //
  Future<void> initEditMode({required int id});
  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> saveItemDetails();
  Future<void> save();
}
