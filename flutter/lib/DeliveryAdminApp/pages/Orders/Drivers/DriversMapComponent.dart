import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

class DriversMapCompnonet extends StatefulWidget {
  final MGoogleMapController mapController = MGoogleMapController();
  List<DeliveryDriver> drivers = [];
  final Order order;
  DriversMapCompnonet({Key? key, required this.drivers, required this.order})
      : super(key: key);

  @override
  _DriversMapCompnonetState createState() => _DriversMapCompnonetState();
}

class _DriversMapCompnonetState extends State<DriversMapCompnonet> {
  @override
  void initState() {
    widget.mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    widget.mapController.setAnimateMarkersPolyLinesBounds(true);
    widget.mapController.setLocation(widget.order.to);

    showDrivers();
    widget.mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: MGoogleMap(
          mGoogleMapController: widget.mapController,
        ),
      ),
    );
  }

  showDrivers() {
    widget.drivers.forEach((element) {
      widget.mapController.addOrUpdateUserMarker(
          latLng: element.driverLocation,
          customImgHttpUrl: element.driverInfo.image,
          markerId: element.driverInfo.id);
    });
  }
}
