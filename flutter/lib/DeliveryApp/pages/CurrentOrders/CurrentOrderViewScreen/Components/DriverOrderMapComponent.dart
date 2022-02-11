import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/deliveryAuthController.dart';

class DriverOrderMapComponent extends StatefulWidget {
  final MGoogleMapController mapController = MGoogleMapController();

  final Order order;
  DriverOrderMapComponent({Key? key, required this.order}) : super(key: key);

  @override
  _DriverOrderMapComponentState createState() =>
      _DriverOrderMapComponentState();
}

class _DriverOrderMapComponentState extends State<DriverOrderMapComponent> {
  DeliveryAuthController deliveryAuthController =
      Get.find<DeliveryAuthController>();
  @override
  void initState() {
    widget.mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    if (widget.order.routeInformation != null) {
      widget.mapController.decodeAndAddPolyline(
          encodedPolylineString: widget.order.routeInformation!.polyline);
    }
    widget.mapController.setAnimateMarkersPolyLinesBounds(true);
    widget.mapController.setLocation(widget.order.to);
    widget.mapController.addOrUpdateUserMarker(
        latLng: LatLng(deliveryAuthController.currentLocation.latitude!,
            deliveryAuthController.currentLocation.longitude!));

    widget.mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: MGoogleMap(
        mGoogleMapController: widget.mapController,
      ),
    );
  }
}
