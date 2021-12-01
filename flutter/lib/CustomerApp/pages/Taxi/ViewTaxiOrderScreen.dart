import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/MapBottomBar.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class ViewTaxiOrderScreen extends StatefulWidget {
  @override
  _ViewTaxiOrderScreenState createState() => _ViewTaxiOrderScreenState();
}

class _ViewTaxiOrderScreenState extends State<ViewTaxiOrderScreen>
    with MGoogleMapController {
  OrderController controller = Get.find<OrderController>();
  Rxn<TaxiOrder> order = Rxn();
  StreamSubscription? _orderListener;
  final String toMarkerId = "to";

  // TODO: overriding functions in MGoogleMapController!
/******************************  Init and build function ************************************/
  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as TaxiOrder?;
    if (order.value != null) {
      mezDbgPrint("order not null !");
      if (order.value!.inProcess()) {
        mezDbgPrint("order is in process!");
        inProcessOrderStatusHandler(order.value!.status);
        setAnimateMarkersPolyLinesBounds?.call(true);

        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((currentOrder) {
          if (currentOrder != null) {
            mezDbgPrint("currentOrder is not null!");

            order.value = currentOrder as TaxiOrder;
            inProcessOrderStatusHandler(order.value!.status);
          } else {
            mezDbgPrint("currentOrder is null!");

            // this else clause gets executed when the order becomes /pastOrders.
            _orderListener?.cancel();
            _orderListener = null;

            order.value = controller.getOrder(orderId) as TaxiOrder?;
            // one time execution :
            setAnimateMarkersPolyLinesBounds?.call(false);
            pastOrderStatusHandler(order.value!.status);
          }
        });
      } else {
        // it's in past orders!
        pastOrderStatusHandler(order.value!.status);
      }
    } else {
      mezcalmosSnackBar("Error", "Unfound Order !");
      // Get.back();
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
        padding: EdgeInsets.only(left: 1, right: 1),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Obx(
                    () => order.value != null
                        ? MGoogleMap(
                            mGoogleMapController: this,
                            periodicRedrendring: true,

                            // notifyParent: (_) {},
                            // we will have to handle init location depending on taxi state
                            initialLocation: LatLng(
                                order.value!.from.position.latitude!,
                                order.value!.from.position.longitude!))
                        : MezLogoAnimation(
                            centered: true,
                          ),
                  )),
              Container(
                height: 40,
                width: Get.width,
                color: Colors.white,
              ),
              MapBottomBar(taxiRequest: (order.value!.toTaxiRequest()).obs)
              // FromToLocationBar(
              //   taxiRequest,
              //   newLocationFromSearchBar,
              //   key: _fromToGlobalStateKey,
              // ),
            ]),
      ),
    );
  }

  /******************************  helper functions ************************************/
  /// This gets invoked when the order is moved to [inProcess] db node
  void inProcessOrderStatusHandler(TaxiOrdersStatus status) {
    switch (status) {
      case TaxiOrdersStatus.OnTheWay:
        // remove the to dest marker
        removeMarker(toMarkerId);

        // taxi driver marker
        addTaxiDriverMarker(
            // TODO : // this should have Driver actual location instreal of from!
            order.value!.driver!.id,
            order.value!.from.toLatLng());
        // customer marker
        addOrUpdateUserMarker(
            order.value!.customer.id, order.value!.from.toLatLng());
        break;

      case TaxiOrdersStatus.InTransit:
        // from [driver] to [destination]
        // thus we keep updating the driver marker only.
        // + Remove customer Marker
        // + Add destination Marker

        // addOrUpdateUserMarker(
        //     order.value!.driver!.id, order.value!.from.toLatLng());

        // removing customer marker
        removeMarker(order.value!.customer.id);
        // updating driver's marker
        addOrUpdateUserMarker(
            order.value!.driver!.id, order.value!.from.toLatLng());
        // updating destination marker.
        addOrUpdatePurpleDestinationMarker(
            toMarkerId, order.value!.to.toLatLng());
        break;

      default:
        // this.addPolyline()
        // default is : isLoookingForTaxi
        // updating destination marker.
        addOrUpdatePurpleDestinationMarker(
            toMarkerId, order.value!.to.toLatLng());
        // customer marker
        addOrUpdateUserMarker(
            order.value!.customer.id, order.value!.from.toLatLng());
        break;
    }
  }

  /// This gets invoked when the order is moved to /past db node
  void pastOrderStatusHandler(TaxiOrdersStatus status) {
    // @Saad, no need to navigate back, should just be enough to show status
    removeMarker(order.value!.driver!.id);
    // adding customer's marker
    addOrUpdateUserMarker(
        order.value!.customer.id, order.value!.from.toLatLng());
    // updating destination marker.
    addOrUpdatePurpleDestinationMarker(toMarkerId, order.value!.to.toLatLng());
  }
}
