import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class MezGoogleMap extends StatelessWidget {
  final realtimeTracking;
  MezGoogleMap(this.realtimeTracking);
  Completer<GoogleMapController> _gMapCompleter = Completer();
  GoogleMapController? _googleMapController;

  CurrentOrderMapController? _currentOrderGoogleMapController;
  IncomingOrderMapController? _IncomingOrderMapController;

  dynamic getCorespondingController() {
    dynamic res = realtimeTracking
        ? _currentOrderGoogleMapController
        : _IncomingOrderMapController;

    print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    print(
        "[[[[[[[[[[[[[[[[[[[[[[[[[ BUILD : realtimeTracking > ${realtimeTracking} ]]]]]]]]]]]]]]]]]]]]]]]]]]]]");

    if (realtimeTracking) {
      if (_IncomingOrderMapController?.isClosed != false)
        Get.delete<IncomingOrderMapController>();

      _currentOrderGoogleMapController =
          Get.put<CurrentOrderMapController>(CurrentOrderMapController());
    } else {
      if (_currentOrderGoogleMapController?.isClosed != false)
        Get.delete<CurrentOrderMapController>();

      _IncomingOrderMapController =
          Get.put<IncomingOrderMapController>(IncomingOrderMapController());
    }

    print(
        "[HOLY MEZCALMOS GMAP] Markers ====> ${getCorespondingController().markers.toString()}");
    print(
        "[HOLY MEZCALMOS GMAP] initialCameraPosition ====> ${getCorespondingController().initialCameraPosition.toString()}");

    return Obx(() => getCorespondingController().mapReady == false ||
            getCorespondingController().initialCameraPosition == LatLng(0, 0)
        ? Center(child: CircularProgressIndicator())
        : new GoogleMap(
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(10, 50),
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
              dynamic _getBounds = getCorespondingController().getBounds();
              if (_getBounds != null) {
                await _gController.animateCamera(
                    CameraUpdate.newLatLngBounds(_getBounds, 150));
              }
              _gMapCompleter.complete(_gController);
            },
          ));
  }
}
