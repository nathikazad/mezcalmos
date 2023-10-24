import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/models/CustDeliveryType.dart';
import 'package:mezcalmos/CustomerApp/pages/CustDelivery/CustDeliveryRequest/CustDeliveryRequestView.dart';
import 'package:mezcalmos/CustomerApp/router/deliveryRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustDelivery']['CustDeliveryWrapperView'];

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
          onClick: MezRouter.back, title: "${_i18n()['delivery']}"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            children:
                List.generate(CustDeliveryType.values.length, (int index) {
          final String formattedDvType =
              CustDeliveryType.values[index].toFirebaseFormatString();
          return ServicesCard(
            title: "${_i18n()['$formattedDvType']['title']}",
            subtitle: "${_i18n()['$formattedDvType']['subtitle']}",
            imageAssetPath: CustDeliveryType.values[index].imageAsset,
            onTap: () {
              CustDeliveryRequestView.navigate(
                  deliveryType: CustDeliveryType.values[index]);
            },
          );
        })),
      ),
    );
  }
}
