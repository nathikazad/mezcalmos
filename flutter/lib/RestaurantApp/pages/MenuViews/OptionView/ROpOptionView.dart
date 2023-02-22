import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/components/ROpOptionChoiceCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/components/ROpOptionTypeSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOptionView"];

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

  String? restaurantId;
  String? optionId;

  @override
  void initState() {
    restaurantId = Get.parameters["restaurantId"];
    optionId = Get.parameters["optionId"];
    itemId = Get.parameters["itemId"];

    if (restaurantId != null && itemId != null) {
      _tabController = TabController(length: 2, vsync: this);

      _viewController.init(
          optionId: optionId, restaurantId: restaurantId!, itemID: itemId!);
    } else {
      MezRouter.back();
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
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _saveBtn(),
      body: Obx(() {
        if (_viewController.initDone.isTrue) {
          return TabBarView(
            controller: _tabController,
            children: [
              _primaryTab(),
              _secondarTab(),
            ],
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: MezLogoAnimation(
              centered: true,
            ),
          );
        }
      }),
    );
  }

  Widget _saveBtn() {
    return MezButton(
      height: 75,
      borderRadius: 0,
      withGradient: true,
      onClick: () async {
        await _handleSaveBtn();
      },
      label: (_viewController.editMode.isTrue)
          ? '${_i18n()["editOption"]}'
          : '${_i18n()["addOption"]}',
    );
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
                  Obx(
                    () {
                      if (_viewController.isEditing) {
                        return Column(
                          children: List.generate(
                              _viewController.optionChoices.length,
                              (int index) {
                            return ROpOptionChoiceCard(
                              choice: _viewController.optionChoices[index],
                              optionId:
                                  _viewController.editableOption.value!.id,
                              viewController: _viewController,
                              restaurantId: restaurantId!,
                            );
                          }),
                        );
                      } else
                        return SizedBox();
                    },
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
            Obx(() {
              if (_viewController.isEditing) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: List.generate(
                            _viewController.optionChoices.length, (int index) {
                          return ROpOptionChoiceCard(
                            choice: _viewController.optionChoices[index],
                            viewController: _viewController,
                            optionId: _viewController.editableOption.value!.id,
                            restaurantId: 4.toString(),
                          );
                        }),
                      ),
                    ),
                    MezAddButton(onClick: () async {
                      final bool? refetch = await MezRouter.toNamed(
                          RestaurantAppRoutes.getROpChoiceRoute(
                        choiceId: null,
                        optionId: _viewController.editableOption.value!.id,
                        restaurantId: restaurantId!,
                      )) as bool?;
                      if (refetch == true) {
                        await _viewController.fetchOption();
                      }
                    }),
                    _deleteOptionBtn()
                  ],
                );
              } else
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Save option so you can handle choices",
                    textAlign: TextAlign.center,
                  ),
                );
            }),
          ],
        ),
      ),
    );
  }

  Widget _deleteOptionBtn() {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: (_viewController.isEditing)
              ? MezButton(
                  label: "${_i18n()["deleteOp"]}",
                  backgroundColor: offRedColor,
                  textColor: Colors.red,
                  onClick: () async {
                    await showConfirmationDialog(context, onYesClick: () async {
                      await _viewController
                          .deleteOption()
                          .then((bool? hasBennDeleted) {
                        if (hasBennDeleted == true) {
                          MezRouter.back(result: true);
                        }
                      });
                    },
                        primaryButtonText: '${_i18n()["deleteOption"]}',
                        title: '${_i18n()["deleteOpBtn"]}',
                        helperText: "deleteOpHelper");
                  },
                )
              : null);
    });
  }

  AppBar _appBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(result: _viewController.needToFetch.value);
    },
        titleWidget: Obx(
          () => Text((_viewController.editMode.isTrue)
              ? "${_viewController.editableOption.value!.name[userLanguage]!}"
              : '${_i18n()["addOption"]}'),
        ),
        tabBar: TabBar(controller: _tabController, tabs: [
          Tab(
            child: Obx(() =>
                Text("${_viewController.primaryLang.value.toLanguageName()}")),
          ),
          Tab(
            child: Obx(() => Text(
                "${_viewController.secondaryLang.value.toLanguageName()}")),
          ),
        ]));
  }

  Future<void> _handleSaveBtn() async {
    if (!_viewController.isFirstValid || !_viewController.isSecondValid) {
      _prFormKey.currentState?.validate();
      _scFormKey.currentState?.validate();
      mezDbgPrint("switch to second $switchToSecond");
      mezDbgPrint("switch to first $switchToFirst");
      if (switchToSecond) {
        _tabController.animateTo(1);
        mezDbgPrint("Animate to second tab");
      } else if (switchToFirst) {
        _tabController.animateTo(0);
        mezDbgPrint("Animate to First tab");
      }
    } else {
      await _viewController.saveOption();
      _tabController.animateTo(0);
    }
  }

  bool get switchToFirst {
    return !_viewController.isFirstValid &&
        _tabController.index != 0 &&
        _viewController.isSecondValid;
  }

  bool get switchToSecond {
    return !_viewController.isSecondValid &&
        _tabController.index != 1 &&
        _viewController.isFirstValid;
  }

  Future<void> _handleSecondTab() async {
    if (_viewController.firstTabValid == true &&
        _scFormKey.currentState?.validate() == true) {
      //  MezRouter.back(result: viewController.saveOption());
    } else if (_scFormKey.currentState?.validate() == true &&
        _prFormKey.currentState?.validate() != true) {
      _viewController.secondTabValid = true;
      _tabController.animateTo(0);
    }
  }

  Future<void> _handleFirstTab() async {
    if (_prFormKey.currentState?.validate() == true &&
        (_scFormKey.currentState?.validate() == true ||
            _viewController.secondTabValid)) {
      await _viewController.saveOption();
      // MezRouter.back(result: viewController.saveOption());
    } else if (_prFormKey.currentState?.validate() == true &&
        _scFormKey.currentState?.validate() != true) {
      _viewController.firstTabValid = true;

      _tabController.animateTo(1);
    }
  }
}
