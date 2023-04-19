import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessBlueText.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessTitle.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDescription.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessLocation.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';

class CustHomeRentalView extends StatefulWidget {
  const CustHomeRentalView({super.key});
  static Future<void> navigate({required int rentalId}) async {
    final String route =
        CustBusinessRoutes.custHomeRentalRoute.replaceFirst(":id", "$rentalId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalView> createState() => _CustHomeRentalViewState();
}

class _CustHomeRentalViewState extends State<CustHomeRentalView> {
  CustHomeRentalViewController viewController = CustHomeRentalViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init rental view with id => $rentalId");
    if (rentalId != null) {
      viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Rental ID $rentalId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.homeRental != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.homeRental!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustBusinessTitle(
                        title: viewController
                                .homeRental!.details.name[userLanguage] ??
                            "No Title",
                      ),
                      _CustBusinessAdditionalData(
                        homeRental: viewController.homeRental!,
                      ),
                      _BuildRentalCost(
                        cost: viewController.homeRental!.details.cost,
                      ),
                      CustBusinessDescription(
                        description:
                            viewController.homeRental!.details.description,
                      ),
                      CustBusinessLocation(
                        location: viewController.homeRental!.gpsLocation,
                      ),
                      CustBusinessMessageCard(
                        business: viewController.homeRental!.business,
                      ),
                      CustBusinessNoOrderBanner(),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }
}

class _BuildRentalCost extends StatelessWidget {
  const _BuildRentalCost({required this.cost});

  final Map<TimeUnit, num>? cost;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> generateCosetData() {
      String removePerFromUnit(TimeUnit unit) {
        return unit.name.toLowerCase().replaceAll("per", "");
      }

      final List<Map<String, dynamic>> data = [];
      var allCost = cost ?? {};
      allCost.map((key, value) {
        switch (key) {
          case TimeUnit.PerHour:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.hourglass_top,
            });
            break;
          case TimeUnit.PerDay:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.event,
            });
            break;
          case TimeUnit.PerWeek:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.date_range,
            });
            break;
          case TimeUnit.PerMonth:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.calendar_month,
            });
            break;
          case TimeUnit.Total:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.equalizer,
            });
            break;
          case TimeUnit.PerPerson:
            data.add({
              "cost": double.parse("$value"),
              "unit": removePerFromUnit(key),
              "icon": Icons.person,
            });
            break;
        }
        return MapEntry(key, value);
      });
      return data;
    }

    final List<Map<String, dynamic>> costData = generateCosetData();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < costData.length; index++)
            Column(
              children: [
                Icon(
                  costData[index]["icon"],
                ),
                Text(
                  "\$${(costData[index]["cost"] as double).toStringAsFixed(0)}/${costData[index]["unit"]}",
                ),
              ],
            )
        ],
      ),
    );
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.homeRental,
  });

  final RentalWithBusinessCard? homeRental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final String circle = "•";
      final Map<String, String> additionalValues = {
        "bedRooms": "Bedrooms ${homeRental?.bedrooms ?? 0}",
        "bathRooms": "Bathrooms ${homeRental?.bathrooms ?? 0}",
        "houseType": "${homeRental?.homeType ?? ""}",
      };
      final Map<String, String> moreAdditionalValues = homeRental
              ?.details.additionalParameters
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};

      additionalValues.addAll(
        moreAdditionalValues,
      );
      final StringBuffer wholeString = StringBuffer();
      additionalValues.map(
        (key, value) {
          wholeString.write("$circle $value ");
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    return CustBusinessBlueText(
      text: wholeAdditionalParamString(),
    );
  }
}
