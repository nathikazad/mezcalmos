import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/widgets/ViewTaxiOrderScreenWidgets.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TopBar.dart';
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

  /******************************  Init and build function ************************************/
  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    viewWidgets = ViewTaxiOrderScreenWidgets(viewController: viewController);
    viewController.controller.clearOrderNotifications(orderId);
    viewController.order.value =
        viewController.controller.getOrder(orderId) as TaxiOrder?;
    if (viewController.order.value != null) {
      // set initial location
      viewController.mGoogleMapController
          .setLocation(viewController.order.value!.from);
      // add the polylines!
      viewController.mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString:
              viewController.order.value!.routeInformation!.polyline);
      viewController.mGoogleMapController
          .setAnimateMarkersPolyLinesBounds(true);
      viewController.mGoogleMapController.animateAndUpdateBounds();

      if (viewController.order.value!.inProcess()) {
        viewController
            .inProcessOrderStatusHandler(viewController.order.value!.status);
        viewController.startCountOffersValidityCheckPeriodically();
        viewController.orderListener = viewController.controller
            .getCurrentOrderStream(orderId)
            .listen((currentOrder) async {
          if (currentOrder != null) {
            viewController.order.value = currentOrder as TaxiOrder;
            viewController.inProcessOrderStatusHandler(
                viewController.order.value!.status);
            // setState(() {});
          } else {
            viewController.orderListener?.cancel();
            viewController.orderListener = null;
            TaxiOrder? _order =
                viewController.controller.getOrder(orderId) as TaxiOrder?;
            // this else clause gets executed when the order becomes /pastOrders.
            if (_order == null) {
              if (viewController.order.value!.status ==
                  TaxiOrdersStatus.CancelledByCustomer) {
                Get.back();
                oneButtonDialog(
                    body: viewController.lang.strings['shared']['snackbars']
                        ['orderCancelSuccess'],
                    imagUrl: _order!.customer.image);
              }
              _order = (await viewController.controller
                  .getPastOrderStream(orderId)
                  .first) as TaxiOrder?;
            }

            viewController.order.value = _order;
            // one time execution :
            viewController.mGoogleMapController
                .setAnimateMarkersPolyLinesBounds(true);
            viewController
                .pastOrderStatusHandler(viewController.order.value!.status);
            // setState(() {});
          }
        });
      } else {
        // it's in past orders!
        viewController
            .pastOrderStatusHandler(viewController.order.value!.status);
        // setState(() {});
      }
    } else {
      mezDbgPrint("Error :Unfound Order !");
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.orderListener?.cancel();
    viewController.orderListener = null;
    viewController.countOfferTimerValidator?.cancel();
    viewController.countOfferTimerValidator = null;
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
                              Flexible(child: viewWidgets.offersButton()),
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
                      viewWidgets.counterOffersBottomSheet(context),
                    ])
              : MezLogoAnimation(
                  centered: true,
                ),
        ));
  }
}
