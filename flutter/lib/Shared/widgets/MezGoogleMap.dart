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

  Future<void> updateCameraLocation(
      LatLng source, LatLng destination, GoogleMapController? mapController,
      {String? mode}) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(
        bounds, mode == null ? 150 : (mode == "onTheWay" ? 50 : 90));

    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController? mapController) async {
    mapController!.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (realtimeTracking) {
      if (_IncomingOrderMapController?.isClosed == false)
        Get.delete<IncomingOrderMapController>();

      _currentOrderGoogleMapController =
          Get.put<CurrentOrderMapController>(CurrentOrderMapController());
    } else {
      if (_currentOrderGoogleMapController?.isClosed == false)
        Get.delete<CurrentOrderMapController>();

      _IncomingOrderMapController =
          Get.put<IncomingOrderMapController>(IncomingOrderMapController());
    }

    Future<void> markerCheckerAndUpdater({LocationData? newLocation}) async {
      // condition where we have a current order and passed location to update markers in map
      if (_taxiAuthController.currentOrderId != null && newLocation != null) {
        CurrentOrderController _currentOrderCtrl =
            Get.find<CurrentOrderController>();
        // print(
        //     " -------------------> > > Updating manually the user's Markers location  ----------------- <<<");
        String? res =
            _currentOrderGoogleMapController?.updateTaxiMarker(newLocation);

        // inTransit
        if (res == "from") {
          print(
              "- IN TRANSIT - Updating map Camera position since Location has been changed !");
          await updateCameraLocation(
              new LatLng(newLocation.latitude!, newLocation.longitude!),
              new LatLng(_currentOrderCtrl.value?.to?.latitude,
                  _currentOrderCtrl.value?.to?.longitude),
              _googleMapController,
              mode: "inTransit");
        }
        // onTheWay
        else if (res == "taxi") {
          print(
              "- OnTheWay - Updating map Camera position since Location has been changed !");
          await updateCameraLocation(
              new LatLng(newLocation.latitude!, newLocation.longitude!),
              new LatLng(_currentOrderCtrl.value?.from?.latitude,
                  _currentOrderCtrl.value?.from?.longitude),
              _googleMapController,
              mode: "onTheWay");
        }
      }
      // else {
      //   IncomingOrdersController _incomOrder =
      //       Get.find<IncomingOrdersController>();
      //   print("Updating currentOrderView !");
      //   // this is orderViewScreen basically , we will just make the zoom animation once and leave it be.
      //   await updateCameraLocation(
      //     new LatLng(_incomOrder.selectedIncommingOrder?.from?.latitude,
      //         _incomOrder.selectedIncommingOrder?.from?.longitude),
      //     new LatLng(_incomOrder.selectedIncommingOrder?.to?.latitude,
      //         _incomOrder.selectedIncommingOrder?.to?.longitude),
      //     _googleMapController,
      //   );
      // }
    }

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      if (_taxiAuthController.currentOrderId != null) {
        _taxiAuthController.currentLocationRx.listen((newLocation) async {
          if (newLocation.latitude != null && newLocation.longitude != null) {
            await markerCheckerAndUpdater(newLocation: newLocation);
          }
        });
      }
    });

    Rx<GoogleMap> _googleMap = GoogleMap(
      padding: EdgeInsets.all(20),
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      minMaxZoomPreference: MinMaxZoomPreference(5, 18),
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
          await updateCameraLocation(
            new LatLng(getCorespondingController().from_lat,
                getCorespondingController().from_lng),
            new LatLng(
              getCorespondingController().to_lat,
              getCorespondingController().to_lng,
            ),
            _googleMapController,
          );
        }

        _gMapCompleter.complete(_gController);
      },
    ).obs;

    return Obx(() => getCorespondingController().mapReady == false ||
            getCorespondingController().initialCameraPosition == LatLng(0, 0)
        ? Center(child: CircularProgressIndicator())
        : _googleMap.value);
  }
}
