import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

// we are using this in google map Screens
class MezcalmosCurrentOrderGoogleMapController extends GetxController {
  // puerto mezcondido cords in case we need to test
  final double test_lng = -97.05531560386919;
  final double test_lat = 15.855722506461488;
  final String _app_launch_mode = GetStorage().read('lmod');

  CurrentOrderController _currentOrderController =
      Get.find<CurrentOrderController>();

  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  RxSet<Polyline> _polylines = <Polyline>{}.obs;
  RxSet<Marker> _markers = <Marker>{}.obs;

  late LatLng initialCameraPosition;

  // to keep track if everything is initilized !
  RxBool _mapReady = false.obs;

  // get me boi xD
  Set<Polyline> get polylines => _polylines;
  Set<Marker> get markers => _markers;
  bool get mapReady => _mapReady.value;

  @override
  void onInit() {
    // initilize our polylines ====================

    print(
        "\n\n[MezcalmosCurrentOrderGoogleMapController] =============== INITIALIZED ==============\n\n");
    List<LatLng> pLineCoords = [];

    List<PointLatLng> res = PolylinePoints().decodePolyline(
        _currentOrderController.value!.routeInformation?['polyline'] ??
            _currentOrderController.value!.polyline);

    res.forEach((PointLatLng point) =>
        pLineCoords.add(LatLng(point.latitude, point.longitude)));

    _polylines.add(Polyline(
      color: ui.Color.fromARGB(255, 172, 89, 252),
      polylineId: PolylineId("ID"),
      jointType: JointType.round,
      points: pLineCoords,
      width: 2,
      startCap: Cap.buttCap,
      endCap: Cap.roundCap,
      // geodesic: true,
    ));
    googleMapUpdate();

    super.onInit();
  }

  void googleMapUpdate() {
    print(":::::::: googleMapUpdate :::::::: Called ::::::::");
    _markers.clear();

    if (_currentOrderController.value!.status == "onTheWay") {
      // that means taxi accepted order
      print("]]]]]]]]]]]]]]]]]]]]]]\n\n ON_THE_WAY \n\n[[[[[[[[[[[[[[[[[[[[[");
      BitmapDescriptorLoader(user_icon_marker_asset, 170, 180).then((value) {
        print("0000000000000000 RENDER USER MARKER -----------< $value >");
        _markers.add(
          // _customerLocationMarker
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("from"),
            icon: value,
            visible: true,
            position: LatLng(_currentOrderController.value!.from.latitude,
                _currentOrderController.value!.from.longitude),
          ),
        );
      });

      BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
          .then((value) {
        _markers.add(
          // _customerLocationMarker
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("to"),
            icon: value,
            visible: true,
            position: LatLng(_currentOrderController.value!.to.latitude,
                _currentOrderController.value!.to.longitude),
          ),
        );
      });

      BitmapDescriptorLoader(taxi_driver_marker_asset, 80, 90).then((value) {
        _markers.add(Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("taxi"),
          icon: value,
          visible: true,
          position: LatLng(_taxiAuthController.currentLocation.latitude,
              _taxiAuthController.currentLocation.longitude),
        ));
        this._mapReady.value = true;
      });

      initialCameraPosition = _app_launch_mode == "dev"
          ? LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude)
          : LatLng(_taxiAuthController.currentLocation.latitude,
              _taxiAuthController.currentLocation.longitude);
    } else if (_currentOrderController.value!.status == "inTransit") {
      // that means taxi already picked up the customer
      print("]]]]]]]]]]]]]]]]]]]]]]\n\n IN_TRANSIT \n\n[[[[[[[[[[[[[[[[[[[[[");

      BitmapDescriptorLoader(taxi_driver_marker_asset, 80, 90).then((value) {
        _markers.add(
          // from ==> TaxiDriverMarker
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("from"),
            icon: value,
            visible: true,
            position: LatLng(_taxiAuthController.currentLocation.latitude,
                _taxiAuthController.currentLocation.longitude),
          ),
        );
      });

      BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
          .then((value) {
        _markers.add(
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("to"),
            icon: value,
            visible: true,
            position: LatLng(_currentOrderController.value!.to.latitude,
                _currentOrderController.value!.to.longitude),
          ),
        );
        this._mapReady.value = true;
      });

      initialCameraPosition = _app_launch_mode == "dev"
          ? LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude)
          : LatLng(_taxiAuthController.currentLocation.latitude,
              _taxiAuthController.currentLocation.longitude);
    } else if (_currentOrderController.value!.status == "droppedOff") {
      print(
          "]]]]]]]]]]]]]]]]]]]]]]\n\n OTHER_RIDE_STATUS \n\n[[[[[[[[[[[[[[[[[[[[[");

      BitmapDescriptorLoader(user_icon_marker_asset, 170, 180).then((value) {
        _markers.add(
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("from"),
            icon: value,
            visible: true,
            position: LatLng(_currentOrderController.value!.from.latitude,
                _currentOrderController.value!.from.longitude),
          ),
        );
      });

      BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
          .then((value) {
        _markers.add(
          Marker(
            draggable: false,
            flat: true,
            anchor: ui.Offset(0.5, 1),
            markerId: MarkerId("to"),
            icon: value,
            visible: true,
            position: LatLng(_currentOrderController.value!.to.latitude,
                _currentOrderController.value!.to.longitude),
          ),
        );
        initialCameraPosition = LatLng(
            _currentOrderController.value!.from.latitude,
            _currentOrderController.value!.from.longitude);
        this._mapReady.value = true;
      });
    } else {
      print(
          "\n\n __________________________( STATUS => ${_currentOrderController.value!.status} )_______________________\n\n");
    }
  }

  Future<BitmapDescriptor> BitmapDescriptorLoader(
      String asset, int width, int height) async {
    return BitmapDescriptor.fromBytes(
        await getBytesFromCanvas(width, height, asset));
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height, urlAsset,
      {bool isBytes = false}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(pictureRecorder);
    late final ByteData datai;

    if (!isBytes) datai = await rootBundle.load(urlAsset);
    var imaged =
        await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
    canvas.drawImageRect(
      imaged,
      ui.Rect.fromLTRB(
          0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      ui.Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
      new ui.Paint(),
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
  LatLngBounds? getBounds() {
    if (markers.isEmpty) return null;
    return _createBounds(markers.map((m) => m.position).toList());
  }

  @override
  // TODO: implement onDelete
  get onDelete => super.onDelete;

  @override
  void onClose() {
    print(
        "[==== MezcalmosOrderViewGoogleMapController] got closes !!!!!!!!!!!!!!!!!!");
    super.onClose();
  }
}

// we are using this in google map Screens
class MezcalmosOrderViewGoogleMapController extends GetxController {
  // puerto mezcondido cords in case we need to test
  double test_lng = -97.05531560386919;
  double test_lat = 15.855722506461488;

  IncomingOrdersController _incomingOrdersController =
      Get.find<IncomingOrdersController>();

  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  RxSet<Polyline> _polylines = <Polyline>{}.obs;
  RxSet<Marker> _markers = <Marker>{}.obs;

  late LatLng initialCameraPosition;

  // to keep track if everything is initilized !
  RxBool _mapReady = false.obs;
  late BitmapDescriptor _customer_location_marker_bitmap;
  late BitmapDescriptor _customer_destination_marker_bitmap;
  // get me boi xD
  Set<Polyline> get polylines => _polylines;
  Set<Marker> get markers => _markers;
  bool get mapReady => _mapReady.value;

  // @override
  // void onReady() {
  //   this._mapReady.value = true;
  //   super.onReady();
  // }

  @override
  void onInit() {
    // initilize our polylines ====================
    print(
        "\n\n[MezcalmosOrderViewGoogleMapController] =============== INITIALIZED ==============\n\n");

    List<LatLng> pLineCoords = [];

    List<PointLatLng> res = PolylinePoints().decodePolyline(
        _incomingOrdersController
                .selectedIncommingOrder!.routeInformation?['polyline'] ??
            _incomingOrdersController.selectedIncommingOrder!.polyline);

    res.forEach((PointLatLng point) =>
        pLineCoords.add(LatLng(point.latitude, point.longitude)));

    _polylines.add(Polyline(
      color: ui.Color.fromARGB(255, 172, 89, 252),
      polylineId: PolylineId("ID"),
      jointType: JointType.round,
      points: pLineCoords,
      width: 2,
      startCap: Cap.buttCap,
      endCap: Cap.roundCap,
      // geodesic: true,
    ));

    // get our bitmaps for markers

    BitmapDescriptorLoader(user_icon_marker_asset, 170, 180).then((value) {
      _markers.add(
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: value,
          visible: true,
          position: LatLng(
              _incomingOrdersController.selectedIncommingOrder!.from.latitude,
              _incomingOrdersController.selectedIncommingOrder!.from.longitude),
        ),
      );
    });

    BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
        .then((value) {
      _markers.add(
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: value,
          visible: true,
          position: LatLng(
              _incomingOrdersController.selectedIncommingOrder!.to.latitude,
              _incomingOrdersController.selectedIncommingOrder!.to.longitude),
        ),
      );

      this._mapReady.value = true;
    });

    // add markers in
    // _markers.addAll([
    // from ==> TaxiDriverMarker
    // Marker(
    //   draggable: false,
    //   flat: true,
    //   anchor: ui.Offset(0.5, 1),
    //   markerId: MarkerId("from"),
    //   icon: _customer_location_marker_bitmap,
    //   visible: true,
    //   position: LatLng(
    //       _incomingOrdersController.selectedIncommingOrder!.from.latitude,
    //       _incomingOrdersController.selectedIncommingOrder!.from.longitude),
    // ),

    // _customerDestinationMarker
    // Marker(
    //   draggable: false,
    //   flat: true,
    //   anchor: ui.Offset(0.5, 1),
    //   markerId: MarkerId("to"),
    //   icon: _customer_destination_marker_bitmap,
    //   visible: true,
    //   position: LatLng(
    //       _incomingOrdersController.selectedIncommingOrder!.to.latitude,
    //       _incomingOrdersController.selectedIncommingOrder!.to.longitude),
    // ),
    // ]);

    initialCameraPosition = LatLng(
        _incomingOrdersController.selectedIncommingOrder!.from.latitude,
        _incomingOrdersController.selectedIncommingOrder!.from.longitude);

    super.onInit();
  }

  Future<BitmapDescriptor> BitmapDescriptorLoader(
      String asset, int width, int height) async {
    return BitmapDescriptor.fromBytes(
        await getBytesFromCanvas(width, height, asset));
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height, urlAsset,
      {bool isBytes = false}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(pictureRecorder);
    late final ByteData datai;

    if (!isBytes) datai = await rootBundle.load(urlAsset);
    var imaged =
        await loadImage(!isBytes ? new Uint8List.view(datai.buffer) : urlAsset);
    canvas.drawImageRect(
      imaged,
      ui.Rect.fromLTRB(
          0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      ui.Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
      new ui.Paint(),
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
  LatLngBounds? getBounds() {
    if (markers.isEmpty) return null;
    return _createBounds(markers.map((m) => m.position).toList());
  }

  @override
  void onClose() {
    print(
        "[MezcalmosOrderViewGoogleMapController] got closes !!!!!!!!!!!!!!!!!!");
    super.onClose();
  }
}
