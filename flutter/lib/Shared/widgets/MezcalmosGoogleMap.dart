import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class OrderGoogleMap extends StatefulWidget {
  final Order currentOrder;
  OrderGoogleMap(this.currentOrder);

  @override
  OrderGoogleMapState createState() => OrderGoogleMapState();
}

class OrderGoogleMapState extends State<OrderGoogleMap> {
  // Used for markers !
  Completer<GoogleMapController> _gMapCompleter = Completer();
  late BitmapDescriptor customerLocationMarker;
  late BitmapDescriptor customerDestinationMarker;
  bool mapReady = false;

  List<LatLng> pLineCoords = <LatLng>[];
  Set<Polyline> polyLineSet = {};

  Future<List<BitmapDescriptor>> loadBitmapDescriptors() async {
    return <BitmapDescriptor>[
      await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(20, 20)), custommer_location_marker_asset),
      await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(20, 20)), custommer_destination_marker_asset)
    ];
  }

  @override
  void initState() {
    print("################### ${widget.currentOrder.toJson()} ###################!");
    loadBitmapDescriptors().then((value) {
      print("#########################\n$value \n#######################");
      setState(() {
        customerLocationMarker = value[0];
        customerDestinationMarker = value[1];
        mapReady = true;
      });
    });

    List<PointLatLng> res = polylinePoints.decodePolyline(widget.currentOrder.routeInformation['polyline']);
    res.forEach((PointLatLng point) => pLineCoords.add(LatLng(point.latitude, point.longitude)));

    polyLineSet.add(Polyline(
      color: Colors.blueAccent,
      polylineId: PolylineId(widget.currentOrder.id),
      jointType: JointType.round,
      points: pLineCoords,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    ));

    super.initState();
  }

  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Widget build(BuildContext context) {
    return !mapReady
        ? Center(child: CircularProgressIndicator())
        : GoogleMap(
            buildingsEnabled: false,
            markers: {
              Marker(
                draggable: false,
                flat: true,
                anchor: Offset(0.5, 1),
                infoWindow: InfoWindow(title: "Ride from : ", snippet: widget.currentOrder.to['address']),
                markerId: MarkerId("from"),
                icon: customerLocationMarker,
                visible: true,
                position: LatLng(widget.currentOrder.from['lat'], widget.currentOrder.from['lng']),
              ),
              Marker(
                  draggable: false,
                  flat: true,
                  anchor: Offset(0.5, 1),
                  infoWindow: InfoWindow(title: "Ride to : ", snippet: widget.currentOrder.to['address']),
                  markerId: MarkerId("to"),
                  icon: customerDestinationMarker,
                  visible: true,
                  position: LatLng(widget.currentOrder.to['lat'], widget.currentOrder.to['lng'])),
            },
            polylines: polyLineSet,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            initialCameraPosition:
                // CameraPosition(bearing: 192.8334901395799, target: LatLng(widget.currentOrder.from['lat'], widget.currentOrder.from['lng']), tilt: 59.440717697143555, zoom: 15.151926040649414),
                CameraPosition(target: LatLng(widget.currentOrder.from['lat'], widget.currentOrder.from['lng']), tilt: 9.440717697143555, zoom: 15.151926040649414),
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(GetStorage().read('map_style'));
              _gMapCompleter.complete(controller);
            },
          );
  }
}
