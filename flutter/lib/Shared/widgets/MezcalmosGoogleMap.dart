import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class OrderGoogleMap extends StatefulWidget {
  final Order currentOrder;
  late final bool
      realtimeTracking; // this is for controlling weither we will be doing some realtime  Location tracking or not !

  OrderGoogleMap(this.currentOrder, {bool realtime = false}) {
    this.realtimeTracking = realtime;
  }

  TaxiAuthController taxiAuthCtrl = Get.find<TaxiAuthController>();

  @override
  OrderGoogleMapState createState() => OrderGoogleMapState();
}
//{errorMessage: User is not an authorized driver, status: Error}

class OrderGoogleMapState extends State<OrderGoogleMap> {
  double test_lng = -97.05531560386919;
  double test_lat = 15.855722506461488;
  // Used for markers !
  Completer<GoogleMapController> _gMapCompleter = Completer();
  late BitmapDescriptor customerLocationMarker;
  late BitmapDescriptor customerDestinationMarker;
  bool mapReady = false;

  List<LatLng> pLineCoords = <LatLng>[];
  Set<Polyline> polyLineSet = {};

  Marker? fromMarker;
  Marker? toMarker;
  Circle? circle;

  GoogleMapController? _controller;

  Future<Uint8List> getBytesFromCanvas(int width, int height, urlAsset,
      {bool isBytes = false}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    late final ByteData datai;

    if (!isBytes) datai = await rootBundle.load(urlAsset);
    var imaged =
        await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
    canvas.drawImageRect(
      imaged,
      Rect.fromLTRB(
          0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
      new Paint(),
    );

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<void> reUpdateLocation() async {
    if (widget.currentOrder.status == "onTheWay") {
      print("++++++++++++ [reUpdateLocation] >>>>>>>>>>. onTheWay ++++++++++");
      _controller!.animateCamera(
          CameraUpdate.newLatLng(new LatLng(test_lat, test_lng)));
      this.setState(() {
        fromMarker = Marker(
          draggable: false,
          flat: true,
          anchor: Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: customerLocationMarker,
          visible: true,
          position: LatLng(test_lat, test_lng),
        );
        toMarker = Marker(
            draggable: false,
            flat: true,
            anchor: Offset(0.5, 1),
            markerId: MarkerId("to"),
            icon: customerDestinationMarker,
            visible: true,
            position: LatLng(widget.currentOrder.from.latitude,
                widget.currentOrder.from.longitude));
      });
    } else if (widget.currentOrder.status == "inTransit") {
      _controller!.animateCamera(
          CameraUpdate.newLatLng(new LatLng(test_lat, test_lng)));

      this.setState(() {
        fromMarker = Marker(
          draggable: false,
          flat: true,
          anchor: Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: customerLocationMarker,
          visible: true,
          position: LatLng(widget.currentOrder.from.latitude,
              widget.currentOrder.from.longitude),
        );
        toMarker = Marker(
            draggable: false,
            flat: true,
            anchor: Offset(0.5, 1),
            markerId: MarkerId("to"),
            icon: customerDestinationMarker,
            visible: true,
            position: LatLng(widget.currentOrder.to.latitude,
                widget.currentOrder.to.longitude));
      });
    }
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) =>
            value < element ? value : element); //  snallest value
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest value
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

// ----------- to fit everything in the map !
  LatLngBounds? _bounds(Set<Marker>? markers) {
    if (markers == null || markers.isEmpty) return null;
    return _createBounds(markers.map((m) => m.position).toList());
  }

  Future<List<BitmapDescriptor>> currentOrderVewBitmapDescriptors() async {
    return <BitmapDescriptor>[
      // await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(20, 20)), taxi_driver_marker_asset),
      // await BitmapDescriptor.fromAssetImage(ImageConfiguration(), user_icon_marker_asset),
      BitmapDescriptor.fromBytes(
          await getBytesFromCanvas(40, 45, taxi_driver_marker_asset)),
      BitmapDescriptor.fromBytes(
          await getBytesFromCanvas(40, 45, user_icon_marker_asset))

      // BitmapDescriptor.fromBytes(await getBytesFromCanvas(50, 80, purple_destination_marker_asset))
      // await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1, 1)), purple_destination_marker_asset),
    ];
  }

  Future<List<BitmapDescriptor>> orderViewBitmapDescriptors() async {
    print(
        "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n${widget.currentOrder.customer['image']}\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    return <BitmapDescriptor>[
      await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), user_icon_marker_asset),
      // BitmapDescriptor.fromBytes(await getBytesFromCanvas(40, 40, (await http.get(Uri.parse(widget.currentOrder.customer['image']))).bodyBytes, isBytes: true)),
      BitmapDescriptor.fromBytes(
          await getBytesFromCanvas(40, 45, purple_destination_marker_asset))

      // await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1, 1)), purple_destination_marker_asset),
    ];
  }

  @override
  void initState() {
    print(
        "################### ${widget.currentOrder.toJson()} ###################!");
    (widget.realtimeTracking
            ? currentOrderVewBitmapDescriptors()
            : orderViewBitmapDescriptors())
        .then((value) {
      print("#########################\n$value \n#######################");
      setState(() {
        customerLocationMarker = value[0];
        customerDestinationMarker = value[1];

        fromMarker = Marker(
          draggable: false,
          flat: true,
          anchor: Offset(0.5, 1),
          infoWindow: InfoWindow(
              title: "Ride from : ", snippet: widget.currentOrder.to.address),
          markerId: MarkerId("from"),
          icon: customerLocationMarker,
          visible: true,
          position: LatLng(widget.currentOrder.from.latitude,
              widget.currentOrder.from.longitude),
        );
        toMarker = Marker(
            draggable: false,
            flat: true,
            anchor: Offset(0.5, 1),
            infoWindow: InfoWindow(
                title: "Ride to : ", snippet: widget.currentOrder.to.address),
            markerId: MarkerId("to"),
            icon: customerDestinationMarker,
            visible: true,
            position: LatLng(widget.currentOrder.to.latitude,
                widget.currentOrder.to.longitude));

        mapReady = true;
      });
    });

    List<PointLatLng> res = polylinePoints.decodePolyline(
        widget.currentOrder.routeInformation?['polyline'] ??
            widget.currentOrder.polyline);
    res.forEach((PointLatLng point) =>
        pLineCoords.add(LatLng(point.latitude, point.longitude)));

    polyLineSet.add(Polyline(
      color: Color.fromARGB(255, 172, 89, 252),
      polylineId: PolylineId(widget.currentOrder.id),
      jointType: JointType.round,
      points: pLineCoords,
      width: 2,
      startCap: Cap.buttCap,
      endCap: Cap.roundCap,
      // geodesic: true,
    ));

    super.initState();
  }

  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Widget build(BuildContext context) {
    return !mapReady
        ? Center(child: CircularProgressIndicator())
        : new GoogleMap(
            onCameraMove: (_) async {
              await reUpdateLocation();
            },
            myLocationButtonEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(10, 16),
            buildingsEnabled: false,
            markers: {fromMarker!, toMarker!},
            polylines: polyLineSet,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.currentOrder.from.latitude,
                    widget.currentOrder.from.longitude),
                tilt: 9.440717697143555,
                zoom: 14.151926040649414),
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;
              await controller.setMapStyle(GetStorage().read('map_style'));
              await controller.animateCamera(CameraUpdate.newLatLngBounds(
                  _bounds({fromMarker!, toMarker!})!, 150));
              _gMapCompleter.complete(controller);
            },
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
