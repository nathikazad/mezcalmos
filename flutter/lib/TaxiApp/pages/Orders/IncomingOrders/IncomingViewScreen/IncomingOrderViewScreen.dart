import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/widgets/iOrderViewWidgets.dart';
import 'package:sizer/sizer.dart';

class IncomingOrderViewScreen extends StatefulWidget {
  @override
  _IncomingOrderViewScreenState createState() =>
      _IncomingOrderViewScreenState();
}

class _IncomingOrderViewScreenState extends State<IncomingOrderViewScreen> {
  final IOrderViewController iOrderViewController = IOrderViewController();
  late final IOrderViewWidgets iOrderViewWidgets;

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    iOrderViewWidgets =
        IOrderViewWidgets(iOrderViewController: iOrderViewController);
    iOrderViewController.order =
        iOrderViewController.controller.getOrder(orderId);

    // we do not setState here yet !
    if (iOrderViewController.order == null) {
      mezDbgPrint('ORDER NULL NAVIGATE BACK');
      Get.back();
    } else {
      iOrderViewController.controller
          .markOrderAsRead(orderId, iOrderViewController.order!.customer.id);
      if (iOrderViewController.order!.inProcess()) {
        // we check valid counterOffer
        iOrderViewController.startCountOffersValidityCheckPeriodically(
            orderId, iOrderViewController.order!.customer.id);
        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        iOrderViewController.mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString:
                iOrderViewController.order!.routeInformation!.polyline);
        // add the corresponding markers
        iOrderViewController.mGoogleMapController.addOrUpdateUserMarker(
            markerId: iOrderViewController.order!.customer.id,
            latLng: iOrderViewController.order!.from.toLatLng(),
            customImgHttpUrl: iOrderViewController.order!.customer.image);

        iOrderViewController.mGoogleMapController
            .addOrUpdatePurpleDestinationMarker(
                latLng: iOrderViewController.order!.to.toLatLng());
        // set initial position
        iOrderViewController.mGoogleMapController
            .setLocation(iOrderViewController.order!.from);
        // start Listening for the vailability of the iOrderViewController.order
        iOrderViewController.orderListener = iOrderViewController.controller
            .getIncomingOrderStream(orderId)
            .listen((order) {
          if (order != null &&
              !iOrderViewController.clickedAcceptButton.value) {
            // keep updating our Order only when neeeded
            if (order.cost != this.iOrderViewController.order?.cost ||
                order.distanceToClient !=
                    this.iOrderViewController.order?.distanceToClient) {
              setState(() {
                this.iOrderViewController.order = iOrderViewController.order;
              });
            }
          } else {
            // if the Order is no more available , Show a pop up while poping back back !
            if (iOrderViewController.clickedAcceptButton.value == false) {
              iOrderViewController.cancelOrderSubscription();
              Get.back();
              oneButtonDialog(
                  title: 'Oops...',
                  body: iOrderViewController.lang.strings['taxi']['cancelOrder']
                      ['rideUnavailble'],
                  bodyTextColor: Colors.black,
                  fontSize: 14.sp,
                  imagUrl: a404);
            }
          }
        });

        // // check if iOrderViewController.order is in negotiation
        // if (taxiAuthController.taxiState?.inNegotationOrderId ==
        //     iOrderViewController.order!.orderId) {
        //   // start the listener
        //   iOrderViewController.controller.counterOfferEvent(iOrderViewController.order!.orderId, iOrderViewController.order!.customer.id);
        // }
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    iOrderViewController.cancelOrderSubscription();
    iOrderViewController.countOfferTimerValidator?.cancel();
    iOrderViewController.countOfferTimerValidator = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => iOrderViewController.counterOffer.value == null,
        child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: iOrderViewController.counterOffer.value == null
                  ? () {
                      iOrderViewController.cancelOrderSubscription();
                      Get.back();
                    }
                  : null),
          body: iOrderViewController.order != null
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    MGoogleMap(
                      mGoogleMapController:
                          iOrderViewController.mGoogleMapController,
                      debugString: "IncomingViewScreen",
                      myLocationButtonEnabled: false,
                    ),
                    if (iOrderViewController.submittedCounterOffer.value &&
                        iOrderViewController.counterOffer.value == null)
                      InkWell(
                        onTap: () {
                          iOrderViewController.submittedCounterOffer.value =
                              false;
                        },
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                        ),
                      ),
                    IncomingPositionedBottomBar(
                      order: this.iOrderViewController.order!,
                    ),
                    if (iOrderViewController.counterOffer.value == null)
                      iOrderViewWidgets.acceptAndOfferButtons(),
                    iOrderViewWidgets.counterOfferBottomSheet(),
                    IncomingPositionedFromToTopBar(
                      order: this.iOrderViewController.order!,
                    )
                  ],
                )
              : MezLogoAnimation(
                  centered: true,
                ),
        ),
      ),
    );
  }
}
