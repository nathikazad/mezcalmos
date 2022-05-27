import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
  Rx<List<LanguageType>> languages = Rx([]);
  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);

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
    if (primaryLang.value != null) {
      languages.value.add(primaryLang.value!);
    }
    if (secondaryLang.value != null) {
      languages.value.add(secondaryLang.value!);
    }
  }

  void assignCategories() {
    laundryCosts.value = laundry.value!.laundryCosts;
    laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      categories.value.add(element.copyWith());
    });
  }

  void initEditMode(String categoryId) {
    editMode.value = true;
    copyOfCategory.value = categories.value.firstWhereOrNull(
        (LaundryCostLineItem element) =>
            element.name[primaryLang] == categoryId);

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
    if (laundry.value!.secondaryLanguage != null) {
      categories.value.add(LaundryCostLineItem(name: {
        laundry.value!.primaryLanguage: primaryCategoryNameController.text,
        laundry.value!.secondaryLanguage!: secondaryCategoryNameController.text,
      }, cost: num.parse(categoryPricingController.text)));
    } else {
      categories.value.add(LaundryCostLineItem(name: {
        laundry.value!.primaryLanguage: primaryCategoryNameController.text,
      }, cost: num.parse(categoryPricingController.text)));
    }

    laundryCosts.value!.lineItems = categories;
    mezDbgPrint("After add ------------------------>");
    laundryCosts.value!.lineItems.forEach((LaundryCostLineItem element) {});

    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      mezDbgPrint("Done");
      Get.back();
    });
  }

  void editCategory() {
    categories.removeWhere((LaundryCostLineItem element) =>
        element.name[primaryLang] == copyOfCategory.value!.name[primaryLang]);
    if (laundry.value!.secondaryLanguage != null) {
      categories.value.add(LaundryCostLineItem(name: {
        laundry.value!.primaryLanguage: primaryCategoryNameController.text,
        laundry.value!.secondaryLanguage!: secondaryCategoryNameController.text,
      }, cost: num.parse(categoryPricingController.text)));
    } else {
      categories.value.add(LaundryCostLineItem(name: {
        laundry.value!.primaryLanguage: primaryCategoryNameController.text,
      }, cost: num.parse(categoryPricingController.text)));
    }

    laundryCosts.value!.lineItems = categories;
    mezDbgPrint("After add ------------------------>");
    laundryCosts.value!.lineItems.forEach((LaundryCostLineItem element) {});

    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      mezDbgPrint("Done");
      Get.back();
    });
  }

  Future<void> deleteCategory({required String categoryId}) async {
    final List<LaundryCostLineItem> categories = [];
    final LaundryCosts laundryCosts =
        laundryInfoController.laundry.value!.laundryCosts;

    laundryInfoController.laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      categories.add(element.copyWith());
    });

    categories.removeWhere((LaundryCostLineItem element) =>
        element.name[primaryLang] == categoryId);

    laundryCosts.lineItems = categories;

    await laundryInfoController.setCosts(laundryCosts);
  }

  void handleFooterButtonClick() {
    if (editMode.value) {
      editCategory();
    } else {
      addCategory();
    }
  }

// get selected tab priority based on list order of hte languages

}
