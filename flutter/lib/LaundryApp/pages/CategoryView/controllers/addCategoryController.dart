import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/components/AddCategorySlide.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

/*
* Created By Mirai Devs.
* On 4/11/2022.
*/

// ignore_for_file: constant_identifier_names
enum SelectedTab { Primary, Secondary }

class AddCategoryController {
  /// TextEditingController English
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController categoryPricingController =
      TextEditingController();

  /// TextEditingController Spanish
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
            element.name[userLanguage] == categoryId);
    mezDbgPrint(copyOfCategory.value!.name.toFirebaseFormat());

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

  void deleteCategory() {
    categories.removeWhere((LaundryCostLineItem element) =>
        element.name[primaryLang] == copyOfCategory.value!.name[primaryLang]);

    laundryCosts.value!.lineItems = categories;
    mezDbgPrint("After add ------------------------>");
    laundryCosts.value!.lineItems.forEach((LaundryCostLineItem element) {});

    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      mezDbgPrint("Done");
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

  // @m66are Work //
  /// Tabs

  /// Pages

  /// TabController
  ///
  ///
  ///
  ///
  ///

  Widget getSingleLanguageView() {
    return AddCategorySlide(
        addCategoryController: this, selectedTab: SelectedTab.Primary);
  }

  List<Tab> getTabs() {
    return List.generate(
        languages.value.length,
        (int index) => Tab(
              text: languages.value[index].toLanguageName(),
            ));
  }

  List<Widget> tabPages() {
    return List.generate(
        languages.value.length,
        (int index) => AddCategorySlide(
            addCategoryController: this, selectedTab: getSelectedTabs(index)));
  }

// get selected tab priority based on list order of hte languages
  SelectedTab getSelectedTabs(int index) {
    switch (index) {
      case 0:
        return SelectedTab.Primary;
      case 1:
        return SelectedTab.Secondary;
      default:
        return SelectedTab.Primary;
    }
  }
}
