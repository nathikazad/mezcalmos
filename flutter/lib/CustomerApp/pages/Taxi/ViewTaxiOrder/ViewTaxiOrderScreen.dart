import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/widgets/CounterOfferWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/widgets/ViewTaxiOrderScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TopBar.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen> {
  final ViewTaxiOrderController viewController = ViewTaxiOrderController();
  late final ViewTaxiOrderScreenWidgets viewWidgets;
  late final CounterOfferWidgets counterOfferWidgets;
  LanguageController lang = Get.find<LanguageController>();
  /******************************  Init and build function ************************************/
  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    viewWidgets = ViewTaxiOrderScreenWidgets(viewController: viewController);
    viewController.init(orderId, orderCancelledCallback: (TaxiOrder order) {
      Get.back();
      oneButtonDialog(
          body: lang.strings['shared']['snackbars']['orderCancelSuccess'],
          imagUrl: order.customer.image);
    });
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: () => Get.back()),
        // appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Obx(
          () => viewController.order.value != null
              ? Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                      Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: MGoogleMap(
                            mGoogleMapController:
                                this.viewController.mGoogleMapController,
                            periodicRerendering: true,
                          )),
                      if (viewController.offersBtnClicked.value)
                        InkWell(
                          onTap: !viewController.clickedAccept.value
                              ? () {
                                  viewController.offersBtnClicked.value = false;
                                }
                              : null,
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                          ),
                        ),
                      TopBar(order: viewController.order.value!),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        right: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (viewController.counterOffers.isNotEmpty &&
                                viewController.order.value!.status ==
                                    TaxiOrdersStatus.LookingForTaxi)
                              Flexible(
                                  child: counterOfferWidgets.offersButton()),
                            if (viewController.counterOffers.isNotEmpty)
                              SizedBox(
                                width: 10,
                              ),
                            Flexible(
                                child: viewWidgets.cancelButton(
                                    viewController.order.value!.status)),
                          ],
                        ),
                      ),
                      TaxiOrderBottomBar(order: viewController.order),
                      viewWidgets.getToolTip(),
                      counterOfferWidgets.counterOffersBottomSheet(context),
                    ])
              : MezLogoAnimation(
                  centered: true,
                ),
        ));
  }
}
