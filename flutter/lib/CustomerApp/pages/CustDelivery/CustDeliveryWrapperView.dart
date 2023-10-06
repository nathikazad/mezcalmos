import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryRequest/CustDeliveryRequestView.dart';
import 'package:mezcalmos/CustomerApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustDeliveryWrapperView extends StatefulWidget {
  const CustDeliveryWrapperView({super.key});
  static Future<void> navigate() {
    return MezRouter.toPath(CustDeliveryRoutes.deliveryWrapperRoute);
  }

  @override
  State<CustDeliveryWrapperView> createState() =>
      _CustDeliveryWrapperViewState();
}

class _CustDeliveryWrapperViewState extends State<CustDeliveryWrapperView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "Delivery"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            meduimSeperator,
            ServicesCard(
              title: "Food",
              subtitle: "Food subtitle",
              imageAssetPath: aRestaurant,
              onTap: () {},
            ),
            smallSepartor,
            ServicesCard(
              title: "Delivery",
              subtitle: "Delivey subtitle",
              imageAssetPath: aDelivery,
              onTap: () {},
            ),
            smallSepartor,
            ServicesCard(
              title: "Delivery",
              subtitle: "Delivey subtitle",
              imageAssetPath: aDelivery,
              onTap: () {},
            ),
            smallSepartor,
            ServicesCard(
              title: "Open",
              subtitle: "Open subtitle",
              imageAssetPath: aDelivery,
              onTap: () {
                CustDeliveryRequestView.navigate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
