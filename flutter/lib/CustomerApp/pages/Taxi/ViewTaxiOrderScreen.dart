import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RideReadByTaxisHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiOrderBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TopBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  final MGoogleMapController mGoogleMapController = MGoogleMapController();

  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen>
    with SingleTickerProviderStateMixin {
  OrderController controller = Get.find<OrderController>();
  TaxiController taxiController = Get.put<TaxiController>(TaxiController());
  Rxn<TaxiOrder> order = Rxn();
  StreamSubscription? _orderListener;
  final String toMarkerId = "to";
  LanguageController lang = Get.find<LanguageController>();
  RxDouble bottomPadding =
      ((GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0).obs;

/******************************  Init and build function ************************************/
  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as TaxiOrder?;
    mezDbgPrint("ViewTaxiscreen :: Order :: ${order.value}");
    if (order.value != null) {
      // set initial location
      widget.mGoogleMapController.setLocation(order.value!.from);
      // add the polylines!
      widget.mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation.polyline);
      widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
      widget.mGoogleMapController.animateAndUpdateBounds();

      mezDbgPrint("order not null !");
      if (order.value!.inProcess()) {
        mezDbgPrint("order is in process!");
        inProcessOrderStatusHandler(order.value!.status);
        // widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(false);

        _orderListener = controller
            .getCurrentOrderStream(orderId)
            .listen((currentOrder) async {
          if (currentOrder != null) {
            // setState(() {
            //   mezDbgPrint("SetState First time !");
            // });
            mezDbgPrint(
                "currentOrder is not null! ======= == = = == =>>> $currentOrder.");

            order.value = currentOrder as TaxiOrder;
            inProcessOrderStatusHandler(order.value!.status);
            setState(() {});
          } else {
            mezDbgPrint("currentOrder is null!");
            _orderListener?.cancel();
            _orderListener = null;
            TaxiOrder? _order = controller.getOrder(orderId) as TaxiOrder?;
            // this else clause gets executed when the order becomes /pastOrders.

            mezDbgPrint("+++ GOT PAST OORDER ----- >>> ${order.value}");
            if (_order == null) {
              if (order.value!.status == TaxiOrdersStatus.CancelledByCustomer) {
                Get.back();
                oneButtonDialog(
                    body: "Order Canceled Successfully !",
                    imagUrl: _order!.customer.image);
              }
              _order = (await controller.getPastOrderStream(orderId).first)
                  as TaxiOrder?;
            }

            order.value = _order;
            // one time execution :
            widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
            pastOrderStatusHandler(order.value!.status);
            setState(() {});
          }
        });
      } else {
        // it's in past orders!
        pastOrderStatusHandler(order.value!.status);
        setState(() {});
      }
    } else {
      mezDbgPrint("Error :Unfound Order !");
    }

    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
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
        body: Container(
          color: Colors.white,
          child: Obx(
            () => order.value != null
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
                                  this.widget.mGoogleMapController,
                              periodicRerendering: true,
                            )),
                        TopBar(order: order.value!),
                        cancelButton(order.value!.status),
                        TaxiOrderBottomBar(order: order),
                        getToolTip(),
                      ])
                : MezLogoAnimation(
                    centered: true,
                  ),
          ),
        ));
  }

  /// this builds [MezToolTip] with the given [getHints()],
  ///
  /// if [Get.find<TaxiController>().numOfTimesToolTipShownToUser()] has already set to 5+,
  ///
  /// we won't show it, instead we simply return an empty box.
  Widget getToolTip() {
    // only if not marker as read more than 4 times or status isLookingForTaxi
    if (order.value!.status == TaxiOrdersStatus.LookingForTaxi &&
        Get.find<TaxiController>().numOfTimesToolTipShownToUser() <=
            nMaxTimesToShowTTipsOnCustomerApp)
      return MezToolTip(
        hintWidgetsList: getHints(),
      );
    else
      return SizedBox();
  }

  /// This gets invoked when the order is moved to [inProcess] db node
  void inProcessOrderStatusHandler(TaxiOrdersStatus status) {
    mezDbgPrint(
        "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ $status ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
    switch (status) {
      case TaxiOrdersStatus.OnTheWay:
        bottomPadding.value = 10.0;
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        widget.mGoogleMapController.animateAndUpdateBounds();

        // update the to dest marker
        // widget.mGoogleMapController.removeDestinationMarker();
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // taxi driver marker
        if (order.value!.driver?.location != null)
          widget.mGoogleMapController.addOrUpdateTaxiDriverMarker(
              order.value!.driver!.id, order.value!.driver!.location!);
        // customer marker
        widget.mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;

      case TaxiOrdersStatus.InTransit:
        bottomPadding.value = 10.0;
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);

        // from [driver] to [destination]
        // thus we keep updating the driver marker only.
        // + Remove customer Marker
        // + Add destination Marker

        // addOrUpdateUserMarker(
        //     order.value!.driver!.id, order.value!.from.toLatLng());

        // removing customer marker
        widget.mGoogleMapController.removeMarkerById(order.value!.customer.id);
        // updating driver's marker
        widget.mGoogleMapController.addOrUpdateTaxiDriverMarker(
            order.value!.driver!.id,
            LatLng(order.value!.driver!.location!.latitude,
                order.value!.driver!.location!.longitude));
        // updating destination marker.
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        break;

      default:
        // bottomPadding.value = 10.0;

        // default is : isLoookingForTaxi
        // so user can move freely
        widget.mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        widget.mGoogleMapController.animateAndUpdateBounds();

        // updating destination marker.
        widget.mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // customer marker
        widget.mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;
    }
  }

  /// This gets invoked when the order is moved to /past db node
  void pastOrderStatusHandler(TaxiOrdersStatus status) {
    bottomPadding.value = 10.0;

    if (order.value!.driver != null)
      widget.mGoogleMapController.removeMarkerById(order.value!.driver!.id);
    // adding customer's marker
    widget.mGoogleMapController.addOrUpdateUserMarker(
        markerId: order.value!.customer.id,
        latLng: order.value!.from.toLatLng());
    // updating destination marker.
    widget.mGoogleMapController
        .addOrUpdatePurpleDestinationMarker(latLng: order.value!.to.toLatLng());
  }

  Widget cancelButton(TaxiOrdersStatus status) {
    if (status != TaxiOrdersStatus.LookingForTaxi) {
      return SizedBox();
    } else {
      return Positioned(
        bottom: 15,
        left: 15,
        right: 15,
        child: InkWell(
          onTap: () async {
            mezDbgPrint("Canceling order ===> ${order.value!.orderId}");
            YesNoDialogButton res = await yesNoDialog(
                text: "Confirm Cancelation.",
                body: "Are you sure you want to cancel your Order ?");
            if (res == YesNoDialogButton.Yes) {
              await Get.find<TaxiController>().cancelTaxi(order.value!.orderId);
            }
          },
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                      fontFamily: "psr",
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      );
    }
  }

  /// the hints [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return [
      MezToolTipHint(
          hintWidget: RidePriceControllHint(
              hintText: Get.find<LanguageController>().strings['customer']
                  ['taxiView']['taxiRidePriceTooltip']),
          left: 80,
          bottom: 150.5),
      MezToolTipHint(
          hintWidget: RideReadByTaxisHint(), left: 210, bottom: 150.5)
    ];
  }
}
