import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsHomeRentalViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  // instances //
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // streams //

  // variables //
  List<TimeUnit> _timeUnits = List.unmodifiable([
    TimeUnit.PerHour,
    TimeUnit.PerDay,
    TimeUnit.PerWeek,
    TimeUnit.PerMonth,
  ]);

  // states variables //
  RxBool isAvailable = RxBool(false);
  RxList<String> imagesUrls = RxList.empty();
  RxMap<TextEditingController, TimeUnit> priceTimeUnitMap =
      RxMap<TextEditingController, TimeUnit>();
  RxList<File?> images = RxList.filled(5, null);
  // getters//
  List<TimeUnit> get timeUnits => _timeUnits
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

  Future<void> save() async {
    if (formKey.currentState?.validate() == true) {
      final List<String> _imagesUrls = await _uploadItemsImages();

      Rental rental = Rental(
          category1: RentalCategory1.Home,
          details: BusinessItemDetails(
              id: 0,
              name: {
                Language.EN: nameController.text,
                Language.ES: nameController.text
              },
              description: {
                Language.EN: descriptionController.text,
                Language.ES: descriptionController.text
              },
              image: _imagesUrls,
              businessId: Get.find<BusinessOpAuthController>().companyId!,
              available: isAvailable.value,
              cost: priceTimeUnitMap.value.map(
                  (TextEditingController key, TimeUnit value) =>
                      MapEntry(value, double.parse(key.text)))));
      mezDbgPrint(
          "Create rental with this payload : ${rental.toFirebaseFormattedJson()}");
      int? res = await add_one_home_rental(rental: rental);
      mezDbgPrint(res);
    }
  }

  Future<List<String>> _uploadItemsImages() async {
    List<String> _imagesUrls = [];
    await Future.forEach(images, (File? value) async {
      if (value != null) {
        await uploadImgToFbStorage(
                imageFile: imPicker.XFile(value.path),
                pathPrefix:
                    "Business/HomeRentals/items/${DateTime.now().toIso8601String()}")
            .then((String url) => _imagesUrls.add(url));
      }
    });
    return _imagesUrls;
  }
}
