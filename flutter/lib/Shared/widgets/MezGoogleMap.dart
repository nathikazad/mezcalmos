import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class MezGoogleMap extends StatelessWidget {
  final realtimeTracking;
  MezGoogleMap(this.realtimeTracking);
  Completer<GoogleMapController> _gMapCompleter = Completer();
  GoogleMapController? _googleMapController;

  CurrentOrderMapController? _currentOrderGoogleMapController;
  IncomingOrderMapController? _IncomingOrderMapController;
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  dynamic getCorespondingController() {
    dynamic res = realtimeTracking
        ? _currentOrderGoogleMapController
        : _IncomingOrderMapController;

    return res;
  }

  @override
  Widget build(BuildContext context) {
    if (realtimeTracking) {
      if (_IncomingOrderMapController?.initialized == true)
        Get.delete<IncomingOrderMapController>();

      _currentOrderGoogleMapController =
          Get.put<CurrentOrderMapController>(CurrentOrderMapController());
    } else {
      if (_currentOrderGoogleMapController?.initialized == true)
        Get.delete<CurrentOrderMapController>();

      _IncomingOrderMapController =
          Get.put<IncomingOrderMapController>(IncomingOrderMapController());
    }

    _taxiAuthController.currentLocationRx.listen((newLocation) {
      if (_taxiAuthController.currentOrderId != null) {
        // print(
        //     " -------------------> > > Updating manually the user's Markers location  ----------------- <<<");
        String? res =
            _currentOrderGoogleMapController?.updateTaxiMarker(newLocation);

        if (res != null) {
          // _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //         target: LatLng(_taxiAuthController.currentLocation.latitude!,
          //             _taxiAuthController.currentLocation.longitude!))));
          _googleMapController?.animateCamera(CameraUpdate.newLatLngBounds(
              _currentOrderGoogleMapController?.getBounds(), 180));

          // await _googleMapController?.moveCamera(CameraUpdate.newLatLngBounds(
          //     _currentOrderGoogleMapController?.getBounds(), 200));
        }
      }
    });
    GoogleMap _googleMap = GoogleMap(
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      // minMaxZoomPreference: MinMaxZoomPreference(10, 20),
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
        _googleMapController = _gController;
        await _gController.setMapStyle(GetStorage().read('map_style'));
        dynamic _getBounds = getCorespondingController().getBounds();
        if (_getBounds != null) {
          await _gController
              .animateCamera(CameraUpdate.newLatLngBounds(_getBounds, 180));
        }
        _gMapCompleter.complete(_gController);
      },
    );

    return Obx(() => getCorespondingController().mapReady == false ||
            getCorespondingController().initialCameraPosition == LatLng(0, 0)
        ? Center(child: CircularProgressIndicator())
        : _googleMap);
  }
}
