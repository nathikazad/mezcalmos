import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionChoice.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpOptionTypeSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

class ROpOptionView extends StatefulWidget {
  const ROpOptionView({Key? key}) : super(key: key);

  @override
  State<ROpOptionView> createState() => _ROpOptionViewState();
}

class _ROpOptionViewState extends State<ROpOptionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ROpOptionViewController _viewController = ROpOptionViewController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _viewController.init();
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
      bottomNavigationBar: CallToActionButton(
        height: 65,
        onTap: () {
          if (_formKey.currentState!.validate()) {
            _viewController.contructOption();
            mezDbgPrint(_viewController.contructOption());
            Get.back(result: _viewController.contructOption());
          } else {}
        },
        text: "Add option",
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          controller: _tabController,
          children: [
            // Primary language tab view
            SingleChildScrollView(
              padding: const EdgeInsets.all(12),
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
                  Obx(() => ROpOptionSelector(
                        value: _viewController.optionType.value,
                        ontap: (OptionType newOp) {
                          _viewController.switchOptionType(newOp);
                        },
                      )),
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
                                _viewController.optionChoices.length,
                                (int index) {
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
                  })
                ],
              ),
            ),
            // Secondary language tab view
            SingleChildScrollView(
              padding: const EdgeInsets.all(12),
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
                                _viewController.optionChoices.length,
                                (int index) {
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
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return mezcalmosAppBar(AppBarLeftButtonType.Back,
        onClick: Get.back,
        title: "Add option",
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
}
