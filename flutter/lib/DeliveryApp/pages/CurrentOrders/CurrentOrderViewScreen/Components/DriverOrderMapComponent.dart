import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/deliveryAuthController.dart';

class DriverOrderMapComponent extends StatefulWidget {
  final Order order;
  DriverOrderMapComponent({Key? key, required this.order}) : super(key: key);

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
    if (widget.order.routeInformation != null) {
      mapController.decodeAndAddPolyline(
          encodedPolylineString: widget.order.routeInformation!.polyline);
    }
    mapController.setAnimateMarkersPolyLinesBounds(true);
    mapController.setLocation(widget.order.to);
    mapController.addOrUpdateUserMarker(
        latLng: LatLng(deliveryAuthController.currentLocation.latitude!,
            deliveryAuthController.currentLocation.longitude!));

    mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: MGoogleMap(
        mGoogleMapController: mapController,
      ),
    );
  }
}
