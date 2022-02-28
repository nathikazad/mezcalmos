import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/components/IncrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
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
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/components/CounterOfferBottomSheet/CounterOfferPriceSetter.dart';
import 'package:mezcalmos/TaxiApp/components/CounterOfferBottomSheet/CounterOfferSentBottomSheet.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
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
  Rxn<CounterOffer> counterOffer = Rxn();

  bool _clickedAcceptButton = false;
  bool _offeredPrice = false;
  bool _clickedOffersBtn = false;

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

          if (order != null && !_clickedAcceptButton) {
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
            if (_clickedAcceptButton == false) {
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
          controller.counterOfferEvent(order!.orderId, order!.customer.id);
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
    return Obx(
      () => WillPopScope(
        onWillPop: () async => !_offeredPrice,
        child: Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: !_offeredPrice
                  ? () {
                      cancelOrderSubscription();
                      Get.back();
                    }
                  : null),
          body: order != null
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    MGoogleMap(
                      mGoogleMapController: mGoogleMapController,
                      debugString: "IncomingViewScreen",
                      myLocationButtonEnabled: false,
                    ),
                    if (_clickedOffersBtn && !_offeredPrice)
                      InkWell(
                        onTap: () {
                          setState(() {
                            _clickedOffersBtn = false;
                          });
                        },
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                        ),
                      ),
                    IncomingPositionedBottomBar(
                      order: this.order!,
                    ),
                    acceptAndOfferButtons(),
                    counterOfferBottomSheet(),
                    IncomingPositionedFromToTopBar(
                      order: this.order!,
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

  /// this holds the two Accept / Offer buttons.
  Positioned acceptAndOfferButtons() {
    return Positioned(
      bottom: GetStorage().read(getxGmapBottomPaddingKey),
      left: 10,
      right: 10,
      child: Container(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: acceptOrderButton(
                child: !_clickedAcceptButton
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
              ),
            ),
            SizedBox(width: 10),
            Expanded(flex: 1, child: offerBtn()),
          ],
        ),
      ),
    );
  }

  /// this holds the BottomSheet when the TaxiDriver clicks offer Price.
  Positioned counterOfferBottomSheet() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: _clickedOffersBtn ? 40.h : 0,
            curve: Curves.easeInExpo,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                physics: ClampingScrollPhysics(),
                child: _offeredPrice
                    ? CounterOfferSentBottomSheet(
                        counterOffer: counterOffer,
                        controller: controller,
                        order: order!,
                        onCounterEnd: () async {
                          await controller.removeFromNegotiationMode(
                              order!.orderId, order!.customer.id,
                              expired: true);
                          setState(() {
                            _clickedOffersBtn = false;
                            _offeredPrice = false;
                          });
                        },
                      )
                    : CounterOfferPriceSetter(
                        counterOffer: counterOffer,
                        controller: controller,
                        order: order!,
                        onCountOfferSent: (priceOffered) =>
                            onCountOfferSent(priceOffered),
                        onPriceChanged: (price) {
                          mezDbgPrint("New Price offered ===> $price");
                        },
                      ))));
  }

  /// this gets invoked when the Taxi Driver presses [Send offer] button.
  void onCountOfferSent(num price) {
    counterOffer.value = CounterOffer.buildWithExpiration(price: price);
    controller
        .submitCounterOffer(
            order!.orderId, order!.customer.id, counterOffer.value!)
        .then((_) => setState(() {
              _offeredPrice = true;
            }));
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
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
      ),
      onPressed: !_clickedAcceptButton
          ? () async {
              String _orderId = order!.orderId;
              setState(() {
                _clickedAcceptButton = true;
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
                  _clickedAcceptButton = false;
                });
                Get.back();
                MezSnackbar("Oops..", serverResponse.errorMessage!);
              }
            }
          : () => null,
      child: child,
    );
  }

  Widget offerBtn() {
    return TextButton(
      style: ButtonStyle(
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 172, 89, 252)),
      ),
      onPressed: () {
        setState(() {
          _clickedOffersBtn = true;
        });
      },
      child: Text(
        'Offer price',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
