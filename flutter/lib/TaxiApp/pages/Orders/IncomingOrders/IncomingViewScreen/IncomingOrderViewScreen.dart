import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';

class IncomingOrderViewScreen extends StatefulWidget {
  @override
  _IncomingOrderViewScreenState createState() =>
      _IncomingOrderViewScreenState();
}

class _IncomingOrderViewScreenState extends State<IncomingOrderViewScreen> {
  LanguageController lang = Get.find<LanguageController>();
  TaxiOrder? order;
  IncomingOrdersController controller = Get.find<IncomingOrdersController>();
  StreamSubscription? _orderListener;
  MGoogleMapController mGoogleMapController = MGoogleMapController();

  bool _clickedButton = false;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    order = controller.getOrder(orderId);

    // we do not setState here yet !
    if (order == null) {
      mezDbgPrint('ORDER NULL NAVIGATE BACK');
      Get.back();
    } else {
      controller.markOrderAsRead(orderId, order!.customer.id);
      if (order!.inProcess()) {
        // populate the LatLngPoints from the encoded PolyLine String + SetState!
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order!.routeInformation.polyline);
        // add the corresponding markers
        mGoogleMapController.addOrUpdateUserMarker(
            markerId: order!.customer.id,
            latLng: order!.from.toLatLng(),
            customImgHttpUrl: order!.customer.image);

        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order!.to.toLatLng());
        // set initial position
        mGoogleMapController.setLocation(order!.from);
        // start Listening for the vailability of the order
        _orderListener =
            controller.getIncomingOrderStream(orderId).listen((order) {
          mezDbgPrint(" @adsad@ : Inside listener ");
          mezDbgPrint(" @adsad@ : order != null : ${order != null} ");

          if (order != null && !_clickedButton) {
            mezDbgPrint(" @adsad@ : Inside listener:: if ");

            // keep updating our Order only when neeeded
            if (order.cost != this.order?.cost ||
                order.distanceToClient != this.order?.distanceToClient) {
              setState(() {
                this.order = order;
              });
            }
          } else {
            // if the Order is no more available , Show a pop up while poping back back !
            if (_clickedButton == false) {
              cancelOrderSubscription();
              Get.back();
              oneButtonDialog(
                  title: 'Oops...',
                  body: lang.strings['taxi']['cancelOrder']['rideUnavailble'],
                  bodyTextColor: Colors.black,
                  fontSize: 14.sp,
                  imagUrl: a404);
            }
          }
        });

        // check if order is in negotiation
        if (taxiAuthController.taxiState?.inNegotationOrderId ==
            order!.orderId) {
          // start the listener
          controller.counterOfferEvent(order!.orderId);
        }
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    cancelOrderSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
        cancelOrderSubscription();
        Get.back();
      }),
      body: order != null
          ? Stack(
              alignment: Alignment.topCenter,
              children: [
                MGoogleMap(
                  mGoogleMapController: mGoogleMapController,
                  debugString: "IncomingViewScreen",
                  myLocationButtonEnabled: false,
                ),
                IncomingPositionedBottomBar(
                  order: this.order!,
                ),
                Positioned(
                    bottom: GetStorage().read(getxGmapBottomPaddingKey),
                    child: acceptOrderButton(
                      child: !_clickedButton
                          ? Text(
                              lang.strings['taxi']['taxiView']["acceptOrders"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const SizedBox(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              height: 20,
                              width: 20,
                            ),
                    )),
                IncomingPositionedFromToTopBar(
                  order: this.order!,
                )
              ],
            )
          : MezLogoAnimation(
              centered: true,
            ),
    );
  }

  /// Call this right after accept order
  /// Uses : Make sure that the orderId has been written to the taxiState since we do not await it in backend.
  Future<void> avoidAcceptRideRaceCondition(String orderId) async {
    if (Get.find<TaxiAuthController>().taxiState?.currentOrder == null) {
      mezDbgPrint(
          "[+] s@@d ==> [ ACCEPT TAXI ORDER ]  RACING CONDITION HAPPENING ... ");
      await Get.find<TaxiAuthController>()
          .stateStream
          .firstWhere((taxiState) => taxiState?.currentOrder != null);
    } else
      mezDbgPrint(
          "[+] s@@d ==> [ ACCEPT TAXI ORDER ] NO RACING CONDITION HAPPEND ! ");
  }

  void cancelOrderSubscription() {
    _orderListener?.cancel();
    _orderListener = null;
  }

  Widget acceptOrderButton({required Widget child}) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
            getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
      ),
      onPressed: !_clickedButton
          ? () async {
              String _orderId = order!.orderId;
              setState(() {
                _clickedButton = true;
              });

              ServerResponse serverResponse =
                  await controller.acceptTaxi(_orderId);

              if (serverResponse.success) {
                await avoidAcceptRideRaceCondition(_orderId);
                // canceling Subscription Just to Avoid possible Racing Conditions
                cancelOrderSubscription();
                // Go to CurrentOrder View !
                Get.offNamedUntil(
                    kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
                // Notice the User !
              } else {
                // in case Taxi User failed accepting the order.
                setState(() {
                  _clickedButton = false;
                });
                Get.back();
                MezSnackbar("Oops..", serverResponse.errorMessage!);
              }
            }
          : () => null,
      child: child,
    );
  }
}
