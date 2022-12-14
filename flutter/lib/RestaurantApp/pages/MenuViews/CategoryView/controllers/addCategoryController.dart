import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

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

  late RestaurantInfoController restaurantInfoController;

  /// Variables ///
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  late int restaurantId;
  Rxn<Category> category = Rxn<Category>();

  Rxn<LanguageType> primaryLang = Rxn();

  Rxn<LanguageType> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  String? editableCategoryId;

  bool get isLoading {
    if (editMode.value) {
      return category.value != null;
    } else
      return primaryLang.value != null && secondaryLang.value != null;
  }

  /// LOGIC ///

  // INIT STATE ///
  Future<void> init({required String restaurantId, String? categoryId}) async {
    this.restaurantId = int.parse(restaurantId);
    mezDbgPrint("INIT CATEGORY VIEW ========================>$categoryId");
    this.restaurantId = int.parse(restaurantId);

    await initLanguages();

    if (categoryId != null) {
      await initEditMode(categoryId);
    }
  }

  Future<void> initLanguages() async {
    primaryLang.value = await get_restaurant_priamry_lang(restaurantId);
    secondaryLang.value = primaryLang.value!.toOpLang();
  }

  Future<void> initEditMode(String categoryId) async {
    editMode.value = true;
    editableCategoryId = categoryId;

    category.value = await get_category_by_id(int.parse(categoryId));
    if (category.value != null) {
      primaryCategoryNameController.text = category.value!.name![primaryLang]!;
      secondaryCategoryNameController.text =
          category.value!.name![secondaryLang]!;
      primaryCatDesc.text = category.value!.dialog?[primaryLang] ?? "";
      secondaryCatDesc.text = category.value!.dialog?[secondaryLang] ?? "";
    }
  }

  Category constructCategory() {
    final Category newCategory = Category(
      name: _contructName(),
      dialog: _contructDescription(),
    );
    return newCategory;
  }

  Future<void> saveCategory() async {
    if (editMode.value == true) {
      if (!fd.mapEquals(_contructName(), category.value!.name)) {
        mezDbgPrint("Name changed ✅");
        _contructName().forEach((LanguageType key, String value) {
          update_translation(
              langType: key,
              value: value,
              translationId: category.value!.nameId!);
        });
      }
      if (!fd.mapEquals(_contructDescription(), category.value!.dialog)) {
        mezDbgPrint("Name changed ✅");
        _contructDescription()?.forEach((LanguageType key, String value) {
          update_translation(
              langType: key,
              value: value,
              translationId: category.value!.descriptionId!);
        });
      }
      // await restaurantInfoController.editCategory(
      //     category: constructCategory(), categoryId: editableCategoryId!);
    } else {
      final String? newCatId = await add_category(
          category: constructCategory(), restaurantId: restaurantId);
      mezDbgPrint("New category inserted id : $newCatId");
      // await restaurantInfoController.addCategory(
      //   category: constructCategory(),
      // );
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

  List<String> getCatNames(LanguageType languageType) {
    final List<String> data = [];
    // restaurant.value!.getCategories.forEach((Category element) {
    //   if (element.name?[languageType] != null) {
    //     data.add(element.name![languageType]!.toLowerCase());
    //   }
    // });

    return data;
  }
}