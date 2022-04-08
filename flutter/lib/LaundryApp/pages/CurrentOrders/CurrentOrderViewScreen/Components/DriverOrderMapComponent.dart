import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

class DriverOrderMapComponent extends StatefulWidget {
  final Rxn<Order> order;
  const DriverOrderMapComponent({Key? key, required this.order})
      : super(key: key);

  @override
  _DriverOrderMapComponentState createState() =>
      _DriverOrderMapComponentState();
}

class _DriverOrderMapComponentState extends State<DriverOrderMapComponent> {
  final MGoogleMapController mapController = MGoogleMapController();
  DeliveryAuthController deliveryAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    if (widget.order.value!.routeInformation != null) {
      mapController.decodeAndAddPolyline(
          encodedPolylineString:
              widget.order.value!.routeInformation!.polyline);
    }
    mapController.setAnimateMarkersPolyLinesBounds(true);
    mapController.setLocation(widget.order.value!.to);
    mapController.addOrUpdateUserMarker(
        latLng: LatLng(deliveryAuthController.currentLocation.latitude!,
            deliveryAuthController.currentLocation.longitude!));

    mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(
            widget.order.value!.to.latitude, widget.order.value!.to.longitude));

    widget.order.stream.listen((Order? order) {
      if (order != null) {
        switch (order.orderType) {
          case OrderType.Laundry:
            handleLaundryOrder(order as LaundryOrder);
            break;
          case OrderType.Restaurant:
            handleRestaurantOrder(order as RestaurantOrder);
            break;
          default:
            return;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      // child: MGoogleMap(
      //   : mapController,
      //   periodicRerendering: true,
      // ),
    );
  }

  /// this handles Laundry Orders depending on it's Phase
  void handleLaundryOrder(LaundryOrder order) {
    final LaundryOrderPhase _phase = order.getCurrentPhase();
    switch (_phase) {
      case LaundryOrderPhase.Pickup:
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(order.pickupDriver!.location!.latitude,
              order.pickupDriver!.location!.longitude),
        );
        break;
      case LaundryOrderPhase.Dropoff:
        mapController.addOrUpdateUserMarker(
          latLng: LatLng(order.pickupDriver!.location!.latitude,
              order.pickupDriver!.location!.longitude),
        );
        break;
      default:
        return;
    }
  }

  /// this handles Restaurant Order.
  void handleRestaurantOrder(RestaurantOrder order) {
    if (order.status == RestaurantOrderStatus.OnTheWay) {
      mapController.addOrUpdateUserMarker(
        latLng: LatLng(order.dropoffDriver!.location!.latitude,
            order.dropoffDriver!.location!.longitude),
      );
    }
  }
}
