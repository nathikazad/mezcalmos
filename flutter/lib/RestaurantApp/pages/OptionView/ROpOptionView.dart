import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionChoice.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionTypeSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ROpOptionView extends StatefulWidget {
  const ROpOptionView({Key? key}) : super(key: key);

  @override
  State<ROpOptionView> createState() => _ROpOptionViewState();
}

class _ROpOptionViewState extends State<ROpOptionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ROpOptionViewController _viewController = ROpOptionViewController();
  final GlobalKey<FormState> prFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> scFormKey = GlobalKey<FormState>();

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
          bottomNavigationBar: CallToActionButton(
            height: 65,
            onTap: () async {
              saveOption();
            },
            text: (_viewController.editMode.isTrue)
                ? "Edit option"
                : "Add option",
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
        key: scFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Option name", style: Get.textTheme.bodyText1),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.scOptionName,
                style: Get.textTheme.bodyText1,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "required";
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
                    "Option choices",
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
        key: prFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Option name", style: Get.textTheme.bodyText1),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: _viewController.prOptionName,
                style: Get.textTheme.bodyText1,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "required";
                  }
                  return null;
                }),
            SizedBox(
              height: 25,
            ),
            Text(
              "Option type",
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
                    "Option choices",
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
                      backgroundColor: offRedColor, primary: Colors.redAccent),
                  onPressed: () {
                    mezDbgPrint("Delete option");
                    mezDbgPrint("$itemId");
                    if (itemId != null) {
                      showConfirmationDialog(context, onYesClick: () async {
                        Get.back(closeOverlays: true);
                        Get.back();
                      },
                          primaryButtonText: "Delete option",
                          title: "Delete this option",
                          helperText:
                              "Are you sure you want to delete this option ");
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
                          Text("Delete option"),
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
            : "Add option",
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

  void saveOption() {
    prFormKey.currentState?.save();
    scFormKey.currentState?.save();
    switch (isFormValid()) {
      case FormValid.Valid:
        _viewController.addOption();
        Get.back(result: _viewController.addOption());
        break;
      case FormValid.PrimaryNotValid:
        _tabController.animateTo(0);

        break;
      case FormValid.SecondaryNotValid:
        _tabController.animateTo(1);

        break;
      default:
    }
  }

  FormValid isFormValid() {
    if (prFormKey.currentState == null ||
        prFormKey.currentState!.validate() == false) {
      return FormValid.PrimaryNotValid;
    } else if (scFormKey.currentState == null ||
        scFormKey.currentState!.validate() == false) {
      return FormValid.SecondaryNotValid;
    } else
      return FormValid.Valid;
  }
}
