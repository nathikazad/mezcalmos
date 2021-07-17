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

  GetStorage _getStorage = GetStorage();

  @override
  void onInit() {
    // initilize our polylines ====================

    print(
        "\n\n[MezcalmosCurrentOrderGoogleMapController] =============== INITIALIZED ==============\n\n");

    googleMapUpdate();
    super.onInit();
  }

  void googleMapUpdate() {
    _polylines.clear();
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

    print(":::::::: googleMapUpdate :::::::: Called ::::::::");
    print(
        ":::::::: ========= POLYLINE len: ${_polylines.length} ======== ::::::::");
    _markers.clear();
    _mapReady.value = false;

    if (_currentOrderController.value!.status == "onTheWay") {
      // that means taxi accepted order
      print("]]]]]]]]]]]]]]]]]]]]]]\n\n ON_THE_WAY \n\n[[[[[[[[[[[[[[[[[[[[[");

      _markers.addAll([
        // _customerLocationMarker
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: _getStorage.read('user_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.from.latitude,
              _currentOrderController.value!.from.longitude),
        ),

        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: _getStorage.read('destination_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude),
        ),
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("taxi"),
          icon: _getStorage.read('taxi_descriptor'),
          visible: true,
          position: LatLng(_taxiAuthController.currentLocation.latitude!,
              _taxiAuthController.currentLocation.longitude!),
        )
      ]);

      // BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
      //     .then((value) {
      //   _markers.add(
      //     // _customerLocationMarker
      //     Marker(
      //       draggable: false,
      //       flat: true,
      //       anchor: ui.Offset(0.5, 1),
      //       markerId: MarkerId("to"),
      //       icon: value,
      //       visible: true,
      //       position: LatLng(_currentOrderController.value!.to.latitude,
      //           _currentOrderController.value!.to.longitude),
      //     ),
      //   );
      // });

      // BitmapDescriptorLoader(taxi_driver_marker_asset, 80, 90).then((value) {
      //   _markers.add(Marker(
      //     draggable: false,
      //     flat: true,
      //     anchor: ui.Offset(0.5, 1),
      //     markerId: MarkerId("taxi"),
      //     icon: value,
      //     visible: true,
      //     position: LatLng(_taxiAuthController.currentLocation.latitude,
      //         _taxiAuthController.currentLocation.longitude),
      //   ));
      //   this._mapReady.value = true;
      // });

      initialCameraPosition = LatLng(
          _taxiAuthController.currentLocation.latitude!,
          _taxiAuthController.currentLocation.longitude!);

      _mapReady.value = true;
    } else if (_currentOrderController.value!.status == "inTransit") {
      // that means taxi already picked up the customer
      print("]]]]]]]]]]]]]]]]]]]]]]\n\n IN_TRANSIT \n\n[[[[[[[[[[[[[[[[[[[[[");

      _markers.addAll([
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: _getStorage.read('taxi_descriptor'),
          visible: true,
          position: LatLng(_taxiAuthController.currentLocation.latitude!,
              _taxiAuthController.currentLocation.longitude!),
        ),
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: _getStorage.read('destination_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude),
        ),
      ]);
      // BitmapDescriptorLoader(taxi_driver_marker_asset, 80, 90).then((value) {
      //   _markers.add(
      //     // from ==> TaxiDriverMarker
      //     Marker(
      //       draggable: false,
      //       flat: true,
      //       anchor: ui.Offset(0.5, 1),
      //       markerId: MarkerId("from"),
      //       icon: value,
      //       visible: true,
      //       position: LatLng(_taxiAuthController.currentLocation.latitude,
      //           _taxiAuthController.currentLocation.longitude),
      //     ),
      //   );
      // });

      // BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
      //     .then((value) {
      //   _markers.add(
      //     Marker(
      //       draggable: false,
      //       flat: true,
      //       anchor: ui.Offset(0.5, 1),
      //       markerId: MarkerId("to"),
      //       icon: value,
      //       visible: true,
      //       position: LatLng(_currentOrderController.value!.to.latitude,
      //           _currentOrderController.value!.to.longitude),
      //     ),
      //   );
      //   this._mapReady.value = true;
      // });

      initialCameraPosition = LatLng(
          _taxiAuthController.currentLocation.latitude!,
          _taxiAuthController.currentLocation.longitude!);
      this._mapReady.value = true;
    } else if (_currentOrderController.value!.status == "droppedOff") {
      print(
          "]]]]]]]]]]]]]]]]]]]]]]\n\n OTHER_RIDE_STATUS \n\n[[[[[[[[[[[[[[[[[[[[[");

      _markers.addAll([
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: _getStorage.read('user_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.from.latitude,
              _currentOrderController.value!.from.longitude),
        ),
        Marker(
          draggable: false,
          flat: true,
          anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: _getStorage.read('destination_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude),
        ),
      ]);
      // BitmapDescriptorLoader(user_icon_marker_asset, 170, 180).then((value) {
      //   _markers.add(
      //     Marker(
      //       draggable: false,
      //       flat: true,
      //       anchor: ui.Offset(0.5, 1),
      //       markerId: MarkerId("from"),
      //       icon: value,
      //       visible: true,
      //       position: LatLng(_currentOrderController.value!.from.latitude,
      //           _currentOrderController.value!.from.longitude),
      //     ),
      //   );
      // });

      // BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
      //     .then((value) {
      //   _markers.add(
      //     Marker(
      //       draggable: false,
      //       flat: true,
      //       anchor: ui.Offset(0.5, 1),
      //       markerId: MarkerId("to"),
      //       icon: value,
      //       visible: true,
      //       position: LatLng(_currentOrderController.value!.to.latitude,
      //           _currentOrderController.value!.to.longitude),
      //     ),
      //   );
      initialCameraPosition = LatLng(
          _currentOrderController.value!.from.latitude,
          _currentOrderController.value!.from.longitude);
      this._mapReady.value = true;
      // });
    } else {
      print(
          "\n\n __________________________( STATUS => ${_currentOrderController.value!.status} )_______________________\n\n");
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

// to - from
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

  GetStorage _getStorage = GetStorage();

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

    // BitmapDescriptorLoader(user_icon_marker_asset, 170, 180).then((value) {
    //   _markers.add(
    //     Marker(
    //       draggable: false,
    //       flat: true,
    //       anchor: ui.Offset(0.5, 1),
    //       markerId: MarkerId("from"),
    //       icon: value,
    //       visible: true,
    //       position: LatLng(
    //           _incomingOrdersController.selectedIncommingOrder!.from.latitude,
    //           _incomingOrdersController.selectedIncommingOrder!.from.longitude),
    //     ),
    //   );
    // });

    // BitmapDescriptorLoader(purple_destination_marker_asset, 80, 90)
    //     .then((value) {
    //   _markers.add(
    //     Marker(
    //       draggable: false,
    //       flat: true,
    //       anchor: ui.Offset(0.5, 1),
    //       markerId: MarkerId("to"),
    //       icon: value,
    //       visible: true,
    //       position: LatLng(
    //           _incomingOrdersController.selectedIncommingOrder!.to.latitude,
    //           _incomingOrdersController.selectedIncommingOrder!.to.longitude),
    //     ),
    //   );

    //   this._mapReady.value = true;
    // });

    _markers.addAll([
      Marker(
        draggable: false,
        flat: true,
        anchor: ui.Offset(0.5, 1),
        markerId: MarkerId("from"),
        icon: _getStorage.read('user_descriptor'),
        visible: true,
        position: LatLng(
            _incomingOrdersController.selectedIncommingOrder!.from.latitude,
            _incomingOrdersController.selectedIncommingOrder!.from.longitude),
      ),
      Marker(
        draggable: false,
        flat: true,
        anchor: ui.Offset(0.5, 1),
        markerId: MarkerId("to"),
        icon: _getStorage.read('destination_descriptor'),
        visible: true,
        position: LatLng(
            _incomingOrdersController.selectedIncommingOrder!.to.latitude,
            _incomingOrdersController.selectedIncommingOrder!.to.longitude),
      ),
    ]);

    initialCameraPosition = LatLng(
        _incomingOrdersController.selectedIncommingOrder!.from.latitude,
        _incomingOrdersController.selectedIncommingOrder!.from.longitude);

    _mapReady.value = true;
    super.onInit();
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
