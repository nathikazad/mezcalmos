import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/SubServiceController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalViews/HomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/RentalViews/OtherRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class RentalView extends StatefulWidget {
  const RentalView({super.key});

  @override
  State<RentalView> createState() => _RentalViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.rentalViewRoute);
  }
}

class _RentalViewState extends State<RentalView> {
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();
  SubServiceController rentalController = SubServiceController();

  @override
  Widget build(BuildContext context) {
    TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()[allServiceListViewController
                .currentSelectedService.value.name
                .toLowerCase()]["title"]
            .toString()),
      ),
      body: Column(
        children: [
          MezButton(
            label: "Go to service",
            onClick: () async {
              await CustServiceView.navigate(
                serviceId: 1,
              );
            },
          ),
          MezButton(
            label: "Go to Home Rental",
            onClick: () async {
              await CustHomeRentalView.navigate(
                rentalId: 14,
              );
            },
          ),
          MezButton(
            label: "Go to Rental",
            onClick: () async {
              await CustRentalView.navigate(
                rentalId: 18,
              );
            },
          ),
          MezButton(
            label: "Go to Event",
            onClick: () async {
              await CustEventView.navigate(
                eventId: 8,
              );
            },
          ),
          MezButton(
            label: "Go to Product",
            onClick: () async {
              await CustProductView.navigate(
                productId: 14,
              );
            },
          ),
          MezButton(
            label: "Go to Cust Business",
            onClick: () async {
              await CustBusinessView.navigate(
                businessId: 2,
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rentalController
                  .allRentalValues[
                      allServiceListViewController.currentSelectedService]!
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return MezCard(
                  onClick: () {
                    final RentalViewEnum goToView =
                        rentalController.allRentalValues[
                            allServiceListViewController
                                .currentSelectedService]![index]["value"];
                    if (goToView == RentalViewEnum.Homes) {
                      HomeAssetListsView.navigate(
                        viewEnum: goToView,
                      );
                    } else {
                      OtherAssetListsView.navigate(
                        viewEnum: goToView,
                      );
                    }
                  },
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _i18n()[allServiceListViewController
                                      .currentSelectedService.value.name
                                      .toLowerCase()][
                                  rentalController.allRentalValues[
                                          allServiceListViewController
                                              .currentSelectedService]![index]
                                      ["key"]]['title'],
                              style: txt.displayMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                _i18n()[allServiceListViewController
                                        .currentSelectedService.value.name
                                        .toLowerCase()][
                                    rentalController.allRentalValues[
                                            allServiceListViewController
                                                .currentSelectedService]![index]
                                        ["key"]]['description'],
                                style: txt.labelLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        rentalController.allRentalValues[
                                allServiceListViewController
                                    .currentSelectedService]![index]["icon"]
                            .toString(),
                        height: 110,
                        width: 110,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
