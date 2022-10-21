import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

class ROpDriversMapComponent extends StatefulWidget {
  List<DeliveryDriver> drivers = <DeliveryDriver>[];
  final Order order;

  ROpDriversMapComponent({
    Key? key,
    required this.drivers,
    required this.order,
  }) : super(key: key);

  @override
  _ROpDriversMapComponentState createState() => _ROpDriversMapComponentState();
}

class _ROpDriversMapComponentState extends State<ROpDriversMapComponent> {
  final MGoogleMapController mapController = MGoogleMapController();

  @override
  void initState() {
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;

    mapController.setAnimateMarkersPolyLinesBounds(true);
    mapController.setLocation(widget.order.to);

    getDriversMarkers();
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: widget.order.to.toLatLng(),
    );
    mapController.lockInAutoZoomAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: MGoogleMap(
          mGoogleMapController: mapController,
          padding: const EdgeInsets.all(5),
        ),
      ),
    );
  }

  void getDriversMarkers() {
    widget.drivers.forEach((DeliveryDriver _driver) {
      if (_driver.driverLocation != null) {
        mapController.addOrUpdateUserMarker(
          latLng: _driver.driverLocation,
          customImgHttpUrl: _driver.driverInfo.image,
          markerId: _driver.driverInfo.id,
        );
      }
    });
  }
}
