import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/pages/AddCategoryScreen/components/AddCategorySlide.dart';
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
  final TextEditingController categoryNameControllerEnglish =
      TextEditingController();
  final TextEditingController categoryPricingController =
      TextEditingController();

  /// TextEditingController Spanish
  final TextEditingController categoryNameControllerSpanish =
      TextEditingController();
  TabController? tabController;

  // @m66are Work //
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  final Rxn<Laundry> laundry = Rxn<Laundry>();
  final Rxn<LaundryCosts> laundryCosts = Rxn();
  final Rxn<LanguageType> primaryLang = Rxn();
  final Rxn<LanguageType> secondaryLang = Rxn();

  RxList<LaundryCostLineItem> categories = <LaundryCostLineItem>[].obs;
  void init() {
    laundry.value = laundryInfoController.laundry.value;
    primaryLang.value = laundry.value!.primaryLanguage;
    secondaryLang.value = laundry.value!.secondaryLanguage;

    if (laundry.value != null) {
      mezDbgPrint("Categories adding init state");
      laundryCosts.value = laundry.value!.laundryCosts;
      laundry.value!.laundryCosts.lineItems
          .forEach((LaundryCostLineItem element) {
        categories.value.add(element.copyWith());
      });
    }
  }

  void addCategory() {
    categories.value.add(LaundryCostLineItem(name: {
      LanguageType.EN: categoryNameControllerEnglish.text,
      LanguageType.ES: categoryNameControllerSpanish.text,
    }, cost: num.parse(categoryPricingController.text)));

    laundryCosts.value!.lineItems = categories;
    mezDbgPrint("After add ------------------------>");
    laundryCosts.value!.lineItems.forEach((LaundryCostLineItem element) {});

    laundryInfoController.setCosts(laundryCosts.value!).then((value) {
      mezDbgPrint("Done");
      Get.back();
    });
  }

  // @m66are Work //
  /// Tabs

  /// Pages

  /// TabController

  List<Tab> getTabs() {
    return <Tab>[
      Tab(text: primaryLang.value!.toLanguageName()),
      Tab(text: secondaryLang.value!.toLanguageName() ?? ""),
    ];
  }

  List<Widget> tabPages() {
    return <Widget>[
      AddCategorySlide(
        // categoryNameController: categoryNameControllerEnglish,
        // categoryPricingController: categoryPricingController,
        addCategoryController: this,
        selectedTab: SelectedTab.Primary,
      ),
      AddCategorySlide(
        // categoryNameController: categoryNameControllerSpanish,
        // categoryPricingController: categoryPricingController,
        addCategoryController: this,
        selectedTab: SelectedTab.Secondary,
      ),
    ];
  }
}
