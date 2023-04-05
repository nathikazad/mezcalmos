import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/Homes/AssetListsView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/Rental/controller/RentalController.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/AppBarActionButton.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper']['rental'];

class RentalView extends StatefulWidget {
  const RentalView({super.key});

  @override
  State<RentalView> createState() => _RentalViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.rentalViewRoute);
  }
}

class _RentalViewState extends State<RentalView> {
  RentalController rentalController = RentalController();

  void navigateTo(int idx) {
    // TODO: enums
    if (idx == 0) {
      // TODO: Navigate to Surf
      AssetListsView.navigate(viewEnum: RentalViewEnum.Surf);
    } else if (idx == 1) {
      // TODO: Navigate to Motorcycle
      AssetListsView.navigate(viewEnum: RentalViewEnum.MotorCycle);
    } else if (idx == 2) {
      AssetListsView.navigate(viewEnum: RentalViewEnum.Homes);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()["title"].toString()),
        actionIcons: <Widget>[
          AppBarActionButton(
            icon: Icons.notifications,
            onpress: () {},
          ),
          SizedBox(width: 5),
          AppBarActionButton(
            icon: Icons.access_time_filled,
            onpress: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: rentalController.allRentalsData.length,
        itemBuilder: (BuildContext context, int index) {
          return MezCard(
            onClick: () {
              navigateTo(index);
            },
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _i18n()[rentalController.allRentalsData[index]]
                            ['title'],
                        style: txt.displayMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          _i18n()[rentalController.allRentalsData[index]]
                              ['description'],
                          style: txt.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  rentalController.allRentalsDataIcons[index].toString(),
                  height: 110,
                  width: 110,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
