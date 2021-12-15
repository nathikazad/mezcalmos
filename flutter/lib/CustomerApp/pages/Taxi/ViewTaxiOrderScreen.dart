import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/MapBottomBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiOrderTopBar.dart';
import 'package:mezcalmos/Shared/Themes/styles/textStyleTheme.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  final MGoogleMapController mGoogleMapController = MGoogleMapController();

  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen> {
  OrderController controller = Get.find<OrderController>();
  Rxn<TaxiOrder> order = Rxn();
  StreamSubscription? _orderListener;
  final String toMarkerId = "to";
  LanguageController lang = Get.find<LanguageController>();

  // TODO: overriding functions in widget.mGoogleMapController!
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
          }
        });
      } else {
        // it's in past orders!
        pastOrderStatusHandler(order.value!.status);
      }
    } else {
      mezcalmosSnackBar("Error", "Unfound Order !");
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
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back),
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
                        Obx(
                          () => MapBottomBar(
                            taxiRequest: order.value!.toTaxiRequest(),
                          ),
                        ),
                        cancelButton(order.value!.status),
                        TaxiOrderTopBar(order: order.value!)
                      ])
                : MezLogoAnimation(
                    centered: true,
                  ),
          ),
        ));
  }

  /******************************  helper functions ************************************/
  /// This gets invoked when the order is moved to [inProcess] db node
  void inProcessOrderStatusHandler(TaxiOrdersStatus status) {
    mezDbgPrint(
        "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ $status ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
    switch (status) {
      case TaxiOrdersStatus.OnTheWay:
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
    // @Saad, no need to navigate back, should just be enough to show status
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
        bottom: 20,
        left: 15,
        right: 15,
        child: InkWell(
          onTap: () async {
            mezDbgPrint("Canceling order ===> ${order.value!.orderId}");
            await Get.find<TaxiController>().cancelTaxi(order.value!.orderId);
          },
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "CANCEL",
                  style: textStyleTheme.bodyText1!.copyWith(
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
}
