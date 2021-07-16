import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/mezcalmosGoogleMapController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class MezcalmosGoogleMap extends StatelessWidget {
  final realtimeTracking;
  MezcalmosGoogleMap(this.realtimeTracking);
  Completer<GoogleMapController> _gMapCompleter = Completer();
  GoogleMapController? _googleMapController;

  CurrentOrderController _currentOrderController =
      Get.find<CurrentOrderController>();

  MezcalmosCurrentOrderGoogleMapController? _currentOrderGoogleMapController;
  MezcalmosOrderViewGoogleMapController? _mezcalmosOrderViewGoogleMapController;

  dynamic getCorespondingController() {
    dynamic res = realtimeTracking
        ? _currentOrderGoogleMapController
        : _mezcalmosOrderViewGoogleMapController;

    print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    print(
        "[[[[[[[[[[[[[[[[[[[[[[[[[ BUILD : realtimeTracking > ${realtimeTracking} ]]]]]]]]]]]]]]]]]]]]]]]]]]]]");

    if (realtimeTracking) {
      if (_mezcalmosOrderViewGoogleMapController != null)
        _mezcalmosOrderViewGoogleMapController!.onDelete;

      _currentOrderGoogleMapController =
          Get.put<MezcalmosCurrentOrderGoogleMapController>(
              MezcalmosCurrentOrderGoogleMapController());
    } else {
      if (_currentOrderGoogleMapController != null)
        _currentOrderGoogleMapController!.dispose();

      _mezcalmosOrderViewGoogleMapController =
          Get.put<MezcalmosOrderViewGoogleMapController>(
              MezcalmosOrderViewGoogleMapController());
    }

    print(
        "[HOLY MEZCALMOS GMAP] Markers ====> ${getCorespondingController().markers.toString()}");
    print(
        "[HOLY MEZCALMOS GMAP] initialCameraPosition ====> ${getCorespondingController().initialCameraPosition.toString()}");

    return Obx(() => !getCorespondingController().mapReady ||
            (realtimeTracking && _currentOrderController.value!.status == null)
        ? Center(child: CircularProgressIndicator())
        : GoogleMap(
            // onCameraMove: (_) async {
            //   await reUpdateLocation();
            // },
            myLocationButtonEnabled: false,
            // minMaxZoomPreference: MinMaxZoomPreference(10, 16),
            buildingsEnabled: false,
            markers: getCorespondingController().markers,
            polylines: getCorespondingController().polylines,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                target: getCorespondingController().initialCameraPosition,
                tilt: 9.440717697143555,
                zoom: 14.151926040649414),
            onMapCreated: (GoogleMapController _gController) async {
              // _googleMapController = controller;
              await _gController.setMapStyle(GetStorage().read('map_style'));
              await _gController.animateCamera(CameraUpdate.newLatLngBounds(
                  getCorespondingController().getBounds()!, 150));
              _gMapCompleter.complete(_gController);
            },
          ));
  }
}
