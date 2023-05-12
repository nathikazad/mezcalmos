import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/components/ROpChoiceAv.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/controllers/ROpChoiceViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpChoiceView"];

//
class ROpChoiceView extends StatefulWidget {
  const ROpChoiceView({super.key});

  static Future<void> navigate(
      {required int? choiceId,
      required String restaurantId,
      required int detailsId,
      required int optionId}) {
    String route = RestaurantAppRoutes.restaurantChoiceRoute
        .replaceAll(":restaurantId", restaurantId)
        .replaceAll(":optionId", optionId.toString());

    if (choiceId != null) {
      route = route.replaceFirst(":choiceId", "$choiceId");
    }
    return MezRouter.toPath(route, arguments: {"detailsId": detailsId});
  }

  @override
  State<ROpChoiceView> createState() => _ROpChoiceViewState();
}

class _ROpChoiceViewState extends State<ROpChoiceView>
    with SingleTickerProviderStateMixin {
  ROpChoiceViewController viewController = ROpChoiceViewController();
  String? choiceId;
  String? optionId;
  int? detailsId;
  String? restaurantId;

  @override
  void initState() {
    choiceId = MezRouter.urlArguments["choiceId"].toString();
    optionId = MezRouter.urlArguments["optionId"].toString();
    restaurantId = MezRouter.urlArguments["restaurantId"].toString();
    detailsId = int.tryParse(MezRouter.bodyArguments!["detailsId"].toString());
    if (detailsId != null && restaurantId != null && optionId != null) {
      viewController.init(
          detailsId: detailsId!,
          vsync: this,
          choiceId: (choiceId != null) ? int.tryParse(choiceId!) : null,
          optionId: int.parse(optionId!),
          restaurantId: int.parse(restaurantId!));
    } else {
      MezRouter.back();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewController.hasData) {
        return Scaffold(
            appBar: _choiceAppBar(),
            bottomNavigationBar: _choiceSaveBtn(),
            body: TabBarView(
              controller: viewController.languageTabsController.tabController,
              children: [
                // primary language tab //
                _primaryTab(context),
                // secondary language tab//
                if (viewController.hasSecondaryLang) _secondaryTab(context),
              ],
            ));
      } else {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: MezLogoAnimation(
            centered: true,
          ),
        );
      }
    });
  }

  SingleChildScrollView _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(13),
      child: Form(
          key: viewController.languageTabsController.secondaryLangFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Obx(
                () => Text(
                  "${_i18n()['choiceNameIn']} ${viewController.languages!.secondary?.toLanguageName() ?? ""}",
                  style: context.txt.bodyLarge,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: viewController.scChoiceName,
                style: context.txt.bodyLarge,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "${_i18n()['required']}";
                  }
                  return null;
                },
              ),
            ],
          )),
    );
  }

  SingleChildScrollView _primaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(13),
      child: Form(
          key: viewController.languageTabsController.primaryLangFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => ROpAvailableChips(
                    isAvailable: viewController.isAv.value,
                    marging: EdgeInsets.symmetric(vertical: 10),
                    onAvailableTap: (bool? v) {
                      viewController.switchChoiceAv(true);
                    },
                    onUnavailableTap: (bool? v) {
                      viewController.switchChoiceAv(false);
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${_i18n()['choiceName']}",
                style: context.txt.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: viewController.prChoiceName,
                style: context.txt.bodyLarge,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "${_i18n()['required']}";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${_i18n()['choicePrice']}",
                style: context.txt.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: viewController.choicePriceText,
                style: context.txt.bodyLarge,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "${_i18n()['required']}";
                  }
                  return null;
                },
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))
                ],
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_rounded)),
              ),
              SizedBox(
                height: 35,
              ),
              MezButton(
                label: "${_i18n()['deleteChoice']}",
                backgroundColor: offRedColor,
                textColor: Colors.red,
                onClick: () async {
                  await showConfirmationDialog(
                    context,
                    onYesClick: () async {
                      await viewController
                          .deleteChoice()
                          .then((bool? hasBennDeleted) {
                        if (hasBennDeleted == true) {
                          MezRouter.back(backResult: true);
                        }
                      });
                    },
                    primaryButtonText: "${_i18n()['yDeleteChoice']}",
                    title: "${_i18n()['deleteChoice']}",
                    helperText: "${_i18n()['helperText']}",
                  );
                },
              )
            ],
          )),
    );
  }

  Widget _choiceSaveBtn() {
    return MezButton(
      label: "${_i18n()['save']}",
      withGradient: true,
      borderRadius: 0,
      onClick: () async {
        await viewController.saveChoice();
      },
    );
  }

  AppBar _choiceAppBar() {
    return MezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: () {
        MezRouter.back(backResult: viewController.needToFetch.value);
      },
      tabBar: (viewController.hasSecondaryLang)
          ? TabBar(
              controller: viewController.languageTabsController.tabController,
              tabs: [
                  Tab(
                    child: Text(
                        viewController.languages!.primary.toLanguageName() ??
                            ""),
                  ),
                  Tab(
                      child: Text(viewController.languages!.secondary
                              ?.toLanguageName() ??
                          "")),
                ])
          : null,
      titleWidget: Obx(() {
        if (viewController.editMode.isTrue) {
          return Text(
              viewController.choice.value!.name.getTranslation(userLanguage));
        } else {
          return Text(
            "${_i18n()['newChoice']}",
          );
        }
      }),
    );
  }
}
