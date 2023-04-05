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
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpChoiceView"];

//
class ROpChoiceView extends StatefulWidget {
  const ROpChoiceView({super.key});

  static Future<void> navigate(
      {required int? choiceId,
      required String restaurantId,
      required int optionId}) {
    String route = RestaurantAppRoutes.restaurantChoiceRoute
        .replaceAll(":restaurantId", restaurantId)
        .replaceAll(":optionId", optionId.toString());

    if (choiceId != null) {
      route = route.replaceFirst(":choiceId", "$choiceId");
    }
    return MezRouter.toPath(route);
  }

  @override
  State<ROpChoiceView> createState() => _ROpChoiceViewState();
}

class _ROpChoiceViewState extends State<ROpChoiceView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _prFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _scFormKey = GlobalKey<FormState>();
  ROpChoiceViewController viewController = ROpChoiceViewController();
  late TabController tabController;
  String? choiceId;
  String? optionId;
  String? restaurantId;

  @override
  void initState() {
    choiceId = MezRouter.urlArguments["choiceId"].toString();
    optionId = MezRouter.urlArguments["optionId"].toString();
    restaurantId = MezRouter.urlArguments["restaurantId"].toString();
    if (restaurantId != null && optionId != null) {
      tabController = TabController(length: 2, vsync: this);
      viewController.init(
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
    return Scaffold(
        appBar: _choiceAppBar(),
        bottomNavigationBar: _choiceSaveBtn(),
        body: TabBarView(
          controller: tabController,
          children: [
            // primary language tab //
            SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: Form(
                  key: _prFormKey,
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
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
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
            ),
            // secondary language tab//
            SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: Form(
                  key: _scFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => Text(
                          "${_i18n()['choiceNameIn']} ${viewController.secondaryLang.value.toLanguageName() ?? ""}",
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
            ),
          ],
        ));
  }

  Widget _choiceSaveBtn() {
    return MezButton(
      label: "${_i18n()['save']}",
      withGradient: true,
      borderRadius: 0,
      onClick: () async {
        await _handleSaveBtn();
      },
    );
  }

  AppBar _choiceAppBar() {
    return MezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: () {
        MezRouter.back(backResult: viewController.needToFetch.value);
      },
      tabBar: TabBar(controller: tabController, tabs: [
        Tab(
          child: Obx(() =>
              Text(viewController.primaryLang.value.toLanguageName() ?? "")),
        ),
        Tab(
          child: Obx(() =>
              Text(viewController.secondaryLang.value.toLanguageName() ?? "")),
        ),
      ]),
      titleWidget: Obx(() {
        if (viewController.editMode.isTrue) {
          return Text(viewController.choice.value!.name[userLanguage]!);
        } else {
          return Text(
            "${_i18n()['newChoice']}",
          );
        }
      }),
    );
  }

  Future<void> _handleSaveBtn() async {
    if (!viewController.isFirstValid || !viewController.isSecondValid) {
      _prFormKey.currentState?.validate();
      _scFormKey.currentState?.validate();
      mezDbgPrint("switch to second $switchToSecond");
      mezDbgPrint("switch to first $switchToFirst");
      if (switchToSecond) {
        tabController.animateTo(1);
        mezDbgPrint("Animate to second tab");
      } else if (switchToFirst) {
        tabController.animateTo(0);
        mezDbgPrint("Animate to First tab");
      }
    } else {
      await viewController.saveChoice();
      tabController.animateTo(0);
    }
  }

  bool get switchToFirst {
    return !viewController.isFirstValid &&
        tabController.index != 0 &&
        viewController.isSecondValid;
  }

  bool get switchToSecond {
    return !viewController.isSecondValid &&
        tabController.index != 1 &&
        viewController.isFirstValid;
  }

  Future<void> _handleSecondTab() async {
    if (viewController.firstTabValid == true &&
        _scFormKey.currentState?.validate() == true) {
      //  MezRouter.back(result: viewController.saveOption());
    } else if (_scFormKey.currentState?.validate() == true &&
        _prFormKey.currentState?.validate() != true) {
      viewController.secondTabValid = true;
      tabController.animateTo(0);
    }
  }

  Future<void> _handleFirstTab() async {
    if (_prFormKey.currentState?.validate() == true &&
        (_scFormKey.currentState?.validate() == true ||
            viewController.secondTabValid)) {
      await viewController.saveChoice();
      // MezRouter.back(result: viewController.saveOption());
    } else if (_prFormKey.currentState?.validate() == true &&
        _scFormKey.currentState?.validate() != true) {
      viewController.firstTabValid = true;

      tabController.animateTo(1);
    }
  }
}
