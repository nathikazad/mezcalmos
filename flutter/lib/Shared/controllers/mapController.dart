import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

// we are using this in google map Screens
class CurrentOrderMapController extends GetxController {
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
  void onInit() async {
    // initilize our polylines ====================

    print(
        "\n\n[CurrentOrderMapController] =============== INITIALIZED ==============\n\n");

    googleMapUpdate();
    super.onInit();
  }

  void googleMapUpdate() async {
    _polylines.clear();
    bool _dirty = _currentOrderController.value?.customer['image'] == null;

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

      initialCameraPosition = LatLng(
          _taxiAuthController.currentLocation.latitude!,
          _taxiAuthController.currentLocation.longitude!);
      _markers.addAll([
        // _customerLocationMarker
        Marker(
          draggable: false,
          // flat: true,
          // anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          icon: await BitmapDescriptorLoader(
              !_dirty
                  ? (await cropRonded((await http.get(Uri.parse(
                          _currentOrderController.value?.customer?['image'])))
                      .bodyBytes) as Uint8List)
                  : user_icon_marker_asset,
              100,
              100,
              isBytes: !_dirty),
          visible: true,
          position: LatLng(_currentOrderController.value!.from.latitude,
              _currentOrderController.value!.from.longitude),
        ),

        Marker(
          draggable: false,
          onTap: () => null,
          onDragEnd: (value) => null,
          // flat: true,
          // anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: _getStorage.read('destination_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude),
        ),
        Marker(
          draggable: false,
          // flat: true,
          // anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("taxi"),
          icon: _getStorage.read('taxi_descriptor'),
          visible: true,
          position: LatLng(_taxiAuthController.currentLocation.latitude!,
              _taxiAuthController.currentLocation.longitude!),
        )
      ]);

      _mapReady.value = true;
    } else if (_currentOrderController.value!.status == "inTransit") {
      // that means taxi already picked up the customer
      print("]]]]]]]]]]]]]]]]]]]]]]\n\n IN_TRANSIT \n\n[[[[[[[[[[[[[[[[[[[[[");

      initialCameraPosition = LatLng(
          _taxiAuthController.currentLocation.latitude!,
          _taxiAuthController.currentLocation.longitude!);

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

      this._mapReady.value = true;
    } else if (_currentOrderController.value!.status == "droppedOff") {
      initialCameraPosition = LatLng(
          _currentOrderController.value!.from.latitude,
          _currentOrderController.value!.from.longitude);
      print(
          "]]]]]]]]]]]]]]]]]]]]]]\n\n OTHER_RIDE_STATUS \n\n[[[[[[[[[[[[[[[[[[[[[");

      _markers.addAll([
        Marker(
          draggable: false,
          // flat: true,
          // anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("from"),
          // icon: await _getStorage.read<Function>('user_descriptor')!(
          //     true, _currentOrderController.value!.customer['image']),
          icon: await BitmapDescriptorLoader(
              !_dirty
                  ? (await cropRonded((await http.get(Uri.parse(
                          _currentOrderController.value?.customer['image'])))
                      .bodyBytes) as Uint8List)
                  : user_icon_marker_asset,
              100,
              100,
              isBytes: !_dirty),

          visible: true,
          position: LatLng(_currentOrderController.value!.from.latitude,
              _currentOrderController.value!.from.longitude),
        ),
        Marker(
          draggable: false,
          // flat: true,
          // anchor: ui.Offset(0.5, 1),
          markerId: MarkerId("to"),
          icon: _getStorage.read('destination_descriptor'),
          visible: true,
          position: LatLng(_currentOrderController.value!.to.latitude,
              _currentOrderController.value!.to.longitude),
        ),
      ]);

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
  get onDelete => super.onDelete;

  @override
  void onClose() {
    print("[==== IncomingOrderMapController] got closes !!!!!!!!!!!!!!!!!!");
    super.onClose();
  }
}

// to - from
// we are using this in google map Screens
class IncomingOrderMapController extends GetxController {
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

  @override
  void onInit() async {
    bool _dirty =
        _incomingOrdersController.selectedIncommingOrder!.customer['image'] ==
            null;

    // initilize our polylines ====================
    print(
        "\n\n[IncomingOrderMapController] =============== INITIALIZED ==============\n\n");

    initialCameraPosition = LatLng(
        _incomingOrdersController.selectedIncommingOrder!.from.latitude,
        _incomingOrdersController.selectedIncommingOrder!.from.longitude);

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

    _markers.addAll([
      Marker(
        draggable: false,
        // flat: true,
        // anchor: ui.Offset(0.5, 1),
        markerId: MarkerId("from"),

        // icon: await _getStorage.read('user_descriptor'),
        icon: await BitmapDescriptorLoader(
            !_dirty
                ? (await cropRonded((await http.get(Uri.parse(
                        _incomingOrdersController
                            .selectedIncommingOrder!.customer['image'])))
                    .bodyBytes) as Uint8List)
                : user_icon_marker_asset,
            100,
            100,
            isBytes: !_dirty),
        visible: true,
        position: LatLng(
            _incomingOrdersController.selectedIncommingOrder!.from.latitude,
            _incomingOrdersController.selectedIncommingOrder!.from.longitude),
      ),
      Marker(
        draggable: false,
        // flat: true,
        // anchor: ui.Offset(0., 0.9),

        markerId: MarkerId("to"),
        icon: _getStorage.read('destination_descriptor'),
        visible: true,
        position: LatLng(
            _incomingOrdersController.selectedIncommingOrder!.to.latitude,
            _incomingOrdersController.selectedIncommingOrder!.to.longitude),
      ),
    ]);

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
    if (markers.isEmpty) {
      print(
          "=================>>>>>>>> GET BOUND ARE EMPTY <<<<<<<<<=================");
      return null;
    }
    return _createBounds(markers.map((m) => m.position).toList());
  }

  @override
  void onClose() {
    print("[IncomingOrderMapController] got closes !!!!!!!!!!!!!!!!!!");
    super.onClose();
  }
}
