import 'dart:async';
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
  // Constant //
  Category addNewCatgeory = Category(name: {
    LanguageType.EN: "Add new category",
    LanguageType.ES: "Añadir nueva categoria"
  }, id: "addNew");
  // Variables //
  final Rxn<Restaurant> restaurant = Rxn();
  final RxList<Category> categories = RxList.empty();
  final Rxn<Category> currentCategory = Rxn();
  late LanguageType prLang;
  late LanguageType scLang;
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  final RxList<Option> itemOptions = RxList([]);
  RxBool editMode = RxBool(false);
  final Rxn<Item> editableItem = Rxn();
  RxBool newCategoryAdded = RxBool(false);
  Rxn<Category> addedCatgeory = Rxn();
  StreamSubscription? _restaurantListener;

  // initalisation //
  // the itemId arguments for edit mode //
  void init({String? itemId, String? categoryId}) {
    restaurant.value = _restaurantInfoController.restaurant.value;
    restaurant.refresh();
    _restaurantListener =
        _restaurantInfoController.restaurant.stream.listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
        restaurant.refresh();
        mezDbgPrint("NEW EVENT FROM ============>>>>ItemViewController");
      }
    });
    if (restaurant.value != null) {
      prLang = restaurant.value!.primaryLanguage;
      scLang = restaurant.value!.secondaryLanguage!;
      _assignCategories();
      if (itemId != null) {
        initEditMode(itemId: itemId, categoryId: categoryId);
      }
    }
  }

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
        newOptions: _contructOptions());
    mezDbgPrint("Contruction item ======================> ${newItem.toJson()}");
    return newItem;
  }

  List<Option> _contructOptions() {
    final List<Option> data = [];
    for (int i = 0; i < itemOptions.length; i++) {
      data.add(Option(
        id: itemOptions[i].id,
        name: {
          restaurant.value!.primaryLanguage: itemOptions[i].name[prLang]!,
          restaurant.value!.secondaryLanguage!: itemOptions[i].name[scLang]!,
        },
        optionType: itemOptions[i].optionType,
        newChoices: itemOptions[i].choices,
        costPerExtra: itemOptions[i].costPerExtra,
        freeChoice: itemOptions[i].freeChoice,
        minimumChoice: itemOptions[i].minimumChoice,
        maximumChoice: itemOptions[i].maximumChoice,
      ));
    }
    return data;
  }

  void addOption(Option option) {
    itemOptions.add(option);
  }

  void switchChoiceAvailablity({
    required String choiceId,
    required String optionId,
    required bool value,
    required String itemId,
    String? catgeoryId,
  }) {
    _restaurantInfoController.switchChoiceAvailablity(
        catgeoryId: catgeoryId,
        choiceId: choiceId,
        optionId: optionId,
        itemId: itemId,
        value: value);
  }

  void editOption(String optionId, Option newOption) {
    final int index =
        itemOptions.indexWhere((Option element) => element.id == optionId);
    itemOptions[index].choices = newOption.choices;
    itemOptions[index].optionType = newOption.optionType;
    itemOptions[index].name = newOption.name;
    itemOptions[index].costPerExtra = newOption.costPerExtra;
    itemOptions[index].freeChoice = newOption.freeChoice;
    itemOptions[index].maximumChoice = newOption.maximumChoice;
    itemOptions[index].minimumChoice = newOption.minimumChoice;
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
    if (newCategoryAdded.isTrue && addedCatgeory.value != null) {
      await _restaurantInfoController.addCategory(
          category: addedCatgeory.value!);
    }

    if (editMode.value == false) {
      //  ignore: unawaited_futures
      _restaurantInfoController
          .addItem(
              item: _contructItem(), categoryId: currentCategory.value!.id!)
          .onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint(error);
        mezDbgPrint(stackTrace);
      }).then((value) => Get.back());
    } else {
      // ignore: unawaited_futures
      _restaurantInfoController
          .editItem(
              item: _contructItem(),
              itemId: editableItem.value!.id!,
              categoryId: currentCategory.value?.id)
          .onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint(error);
        mezDbgPrint(stackTrace);
      }).then((value) => Get.back());
    }
  }

  // add categories //
  void _assignCategories() {
    restaurant.value!.getCategories.forEach((Category element) {
      categories.add(element);
    });
    categories.add(addNewCatgeory);
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

  void dispose() {
    _restaurantListener?.cancel();
    _restaurantListener = null;
  }
}
