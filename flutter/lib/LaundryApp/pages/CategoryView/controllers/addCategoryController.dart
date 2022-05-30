import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

// ignore_for_file: constant_identifier_names
enum SelectedTab { Primary, Secondary }

class AddCategoryController {
  /// TextEditingController Primary
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController categoryPricingController =
      TextEditingController();

  /// TextEditingController Secondary
  final TextEditingController secondaryCategoryNameController =
      TextEditingController();
  TabController? tabController;

  // @m66are Work //
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  final Rxn<Laundry> laundry = Rxn<Laundry>();
  final Rxn<LaundryCosts> laundryCosts = Rxn();
  final Rxn<LaundryCostLineItem> copyOfCategory = Rxn();

  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  String? editableCategoryId;

  // INIT STATE ///
  void init({String? categoryId}) {
    laundry.value = laundryInfoController.laundry.value;
    if (laundry.value != null) {
      initLanguages();
      assignCategories();
      if (categoryId != null) {
        initEditMode(categoryId);
      }
    }
  }

  void initLanguages() {
    primaryLang.value = laundry.value!.primaryLanguage;
    secondaryLang.value = laundry.value!.secondaryLanguage;
  }

  void assignCategories() {
    laundryCosts.value = laundry.value!.laundryCosts;
    laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      categories.value.add(element);
    });
  }

  void initEditMode(String categoryId) {
    editMode.value = true;
    editableCategoryId = categoryId;

    copyOfCategory.value = categories.firstWhereOrNull(
        (LaundryCostLineItem element) => element.id == categoryId);

    if (copyOfCategory.value!.name[primaryLang.value] != null) {
      primaryCategoryNameController.text =
          copyOfCategory.value!.name[primaryLang.value]!;
    }
    if (copyOfCategory.value!.name[secondaryLang.value] != null) {
      secondaryCategoryNameController.text =
          copyOfCategory.value!.name[secondaryLang.value]!;
    }

    categoryPricingController.text =
        copyOfCategory.value?.cost.toString() ?? "";
  }

  void addCategory() {
    final LaundryCostLineItem newCategory = LaundryCostLineItem(
        id: getRandomString(12),
        name: {
          primaryLang.value!: primaryCategoryNameController.text,
          if (secondaryLang.value != null)
            secondaryLang.value!: secondaryCategoryNameController.text,
        },
        cost: num.parse(categoryPricingController.text));
    categories.add(newCategory);

    laundryCosts.value!.lineItems = categories;

    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      Get.back();
    });
  }

  void editCategory() {
    final int index = categories
        .indexWhere((LaundryCostLineItem p0) => p0.id == editableCategoryId);

    categories.value[index].name = {
      primaryLang.value!: primaryCategoryNameController.text,
      if (secondaryLang.value != null)
        secondaryLang.value!: secondaryCategoryNameController.text,
    };
    categories.value[index].cost = num.parse(categoryPricingController.text);
    laundryCosts.value!.lineItems = categories;
    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      Get.back();
    });
  }

  void handleFooterButtonClick() {
    if (editMode.value) {
      editCategory();
    } else {
      addCategory();
    }
  }

  String getRightName() {
    final String availableName =
        copyOfCategory.value!.name[copyOfCategory.value!.name.keys.first]!;
    if (copyOfCategory.value!.name[primaryLang] != null) {
      return copyOfCategory.value!.name[primaryLang]!;
    } else {
      return availableName;
    }
  }
}
