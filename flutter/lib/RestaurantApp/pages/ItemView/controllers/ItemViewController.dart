import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ItemViewController {
  /// Class to control the item view on edit and add mode for restaurant app ///

  // controllers //

  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();

  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();
  // Text editing controllers //
  //
  final TextEditingController prItemNameController = TextEditingController();
  final TextEditingController scItemNameController = TextEditingController();
  final TextEditingController prItemDescController = TextEditingController();
  final TextEditingController scItemDescController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  //
  // Variables //
  Rxn<Restaurant> restaurant = Rxn();
  RxList<Category> categories = RxList.empty();
  Rxn<Category> currentCategory = Rxn();
  late LanguageType prLang;
  late LanguageType scLang;
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  final RxList<Option> itemOptions = RxList([]);
  RxBool editMode = RxBool(false);
  final Rxn<Item> editableItem = Rxn();

  // initalisation //
  // the itemId arguments for edit mode //
  void init({String? itemId, String? categoryId}) {
    restaurant.value = _restaurantInfoController.restaurant.value;
    if (restaurant.value != null) {
      prLang = restaurant.value!.primaryLanguage;
      scLang = restaurant.value!.secondaryLanguage!;
      _assignCategories();
      if (itemId != null) {
        initEditMode(itemId: itemId, categoryId: categoryId);
      }
    }
  }

  // dispose //
  void dispose() {}

  // edit item init //
  void initEditMode({required String itemId, String? categoryId}) {
    editMode.value = true;
    editableItem.value = restaurant.value!.findItemById(itemId);
    mezDbgPrint(editableItem.value!.toJson());
    prItemNameController.text = editableItem.value!.name[prLang]!;
    scItemNameController.text = editableItem.value!.name[scLang]!;
    prItemDescController.text = editableItem.value?.name[prLang]! ?? "";
    scItemDescController.text = editableItem.value!.description?[scLang]! ?? "";
    itemPriceController.text = editableItem.value!.cost.toString();
    mezDbgPrint(editableItem.value!.options.length);
    editableItem.value!.options.forEach((Option element) {
      mezDbgPrint("options adding");
      itemOptions.add(element);
    });
    if (categoryId != null) {
      currentCategory.value = restaurant.value!.getCategories
          .firstWhere((Category element) => element.id == categoryId);
    }
  }

// contruct item //
  Item _contructItem() {
    final Item newItem = Item(
        image: newImageUrl.value,
        id: generateRandomString(5),
        name: {
          restaurant.value!.primaryLanguage: prItemNameController.text,
          restaurant.value!.secondaryLanguage!: scItemNameController.text,
        },
        description: {
          restaurant.value!.primaryLanguage: prItemDescController.text,
          restaurant.value!.secondaryLanguage!: scItemDescController.text,
        },
        cost: num.parse(itemPriceController.text),
        options: itemOptions);
    return newItem;
  }

  void addOption(Option option) {
    itemOptions.add(option);
  }

// push item to db //
  Future<void> saveItem() async {
    // uploading image if needed
    if (newImageFile.value != null) {
      await _restaurantInfoController
          .uploadImgToDb(imageFile: newImageFile.value!)
          .then((String value) {
        newImageUrl.value = value;
      });
    }
    //  if (newImageUrl.value != null) {
    if (editMode.isFalse) {
      mezDbgPrint("adding =============> ${_contructItem().toJson()} ");
      mezDbgPrint("adding =============> ${currentCategory.value!.id} ");
      await _restaurantInfoController
          .addItem(
              item: _contructItem(), categoryId: currentCategory.value!.id!)
          .then((value) => Get.back());
    } else {
      await _restaurantInfoController
          .editItem(
              item: _contructItem(),
              itemId: editableItem.value!.id!,
              categoryId: currentCategory.value?.id)
          .then((value) => Get.back());
    }
  }

  // add categories //
  void _assignCategories() {
    restaurant.value!.getCategories.forEach((Category element) {
      categories.add(element);
    });
  }

  // item image logic //

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

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(newImageFile.value!);
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }

  bool get isSecondLangValid {
    return scItemNameController.text.isNotEmpty;
  }
}
