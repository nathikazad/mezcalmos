import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/TextConfimOrderView/controllers/TaxiConfirmOrderViewController.dart';
import 'package:mezcalmos/CustomerApp/router/taxiOrderRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/CustOrderDeliverySelector.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/controllers/CustOrderDeliverySelectorController.dart';
import 'package:mezcalmos/Shared/widgets/PaymentMethodPicker/MezPaymentMethodPicker.dart';

dynamic _i18n() => Get.find<LanguageController>().strings;

class TaxiConfirmOrderView extends StatefulWidget {
  const TaxiConfirmOrderView({super.key});

  static Future<void> navigate({required TaxiRequest taxiRequest}) async {
    await MezRouter.toPath(TaxiOrderRoutes.taxiOrderConfrimRoute, arguments: {
      "taxiRequest": taxiRequest,
    });
  }

  @override
  State<TaxiConfirmOrderView> createState() => _TaxiConfirmOrderViewState();
}

class _TaxiConfirmOrderViewState extends State<TaxiConfirmOrderView> {
  TaxiConfirmOrderViewController viewController =
      TaxiConfirmOrderViewController();
  @override
  void initState() {
    TaxiRequest? taxiRequest =
        MezRouter.bodyArguments?["taxiRequest"] as TaxiRequest?;
    if (taxiRequest != null) {
      viewController.init(request: taxiRequest);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          title: "Order", onClick: MezRouter.back),
      bottomNavigationBar: MezButton(
        label: "Confrim",
        borderRadius: 0,
        onClick: () async {
          viewController.confrimOrder();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CustOrderDeliverySelector(
              type: CustDeliverySelectorType.Taxi,
              onSelectionUpdate: (List<int> value) {
                viewController.selectedCompanies.value = value;
              },
              distanceInKm: (viewController
                      .request.routeInformation!.distance.distanceInMeters) /
                  1000,
              onEstDeliveryPriceChange: (double value) {
                viewController.estCost.value = value;
              },
            ),
            Obx(
              () => MezPaymentMethodPicker(
                paymentType: viewController.paymentType.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
