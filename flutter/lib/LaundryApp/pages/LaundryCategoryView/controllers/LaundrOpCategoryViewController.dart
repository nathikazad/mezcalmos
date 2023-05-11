import 'dart:math';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

// ignore_for_file: constant_identifier_names
enum SelectedTab { Primary, Secondary }

class LaundrOpCategoryViewController {
  LanguageTabsController languageTabsController = LanguageTabsController();

  /// TextEditingController Primary
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController categoryPricingController =
      TextEditingController();

  /// TextEditingController Secondary
  final TextEditingController secondaryCategoryNameController =
      TextEditingController();
  TabController? tabController;

  final Language userLanguage = Get.find<LanguageController>().userLanguageKey;
  final Rxn<Laundry> laundry = Rxn<Laundry>();
  final Rxn<LaundryCosts> laundryCosts = Rxn();
  final Rxn<LaundryCostLineItem> copyOfCategory = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  int? editableCategoryId;
  late int laundryId;
  bool shouldRefetch = false;
  // getters //
  RxBool _hasData = RxBool(false);
  bool get hasData => _hasData.value;

  ServiceProviderLanguage? get languages => languageTabsController.language;

  bool get hasSecondaryLang => languageTabsController.hasSecondaryLang;
  // INIT STATE ///
  Future<void> init(
      {required int laundryID,
      int? categoryId,
      required TickerProvider vsync}) async {
    laundryId = laundryID;
// todo
    laundry.value = await get_laundry_store_by_id(id: laundryID);
    if (laundry.value != null) {
      await languageTabsController.init(
          vsync: vsync, language: laundry.value!.languages);
      assignCategories();
      if (categoryId != null && categoryId != ":categoryId") {
        editMode.value = true;
        editableCategoryId = categoryId;
        copyOfCategory.value =
            await get_laundry_category_by_id(categoryId: categoryId);
        await _initEditMode();
      }
    }
    _hasData.value = true;
  }

  void assignCategories() {
    laundryCosts.value = laundry.value!.laundryCosts;
    laundry.value!.laundryCosts.lineItems
        .forEach((LaundryCostLineItem element) {
      categories.value.add(element);
    });
  }

  Future<void> _initEditMode() async {
    if (copyOfCategory.value != null) {
      if (copyOfCategory.value!.name[languages!.primary] != null) {
        primaryCategoryNameController.text =
            copyOfCategory.value!.name[languages!.primary]!;
      }
      if (copyOfCategory.value!.name[languages!.secondary] != null) {
        secondaryCategoryNameController.text =
            copyOfCategory.value!.name[languages!.secondary]!;
      }

      categoryPricingController.text =
          copyOfCategory.value?.cost.toString() ?? "";
    }
  }

  Future<void> addCategory() async {
    LaundryCostLineItem newCategory = _constructCategory();
    int? res =
        await add_laundry_category(category: newCategory, storeId: laundryId);
    if (res != null) {
      shouldRefetch = true;
      await MezRouter.back(backResult: shouldRefetch);
    }
  }

  LaundryCostLineItem _constructCategory() {
    final LaundryCostLineItem newCategory = LaundryCostLineItem(
        id: editMode.isTrue ? copyOfCategory.value!.id : Random().nextInt(5),
        name: {
          languages!.primary: primaryCategoryNameController.text,
          if (languages!.secondary != null)
            languages!.secondary!: secondaryCategoryNameController.text,
        },
        cost: num.parse(categoryPricingController.text));
    return newCategory;
  }

  Future<void> editCategory() async {
    LaundryCostLineItem newCategory = _constructCategory();
    if (!fd.mapEquals(newCategory.name, copyOfCategory.value!.name)) {
      newCategory.name.forEach((Language key, String value) {
        update_translation(
            langType: key,
            value: value,
            translationId: copyOfCategory.value!.nameId!);
      });
    }
    LaundryCostLineItem? data =
        await update_laundry_category(newCategory: newCategory);
    if (data != null) {
      copyOfCategory.value = null;
      copyOfCategory.value = data;
      shouldRefetch = true;
      showSavedSnackBar();
      await _initEditMode();
    }

    // laundryInfoController
    //     .setCosts(laundryId: laundryId, laundryCosts: laundryCosts.value!)
    //     .then((value) {
    //   MezRouter.back();
    // });
  }

  Future<void> handleFooterButtonClick() async {
    if (editMode.value) {
      await editCategory();
    } else {
      await addCategory();
    }
  }

  void dispose() {
    shouldRefetch = false;
  }
}
