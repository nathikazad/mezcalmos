// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class BsOpServicesListView extends StatefulWidget {
  const BsOpServicesListView({Key? key}) : super(key: key);

  @override
  _BsOpServicesListViewState createState() => _BsOpServicesListViewState();
}

class _BsOpServicesListViewState extends State<BsOpServicesListView> {
  BsServicesListViewController viewController = BsServicesListViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu, title: "Services"),
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addServiceButton(context),
            bigSeperator,
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      "Services",
                      style: context.textTheme.bodyLarge,
                    )),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MezIconButton(
                            iconSize: 18,
                            padding: EdgeInsets.all(3),
                            onTap: null,
                            icon: Icons.low_priority_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Reorder",
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: primaryBlueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 30,
            ),
            Text(
              "Home Rentals",
              style: context.textTheme.bodyLarge,
            ),
            smallSepartor,
            Obx(
              () => Column(
                children: List.generate(
                    viewController.homeRentals.length,
                    (int index) => MezCard(
                            content: Text(
                          viewController.homeRentals[index].details
                                  .name[userLanguage] ??
                              "name error",
                          style: context.textTheme.bodyLarge,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  MezButton _addServiceButton(BuildContext context) {
    return MezButton(
      label: "Add service",
      onClick: () async {
        // ignore: inference_failure_on_function_invocation
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Service type",
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    Divider(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rental",
                                style: context.textTheme.bodyLarge,
                              ),
                              Text(
                                  "Using a rental service, you can advertise a vehicle for rent.")
                            ],
                          ),
                        ),
                        radioCircleButton(onTap: (bool v) {}, value: true)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: MezButton(
                          label: "Cancel",
                          backgroundColor: offRedColor,
                          textColor: redAccentColor,
                          onClick: () async {
                            Navigator.pop(context);
                          },
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                            child: MezButton(
                          label: "Add",
                          onClick: () async {
                            Navigator.pop(context);
                            BsOpHomeRentalView.navigate(id: null);
                          },
                        ))
                      ],
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
