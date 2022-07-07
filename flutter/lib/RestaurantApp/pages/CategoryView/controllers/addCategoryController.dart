import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class AddCategoryController {
  /// Text input controllers ///
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController primaryCatDesc = TextEditingController();
  final TextEditingController secondaryCatDesc = TextEditingController();

  final TextEditingController secondaryCategoryNameController =
      TextEditingController();

  /// Controllers ///
  TabController? tabController;

  RestaurantInfoController restaurantInfoController =
      Get.find<RestaurantInfoController>();

  /// Variables ///
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  Rxn<Restaurant> restaurant = Rxn();
  Rxn<Category> category = Rxn<Category>();

  Rxn<LanguageType> primaryLang = Rxn();

  Rxn<LanguageType> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  String? editableCategoryId;

  /// LOGIC ///

  // INIT STATE ///
  void init({String? categoryId}) {
    restaurant.value = restaurantInfoController.restaurant.value!;
    initLanguages();
    if (categoryId != null) {
      initEditMode(categoryId);
    }
  }

  void initLanguages() {
    primaryLang.value = restaurant.value!.primaryLanguage;
    secondaryLang.value = restaurant.value!.secondaryLanguage!;
  }

  void initEditMode(String categoryId) {
    editMode.value = true;
    editableCategoryId = categoryId;

    category.value = restaurant.value!.getCategories.firstWhereOrNull(
        (Category element) => element.id == editableCategoryId);
    if (category.value != null) {
      primaryCategoryNameController.text = category.value!.name![primaryLang]!;
      secondaryCategoryNameController.text =
          category.value!.name![secondaryLang]!;
      primaryCatDesc.text = category.value!.dialog?[primaryLang] ?? "";
      secondaryCatDesc.text = category.value!.dialog?[secondaryLang] ?? "";
    }
  }

  Category constructCategory() {
    final Category newCategory =
        Category(name: _contructName(), dialog: _contructDescription());
    return newCategory;
  }

  Future<void> saveCategory() async {
    if (editMode.value == true) {
      await restaurantInfoController.EditCatgeory(
              category: constructCategory(), categoryId: editableCategoryId!)
          .then((value) => Get.back());
    } else {
      await restaurantInfoController.addCategory(
        category: constructCategory(),
      );
    }
  }

  Map<LanguageType, String> _contructName() {
    final Map<LanguageType, String> name = {
      primaryLang.value!: primaryCategoryNameController.text,
      secondaryLang.value!: secondaryCategoryNameController.text,
    };
    return name;
  }

  Map<LanguageType, String>? _contructDescription() {
    final Map<LanguageType, String>? desc = {
      primaryLang.value!: primaryCatDesc.text,
      secondaryLang.value!: secondaryCatDesc.text,
    };
    return desc;
  }
}
