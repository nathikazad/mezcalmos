import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/rentalRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/AppBarActionButton.dart';
import 'HomesListView/HomesListView.dart';
import '../components/ButtonSwitcher.dart';
import 'controller/HomesServiceController.dart';
import 'AgencyListView/AgencyListView.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class HomesServiceView extends StatefulWidget {
  const HomesServiceView({super.key});

  @override
  State<HomesServiceView> createState() => _HomesServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(RentalRoutes.rentalServiceRoute);
  }
}

class _HomesServiceViewState extends State<HomesServiceView> {
  HomesServiceController homesServiceController = HomesServiceController();

  @override
  void dispose() {
    homesServiceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()['rental']["homes"]["title"].toString()),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: MezCard(
                      contentPadding: EdgeInsets.zero,
                      radius: 5,
                      content: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            prefixIcon: Icon(Icons.search),
                            hintText: _i18n()["search"].toString()),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: MezCard(
                      radius: 5,
                      content: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(
                          Icons.location_on,
                          size: 24,
                          color: primaryBlueColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(
              () => ButtonSwitcher(
                lButtonText: "Home",
                rButtonText: "Agency",
                lIconButton: Icons.home,
                rIconButton: Icons.settings_applications_rounded,
                values: [
                  HomeServiceViewEnum.Home,
                  HomeServiceViewEnum.Agency,
                ],
                selectedValue: homesServiceController.currentSelectedView.value,
                onClick: (Enum value) {
                  homesServiceController.toggleView(value);
                },
              ),
            ),
          ),
          Obx(
            () => homesServiceController.currentSelectedView.value ==
                    HomeServiceViewEnum.Home
                ? HomeListView()
                : AgencyListView(),
          ),
        ],
      ),
    );
  }
}
