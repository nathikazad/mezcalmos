import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

class TaxiOrderMapComponent extends StatefulWidget {
  final TaxiOrder order;
  final MGoogleMapController mapController;
  const TaxiOrderMapComponent({
    Key? key,
    required this.order,
    required this.mapController,
  }) : super(key: key);

  @override
  _TaxiOrderMapComponentState createState() => _TaxiOrderMapComponentState();
}

class _TaxiOrderMapComponentState extends State<TaxiOrderMapComponent> {
  @override
  void initState() {
    if (widget.order.routeInformation != null) {
      widget.mapController.decodeAndAddPolyline(
          encodedPolylineString: widget.order.routeInformation!.polyline);
    }
    widget.mapController.setAnimateMarkersPolyLinesBounds(true);
    widget.mapController.setLocation(widget.order.to);
    widget.mapController.addOrUpdateUserMarker(
        customImgHttpUrl: widget.order.customer.image,
        latLng:
            LatLng(widget.order.from.latitude, widget.order.from.longitude));

    widget.mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    widget.mapController.lockInAutoZoomAnimation();
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
