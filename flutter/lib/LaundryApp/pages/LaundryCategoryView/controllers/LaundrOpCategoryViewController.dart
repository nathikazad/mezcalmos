import 'dart:math';

import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

// ignore_for_file: constant_identifier_names
enum SelectedTab { Primary, Secondary }

class LaundrOpCategoryViewController {
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

  final Rxn<Language> primaryLang = Rxn();
  final Rxn<Language> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  int? editableCategoryId;
  late int laundryId;
  bool shouldRefetch = false;
  // getters //

  bool get hasData => editMode.isTrue ? copyOfCategory.value != null : true;

  // INIT STATE ///
  Future<void> init({required int laundryID, int? categoryId}) async {
    laundryId = laundryID;
// todo
    laundry.value = await get_laundry_store_by_id(id: laundryID);
    if (laundry.value != null) {
      initLanguages();
      assignCategories();
      if (categoryId != null && categoryId != ":categoryId") {
        editMode.value = true;
        editableCategoryId = categoryId;
        copyOfCategory.value =
            await get_laundry_category_by_id(categoryId: categoryId);
        await _initEditMode();
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

  Future<void> _initEditMode() async {
    if (copyOfCategory.value != null) {
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
          primaryLang.value!: primaryCategoryNameController.text,
          if (secondaryLang.value != null)
            secondaryLang.value!: secondaryCategoryNameController.text,
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
