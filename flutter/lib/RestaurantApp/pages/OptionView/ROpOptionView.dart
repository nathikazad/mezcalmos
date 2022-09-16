import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionChoice.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionTypeSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOptionView"];

//

class ROpOptionView extends StatefulWidget {
  const ROpOptionView({Key? key}) : super(key: key);

  @override
  State<ROpOptionView> createState() => _ROpOptionViewState();
}

class _ROpOptionViewState extends State<ROpOptionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ROpOptionViewController _viewController = ROpOptionViewController();
  final GlobalKey<FormState> _prFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _scFormKey = GlobalKey<FormState>();

  String? itemId;
  String? categoryId;
  String? restaurantId;
  Rxn<Option> option = Rxn<Option>();

  @override
  void initState() {
    restaurantId = Get.parameters["restaurantId"];
    if (restaurantId != null) {
      if (Get.arguments != null) {
        option.value = Get.arguments["option"] as Option?;
        itemId = Get.arguments["itemId"] as String?;
        categoryId = Get.arguments["categoryId"] as String?;
      }

      _tabController = TabController(length: 2, vsync: this);

      _viewController.init(option: option.value, restaurantId: restaurantId!);
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_viewController.restaurant.value != null) {
        return Scaffold(
          appBar: _appBar(),
          bottomNavigationBar: MezButton(
            height: 65,
            borderRadius: 0,
            withGradient: true,
            onClick: () async {
              await _handleSaveBtn();
            },
            label: (_viewController.editMode.isTrue)
                ? '${_i18n()["editOption"]}'
                : '${_i18n()["addOption"]}',
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              // Primary language tab view
              _primaryTab(),
              // Secondary language tab view
              _secondarTab(),
            ],
          ),
        );
      } else
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: MezLogoAnimation(
            centered: true,
          ),
        );
    });
  }

  SingleChildScrollView _secondarTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _scFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i18n()["optionName"]}', style: Get.textTheme.bodyText1),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.scOptionName,
                style: Get.textTheme.bodyText1,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return '${_i18n()["required"]}';
                  }
                  return null;
                }),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '${_i18n()["optionChoices"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: List.generate(
                          _viewController.optionChoices.length, (int index) {
                        return ROpOptionChoice(
                          viewController: _viewController,
                          index: index,
                          isSecondary: true,
                        );
                      }),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _primaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _prFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i18n()["optionName"]}', style: Get.textTheme.bodyText1),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.prOptionName,
                style: Get.textTheme.bodyText1,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return '${_i18n()["required"]}';
                  }
                  return null;
                }),
            SizedBox(
              height: 25,
            ),
            Text(
              '${_i18n()["optionType"]}',
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(
              height: 8,
            ),
            ROpOptionSelector(
              viewController: _viewController,
            ),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '${_i18n()["optionChoices"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Column(
                      children: List.generate(
                          _viewController.optionChoices.length, (int index) {
                        return ROpOptionChoice(
                          viewController: _viewController,
                          index: index,
                        );
                      }),
                    ),
                  ),
                  MezAddButton(onClick: () {
                    _viewController.addNewEmptyChoice();
                  })
                ],
              );
            }),
            _deleteOptionBtn()
          ],
        ),
      ),
    );
  }

  Widget _deleteOptionBtn() {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: (_viewController.editMode.value)
              ? TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      backgroundColor: offRedColor),
                  onPressed: () {
                    if (itemId != null) {
                      showConfirmationDialog(context, onYesClick: () async {
                        Get.back(closeOverlays: true);
                        Get.back();
                      },
                          primaryButtonText: '${_i18n()["deleteOption"]}',
                          title: '${_i18n()["deleteOpBtn"]}',
                          helperText: "deleteOpHelper");
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('${_i18n()["deleteOption"]}'),
                        ],
                      )))
              : null);
    });
  }

  AppBar _appBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      Get.back(result: _viewController.editableOption.value);
    },
        title: (_viewController.editMode.isTrue)
            ? _viewController.editableOption.value!.name[userLanguage]
            : '${_i18n()["addOption"]}',
        tabBar: TabBar(controller: _tabController, tabs: [
          Tab(
            text:
                "${_viewController.restaurant.value!.primaryLanguage.toLanguageName()}",
          ),
          Tab(
            text:
                "${_viewController.restaurant.value!.secondaryLanguage!.toLanguageName()}",
          ),
        ]));
  }

  Future<void> _handleSaveBtn() async {
    if (_tabController.index == 0) {
      await _handleFirstTab();
    } else {
      await _handleSecondTab();
    }
  }

  Future<void> _handleSecondTab() async {
    if (_viewController.firstTabValid == true &&
        _scFormKey.currentState?.validate() == true) {
      _viewController.addOption();
      Get.back(result: _viewController.addOption());
    } else if (_scFormKey.currentState?.validate() == true &&
        _prFormKey.currentState?.validate() != true) {
      _viewController.secondTabValid = true;
      _tabController.index = 0;
    }
  }

  Future<void> _handleFirstTab() async {
    if (_prFormKey.currentState?.validate() == true &&
        (_scFormKey.currentState?.validate() == true ||
            _viewController.secondTabValid)) {
      _viewController.addOption();
      Get.back(result: _viewController.addOption());
    } else if (_prFormKey.currentState?.validate() == true &&
        _scFormKey.currentState?.validate() != true) {
      _viewController.firstTabValid = true;

      _tabController.index = 1;
    }
  }
}
