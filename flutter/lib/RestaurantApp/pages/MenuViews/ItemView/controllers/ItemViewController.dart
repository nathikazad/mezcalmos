import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class ROpItemViewController {
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  final TextEditingController prItemNameController = TextEditingController();
  final TextEditingController scItemNameController = TextEditingController();
  final TextEditingController prItemDescController = TextEditingController();
  final TextEditingController scItemDescController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();

  Category addNewCatgeory = Category(
    name: {
      LanguageType.EN: "Add new category",
      LanguageType.ES: "Añadir nueva categoria"
    },
  );
  Category noCatgeory = Category(
    name: {
      LanguageType.EN: "No category",
      LanguageType.ES: "Ninguna Categoria"
    },
  );

  final RxList<Category> categories = RxList.empty();
  final Rxn<Category> currentCategory = Rxn();
  Rx<LanguageType> prLang = Rx(LanguageType.ES);
  Rx<LanguageType> scLang = Rx(LanguageType.ES);
  final Rxn<File> newImageFile = Rxn();
  final Rxn<String> newImageUrl = Rxn();
  final RxBool imageLoading = RxBool(false);
  final RxList<Option> itemOptions = RxList([]);
  RxBool editMode = RxBool(false);
  RxBool specialMode = RxBool(false);
  final Rxn<Item> editableItem = Rxn();
  RxBool newCategoryAdded = RxBool(false);
  Rxn<Category> addedCatgeory = Rxn();
  RxBool isLoading = RxBool(false);
  bool firstFormValid = false;
  bool secondFormValid = false;
  Rxn<DateTime> startDay = Rxn();
  Rxn<DateTime> endDate = Rxn();
  Rxn<PeriodOfTime> periodOfTime = Rxn();

  RxBool needToRefetch = RxBool(false);
  RxBool isInitalized = RxBool(false);
  Rxn<Schedule> schedule = Rxn();

  bool get isEditing => editMode.value && editableItem.value != null;
  late int restaurantId;

  Future<void> init(
      {String? itemId,
      String? categoryId,
      bool? specials,
      required String restaurantId}) async {
    this.restaurantId = int.parse(restaurantId);
    if (specials != null) {
      specialMode.value = specials;
    }
    if (specialMode.value) {
      schedule.value = await get_restaurant_schedule(
          restaurantId: this.restaurantId, withCache: false);
    }
    prLang.value = await get_restaurant_priamry_lang(4) ?? LanguageType.ES;
    scLang.value = prLang.value.toOpLang();
    await _assignCategories();
    mezDbgPrint("Item id ===========>>>>> $itemId");
    if (itemId != null) {
      await _initEditMode(itemId: itemId, categoryId: categoryId);
    }

    isInitalized.value = true;
  }

  Future<void> _initEditMode(
      {required String itemId, String? categoryId}) async {
    editMode.value = true;

    editableItem.value =
        await get_one_item_by_id(int.parse(itemId), withCache: false);
    mezDbgPrint(editableItem.value!.toJson());
    prItemNameController.text = editableItem.value!.name[prLang]!;
    newImageUrl.value = editableItem.value!.image;
    scItemNameController.text = editableItem.value!.name[scLang]!;
    prItemDescController.text = editableItem.value?.description?[prLang]! ?? "";
    scItemDescController.text = editableItem.value!.description?[scLang]! ?? "";
    periodOfTime.value = editableItem.value!.getPeriod;

    itemPriceController.text = editableItem.value!.cost.toString();
    _assignChoices();
    if (editableItem.value!.categoryId != null) {
      currentCategory.value = await get_category_by_id(
          categoryId: editableItem.value!.categoryId!, withCache: false);
    }
  }

  void _assignChoices() {
    mezDbgPrint(editableItem.value!.options.length);
    itemOptions.clear();
    editableItem.value!.options.forEach((Option element) {
      itemOptions.add(element);
    });
  }

  Item _contructItem() {
    final Item newItem = Item(
      image: newImageUrl.value,
      itemType: (specialMode.isTrue) ? ItemType.Special : ItemType.Daily,
      id: editMode.value ? editableItem.value!.id : null,
      startsAt: specialMode.value ? periodOfTime.value?.start : null,
      endsAt: specialMode.value ? periodOfTime.value?.end : null,
      available: editableItem.value?.available ?? false,
      categoryId: currentCategory.value?.id,
      name: {
        prLang.value: prItemNameController.text,
        scLang.value: scItemNameController.text,
      },
      description: {
        prLang.value: prItemDescController.text,
        scLang.value: scItemDescController.text,
      },
      cost: num.parse(itemPriceController.text),
    );
    return newItem;
  }

  void switchItemAv(bool v) {
    editableItem.value!.available = v;
    editableItem.refresh();
  }

  Future<void> saveItem() async {
    isLoading.value = true;
    mezDbgPrint("Saving item =========<<<<=========");

    if (newImageFile.value != null) {
      mezDbgPrint("m66are =====> uploading new image");
      // await _restaurantInfoController
      //     .uploadImgToDb(imageFile: newImageFile.value!)
      //     .then((String value) {
      //   newImageUrl.value = value;
      // });
    }
    const String _tmpLmode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    final AppLaunchMode mode = _tmpLmode.toLaunchMode();
    if (mode == AppLaunchMode.dev || mode == AppLaunchMode.stage) {
      mezDbgPrint("Settign default image");
      newImageUrl.value =
          "https://s.inyourpocket.com/gallery/helsinki/2019/11/shutterstock-1306257490.jpg";
    }
    if (editMode.isFalse) {
      final int? newItemId = await add_one_item(
          item: _contructItem(),
          restaurantId: restaurantId,
          categoryId: currentCategory.value?.id);
      if (newItemId != null) {
        mezDbgPrint(
            "👌🏻👌🏻👌🏻 Item added successfuly id : $newItemId 👌🏻👌🏻👌🏻");

        editableItem.value = await get_one_item_by_id(newItemId);
        editMode.value = true;
        needToRefetch.value = true;
      }
    } else {
      mezDbgPrint("👌🏻👌🏻👌🏻 Editing item ..... 👌🏻👌🏻👌🏻");
      await _updateName();
      if (editableItem.value!.descriptionId != null) {
        await _updateDescription();
      }
      final bool result = await update_item_by_id(
          itemId: editableItem.value!.id!, item: _contructItem());
      if (result) {
        customSnackBar(
            title: 'Saved',
            subTitle: 'Item saved successfuly',
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
        needToRefetch.value = true;
      }
    }

    isLoading.value = false;
  }

  Future<void> _updateDescription() async {
    if (!fd.mapEquals(
        editableItem.value!.description, _contructItem().description)) {
      _contructItem()
          .description
          ?.forEach((LanguageType key, String value) async {
        await update_translation(
            langType: key,
            value: value,
            translationId: editableItem.value!.descriptionId!);
      });
    }
  }

  Future<void> _updateName() async {
    mezDbgPrint(
        "UPDATE NAME ${!fd.mapEquals(editableItem.value!.name, _contructItem().name)}");
    if (!fd.mapEquals(editableItem.value!.name, _contructItem().name)) {
      _contructItem().name.forEach((LanguageType key, String value) async {
        mezDbgPrint("updatttttt ${editableItem.value?.nameId}");
        await update_translation(
            langType: key,
            value: value,
            translationId: editableItem.value!.nameId!);
      });
    }
  }

  Future<bool?> deleteItem({required String itemId, String? catgeoryId}) async {
    final int? deletedItemId = await delete_item_by_id(int.parse(itemId));
    if (deletedItemId != null) {
      MezRouter.back();
      mezDbgPrint("Item $deletedItemId have deleted 😢😢😢");
      return true;
    }
    return null;
  }

  Future<void> _assignCategories() async {
    categories.value =
        await get_restaurant_categories_by_id(restaurantId, withCache: false) ??
            [];
  }

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
    // TODO Update to hasura @m66are

    return false;
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
    // TODO Update to hasura @m66are
    // final List<Item> items = restaurant.value!.getAllItems();
    // if (editMode.isTrue) {
    //   items.removeWhere((Item element) => element.id == editableItem.value!.id);
    // }
    // items.forEach((Item element) {
    //   if (element.name[languageType] != null) {
    //     data.add(element.name[languageType]!.replaceAll(" ", "").toLowerCase());
    //   }
    // });

    return data;
  }

  void dispose() {
    editableItem.close();
    prItemDescController.clear();
    prItemNameController.clear();
    scItemNameController.clear();
    scItemDescController.clear();
  }

  Future<void> fetchItem() async {
    if (isEditing) {
      mezDbgPrint("⌛️⌛️⌛️⌛️⌛️ Refetching item data from hasura.... ");
      final Item? newItem =
          await get_one_item_by_id(editableItem.value!.id!, withCache: false);

      if (newItem != null) {
        editableItem.value = newItem;
        editableItem.value!.options = newItem.options;
        _assignChoices();
      }
    }
  }
}
