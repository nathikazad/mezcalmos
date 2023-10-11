import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryWrapperView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustFoodListView/CustFoodListView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustServicesList extends StatefulWidget {
  const CustServicesList({super.key});

  @override
  State<CustServicesList> createState() => _CustServicesListState();
}

class _CustServicesListState extends State<CustServicesList>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Menu,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            meduimSeperator,
            ServicesCard(
              title: "${_i18n()['food']['title']}",
              subtitle: "${_i18n()['food']['subtitle']}",
              imageAssetPath: aRestaurant,
              onTap: () {
                CustFoodListView.navigate();
              },
            ),
            smallSepartor,
            ServicesCard(
              title: "${_i18n()['courier']['title']}",
              subtitle: "${_i18n()['courier']['subtitle']}",
              imageAssetPath: aDelivery,
              onTap: () {
                CustDeliveryWrapperView.navigate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
