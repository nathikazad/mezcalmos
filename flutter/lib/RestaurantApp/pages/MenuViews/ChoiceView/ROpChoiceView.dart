import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/components/ROpChoiceAv.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ChoiceView/controllers/ROpChoiceViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpChoiceView extends StatefulWidget {
  const ROpChoiceView({super.key});

  @override
  State<ROpChoiceView> createState() => _ROpChoiceViewState();
}

class _ROpChoiceViewState extends State<ROpChoiceView>
    with SingleTickerProviderStateMixin {
  ROpChoiceViewController viewController = ROpChoiceViewController();
  late TabController tabController;
  String? choiceId;
  String? optionId;
  String? restaurantId;

  @override
  void initState() {
    choiceId = Get.parameters["choiceId"] ?? null;
    optionId = Get.parameters["optionId"];
    restaurantId = Get.parameters["restaurantId"];
    if (restaurantId != null && optionId != null) {
      tabController = TabController(length: 2, vsync: this);
      viewController.init(
          choiceId: int.tryParse(choiceId!) ?? null,
          optionId: optionId!,
          restaurantId: restaurantId!);
    } else {
      Get.back();
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
                    "Choice name",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: viewController.prChoiceName,
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choice price",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: viewController.choicePriceText,
                    style: Get.textTheme.bodyText1,
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
                    label: "Delete choice",
                    backgroundColor: offRedColor,
                    textColor: Colors.red,
                    onClick: () async {
                      await showConfirmationDialog(context,
                          onYesClick: () async {
                        await viewController
                            .deleteChoice()
                            .then((bool? hasBennDeleted) {
                          if (hasBennDeleted == true) {
                            Get.back(result: true);
                          }
                        });
                      },
                          primaryButtonText: 'Yes, delete choice',
                          title: 'Delete choice',
                          helperText:
                              "Are you sure you want to delete this choice");
                    },
                  )
                ],
              )),
            ),
            // secondary language tab//
            SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => Text(
                      "Choice name in ${viewController.secondaryLang.value.toLanguageName() ?? ""}",
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: viewController.scChoiceName,
                    style: Get.textTheme.bodyText1,
                  ),
                ],
              )),
            ),
          ],
        ));
  }

  Widget _choiceSaveBtn() {
    return MezButton(
      label: "Save choice",
      withGradient: true,
      borderRadius: 0,
      onClick: () async {
        await viewController.saveChoice();
      },
    );
  }

  AppBar _choiceAppBar() {
    return mezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: () {
        Get.back(result: viewController.needToFetch.value);
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
          return Text("New choice");
        }
      }),
    );
  }
}
