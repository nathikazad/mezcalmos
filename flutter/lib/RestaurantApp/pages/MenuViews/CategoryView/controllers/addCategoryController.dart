import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class AddCategoryController {
  LanguageTabsController languageTabsController = LanguageTabsController();

  /// Text input controllers ///
  final TextEditingController primaryCategoryNameController =
      TextEditingController();
  final TextEditingController primaryCatDesc = TextEditingController();
  final TextEditingController secondaryCatDesc = TextEditingController();

  final TextEditingController secondaryCategoryNameController =
      TextEditingController();

  /// Variables ///
  final Language userLanguage = Get.find<LanguageController>().userLanguageKey;
  late int restaurantId;
  late int detailsId;

  Rxn<Category> category = Rxn<Category>();

  // Rxn<ServiceProviderLanguage> languages = Rxn();

  // Rxn<Language?> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  RxBool editMode = RxBool(false);
  String? editableCategoryId;
  RxBool _hasData = RxBool(false);

  bool get isLoading => _hasData.value;

  ServiceProviderLanguage? get languages => languageTabsController.language;

  bool get hasSecondaryLang => languageTabsController.hasSecondaryLang;

  /// LOGIC ///

  // INIT STATE ///
  Future<void> init(
      {required String restaurantId,
      String? categoryId,
      required TickerProvider vsync,
      required int detailsId}) async {
    this.restaurantId = int.parse(restaurantId);
    this.detailsId = detailsId;
    await languageTabsController.init(vsync: vsync, detailsId: detailsId);
    mezDbgPrint("INIT CATEGORY VIEW ========================>$categoryId");
    this.restaurantId = int.parse(restaurantId);

    if (categoryId != null && int.tryParse(categoryId) != null) {
      await initEditMode(categoryId);
    }
    _hasData.value = true;
  }

  Future<void> initEditMode(String categoryId) async {
    editMode.value = true;
    editableCategoryId = categoryId;

    category.value = await get_category_by_id(
        categoryId: int.parse(categoryId), withCache: false);
    if (category.value != null) {
      primaryCategoryNameController.text =
          category.value!.name![languages?.primary]!;
      secondaryCategoryNameController.text =
          category.value!.name![languages?.secondary] ?? "";
      primaryCatDesc.text = category.value!.dialog?[languages?.primary] ?? "";
      secondaryCatDesc.text =
          category.value!.dialog?[languages?.secondary] ?? "";
    }
  }

  Category constructCategory() {
    final Category newCategory = Category(
      name: _contructName(),
      dialog: _contructDescription(),
    );
    return newCategory;
  }

  Future<bool> saveCategory() async {
    if (editMode.value == true) {
      try {
        await _updateName();
        await _updateDescription();
        return true;
      } on Exception catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
        return false;
      }
      // await restaurantInfoController.editCategory(
      //     category: constructCategory(), categoryId: editableCategoryId!);
    } else {
      try {
        final String? newCatId = await add_category(
            category: constructCategory(), restaurantId: restaurantId);
        return true;
      } on Exception catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
        return false;
      }

      // await restaurantInfoController.addCategory(
      //   category: constructCategory(),
      // );
    }
  }

  Future<void> _updateName() async {
    if (!fd.mapEquals(_contructName(), category.value!.name)) {
      mezDbgPrint("Name changed ✅");

      await Future.forEach(_contructName().entries,
          (MapEntry<Language, String> element) async {
        await update_translation(
            langType: element.key,
            translationId: category.value!.nameId!,
            value: element.value);
      });
    }
  }

  Future<void> _updateDescription() async {
    if (!fd.mapEquals(_contructDescription(), category.value!.dialog)) {
      await Future.forEach(_contructDescription()!.entries,
          (MapEntry<Language, String> element) async {
        await update_translation(
            langType: element.key,
            translationId: category.value!.descriptionId!,
            value: element.value);
      });
    }
  }

  LanguageMap _contructName() {
    final LanguageMap name = {
      languages!.primary: primaryCategoryNameController.text
    };
    if (languages!.secondary != null &&
        secondaryCategoryNameController.text.isNotEmpty) {
      name[languages!.secondary!] = secondaryCategoryNameController.text;
    }
    return name;
  }

  LanguageMap? _contructDescription() {
    final LanguageMap desc = {};
    if (primaryCatDesc.text.isNotEmpty) {
      desc[languages!.primary] = primaryCatDesc.text;
    }
    if (languages!.secondary != null && secondaryCatDesc.text.isNotEmpty) {
      desc[languages!.secondary!] = secondaryCategoryNameController.text;
    }
    if (desc.isEmpty) {
      return null;
    }
    return desc;
  }

  List<String> getCatNames(Language languageType) {
    final List<String> data = [];
    // restaurant.value!.getCategories.forEach((Category element) {
    //   if (element.name?[languageType] != null) {
    //     data.add(element.name![languageType]!.toLowerCase());
    //   }
    // });

    return data;
  }
}
