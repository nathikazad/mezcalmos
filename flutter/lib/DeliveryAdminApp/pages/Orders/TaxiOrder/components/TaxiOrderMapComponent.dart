import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

class TaxiOrderMapComponent extends StatefulWidget {
  final TaxiOrder order;
  const TaxiOrderMapComponent({Key? key, required this.order})
      : super(key: key);

  @override
  _TaxiOrderMapComponentState createState() => _TaxiOrderMapComponentState();
}

class _TaxiOrderMapComponentState extends State<TaxiOrderMapComponent> {
  final MGoogleMapController mapController = MGoogleMapController();

  @override
  void initState() {
    if (widget.order.routeInformation != null) {
      mapController.decodeAndAddPolyline(
          encodedPolylineString: widget.order.routeInformation!.polyline);
    }
    mapController.setAnimateMarkersPolyLinesBounds(true);
    mapController.setLocation(widget.order.to);
    mapController.addOrUpdateUserMarker(
        customImgHttpUrl: widget.order.customer.image,
        latLng:
            LatLng(widget.order.from.latitude, widget.order.from.longitude));

    mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    mapController.lockInAutoZoomAnimation();
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
