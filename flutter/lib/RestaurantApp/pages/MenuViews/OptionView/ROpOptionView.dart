import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/ROpChoiceView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/components/ROpOptionChoiceCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/components/ROpOptionTypeSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOptionView"];

class ROpOptionView extends StatefulWidget {
  const ROpOptionView({Key? key}) : super(key: key);

  static Future<bool?> navigate(
      {required int restaurantId,
      required int restaurantDetailsId,
      required int? optionId,
      required int itemId}) async {
    String route = RestaurantAppRoutes.restaurantOptionRoute
        .replaceAll(":restaurantId", "$restaurantId")
        .replaceAll(":itemId", "$itemId");
    if (optionId != null) {
      route = route.replaceFirst(":optionId", "$optionId");
    }

    await MezRouter.toPath(route,
        arguments: {"detailsId": restaurantDetailsId});
    return MezRouter.backResult;
  }

  @override
  State<ROpOptionView> createState() => _ROpOptionViewState();
}

class _ROpOptionViewState extends State<ROpOptionView>
    with SingleTickerProviderStateMixin {
  ROpOptionViewController _viewController = ROpOptionViewController();

  String? itemId;
  int? detailsId;

  String? restaurantId;
  String? optionId;

  @override
  void initState() {
    restaurantId = MezRouter.urlArguments["restaurantId"].toString();
    optionId = MezRouter.urlArguments["optionId"].toString();
    itemId = MezRouter.urlArguments["itemId"].toString();
    detailsId = MezRouter.bodyArguments?["detailsId"] as int?;

    if (restaurantId != null && itemId != null && detailsId != null) {
      _viewController.init(
          vsync: this,
          detailsId: detailsId!,
          optionId: optionId,
          restaurantId: restaurantId!,
          itemID: itemId!);
    } else {
      MezRouter.back();
    }
    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_viewController.initDone) {
        return Scaffold(
            appBar: _appBar(),
            bottomNavigationBar: _saveBtn(),
            body: TabBarView(
              controller: _viewController.languageTabsController.tabController,
              children: [
                _primaryTab(),
                if (_viewController.languageTabsController.hasSecondaryLang)
                  _secondarTab(),
              ],
            ));
      } else {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: MezLogoAnimation(
            centered: true,
          ),
        );
      }
    });
  }

  Widget _saveBtn() {
    return MezButton(
      height: 75,
      borderRadius: 0,
      withGradient: true,
      onClick: () async {
        await _viewController.saveOption();
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
        key: _viewController.languageTabsController.secondaryLangFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i18n()["optionName"]}',
                style: context.textTheme.bodyLarge),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.scOptionName,
                style: context.textTheme.bodyLarge,
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
                    style: context.txt.bodyLarge,
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
        key: _viewController.languageTabsController.primaryLangFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i18n()["optionName"]}', style: context.txt.bodyLarge),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.prOptionName,
                style: context.txt.bodyLarge,
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
              style: context.txt.bodyLarge,
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
              style: context.txt.bodyLarge,
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
                      final bool? refetch = await ROpChoiceView.navigate(
                          choiceId: null,
                          detailsId: detailsId!,
                          restaurantId: restaurantId!,
                          optionId: _viewController
                              .editableOption.value!.id) as bool?;
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
                          MezRouter.back(backResult: true);
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
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: _viewController.needToFetch.value);
    },
        titleWidget: Obx(
          () => Text((_viewController.editMode.isTrue)
              ? "${_viewController.editableOption.value!.name.getTranslation(userLanguage)}"
              : '${_i18n()["addOption"]}'),
        ),
        tabBar: (_viewController.languageTabsController.hasSecondaryLang)
            ? TabBar(
                controller:
                    _viewController.languageTabsController.tabController,
                tabs: [
                    Tab(
                        child: Text(
                            "${_viewController.languages!.primary.toLanguageName()}")),
                    Tab(
                        child: Text(
                            "${_viewController.languages!.secondary?.toLanguageName() ?? ""}")),
                  ])
            : null);
  }
}
