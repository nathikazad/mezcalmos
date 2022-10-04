import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ItemViewController {
  /// Class to control the item view on edit and add mode for restaurant app ///

  // controllers //

  late RestaurantInfoController _restaurantInfoController;

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
  Category noCatgeory = Category(name: {
    LanguageType.EN: "No category",
    LanguageType.ES: "Ninguna Categoria"
  }, id: "noCategory");
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
  RxnBool specialMode = RxnBool();
  final Rxn<Item> editableItem = Rxn();
  RxBool newCategoryAdded = RxBool(false);
  Rxn<Category> addedCatgeory = Rxn();
  RxBool isLoading = RxBool(false);
  bool firstFormValid = false;
  bool secondFormValid = false;

  // initalisation //
  // the itemId arguments for edit mode //
  Future<void> init(
      {String? itemId,
      String? categoryId,
      bool? specials,
      required String restaurantId}) async {
    Get.put(RestaurantInfoController(), permanent: false);
    _restaurantInfoController = Get.find<RestaurantInfoController>();
    _restaurantInfoController.init(restId: restaurantId);
    restaurant.value =
        await _restaurantInfoController.getRestaurantAsFuture(restaurantId);
    mezDbgPrint(
        "RestaurantId ===============================>>> $restaurantId");
    mezDbgPrint(
        "Restaurant ===============================>>> ${restaurant.value!.toJson()}");
    _restaurantInfoController
        .getRestaurant(restaurantId)
        .listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      }
    });
    if (specials != null) {
      specialMode.value = specials;
    }
    mezDbgPrint("Special mode =============>${specialMode.value}");
    if (restaurant.value != null) {
      prLang = restaurant.value!.primaryLanguage;
      scLang = restaurant.value!.secondaryLanguage!;
      _assignCategories();
      mezDbgPrint("Item id ===========>>>>> $itemId");
      if (itemId != null) {
        initEditMode(itemId: itemId, categoryId: categoryId);
      }
    }
  }

  // edit item init //
  void initEditMode({required String itemId, String? categoryId}) {
    editMode.value = true;
    editableItem.value = restaurant.value!
        .findItemById(id: itemId, isSpecial: specialMode.value ?? false);
    mezDbgPrint(editableItem.value!.toJson());
    prItemNameController.text = editableItem.value!.name[prLang]!;
    newImageUrl.value = editableItem.value!.image;
    scItemNameController.text = editableItem.value!.name[scLang]!;
    prItemDescController.text = editableItem.value?.description?[prLang]! ?? "";
    scItemDescController.text = editableItem.value!.description?[scLang]! ?? "";
    itemPriceController.text = editableItem.value!.cost.toString();
    mezDbgPrint(editableItem.value!.options.length);
    editableItem.value!.options.forEach((Option element) {
      mezDbgPrint("options adding");
      itemOptions.add(element);
    });
    if (categoryId != null && categoryId != ":categoryId") {
      mezDbgPrint("category iiiiiiiiiiiiiiiid  =======>>>>> $categoryId");
      currentCategory.value = restaurant.value!.getCategories
          .firstWhere((Category element) => element.id == categoryId);
    }
  }

// contruct item //
  Item _contructItem() {
    final Item newItem = Item(
        image: newImageUrl.value,
        id: generateRandomString(5),
        available: editableItem.value?.available ?? false,
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

  void switchChoiceAv(
      {required String choiceId,
      required String optionId,
      required bool value}) {
    itemOptions
        .firstWhere((Option p0) => p0.id == optionId)
        .choices
        .firstWhere((Choice element) => element.id == choiceId)
        .available = value;
  }

  void switchItemAv(bool v) {
    editableItem.value!.available = v;
    editableItem.refresh();
  }

  //

  void editOption(String optionId, Option newOption) {
    final int index =
        itemOptions.indexWhere((Option element) => element.id == optionId);
    itemOptions[index] = newOption;
  }

  void deleteOption({required String optionId}) {
    itemOptions.removeWhere((Option element) => element.id == optionId);
  }

// push item to db //
  Future<void> saveItem() async {
    isLoading.value = true;
    mezDbgPrint("Saving item =========<<<<=========");

    //  uploading image if needed
    if (newImageFile.value != null) {
      mezDbgPrint("m66are =====> uploading new image");
      await _restaurantInfoController
          .uploadImgToDb(imageFile: newImageFile.value!)
          .then((String value) {
        newImageUrl.value = value;
      });
    }

    if (newCategoryAdded.value == true) {
      mezDbgPrint("Adding category ======>>>> ${currentCategory.toJson()}");
      await _restaurantInfoController
          .addCategory(category: currentCategory.value!)
          .then((String? value) {
        if (value != null) {
          currentCategory.value!.id = value;
        }
      });
    }
    if ((specialMode.value ?? false) && editMode.value == false) {
      // ignore: unawaited_futures
      _restaurantInfoController
          .addSpecialItem(item: _contructItem())
          .onError((Object? error, StackTrace stackTrace) => mezDbgPrint(error))
          .then((value) => Get.back());
    } else if (editMode.value == false) {
      //  ignore: unawaited_futures
      _restaurantInfoController
          .addItem(
              item: _contructItem(), categoryId: currentCategory.value!.id!)
          .onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint(error);
        mezDbgPrint(stackTrace);
      }).then((value) => Get.back());
    } else {
      mezDbgPrint("From controlllllllleeeeer =====>$isCurrentSpec");
      // ignore: unawaited_futures
      _restaurantInfoController
          .editItem(
              item: _contructItem(),
              itemId: editableItem.value!.id!,
              isSpecial: specialMode.value ?? false,
              currentSpecial: isCurrentSpec,
              categoryId: currentCategory.value?.id)
          .onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint(error);
        mezDbgPrint(stackTrace);
      }).then((value) => Get.back());
    }
    isLoading.value = false;
  }

  // delete item
  Future<void> deleteItem({required String itemId, String? catgeoryId}) async {
    await _restaurantInfoController
        .deleteItem(
            itemId: itemId,
            categoryId: catgeoryId,
            isSpecial: specialMode.value ?? false,
            currentSpecial: isCurrentSpec)
        .then((value) => Get.back());
  }

  // add categories //
  void _assignCategories() {
    restaurant.value!.getCategories.forEach((Category element) {
      categories.add(element);
    });
    categories.add(noCatgeory);
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

  bool get isCurrentSpec {
    mezDbgPrint(
        "Current spec ====> ${restaurant.value!.currentSpecials.contains(editableItem.value)}");
    return restaurant.value!.currentSpecials.contains(editableItem.value);
  }

  ImageProvider? get getRightImage {
    if (newImageFile.value != null) {
      return FileImage(newImageFile.value!);
    } else if (newImageUrl.value != null) {
      return CachedNetworkImageProvider(newImageUrl.value!);
    } else
      return null;
  }

  List<String> getItemsNames(LanguageType languageType) {
    final List<String> data = [];
    final List<Item> items = restaurant.value!.getAllItems();
    if (editMode.isTrue) {
      items.removeWhere((Item element) => element.id == editableItem.value!.id);
    }
    items.forEach((Item element) {
      if (element.name[languageType] != null) {
        data.add(element.name[languageType]!.replaceAll(" ", "").toLowerCase());
      }
    });

    return data;
  }

  void dispose() {
    editableItem.close();
    prItemDescController.clear();
    prItemNameController.clear();
    scItemNameController.clear();
    scItemDescController.clear();
  }
}
