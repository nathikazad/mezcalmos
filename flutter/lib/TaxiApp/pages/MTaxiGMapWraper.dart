import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

mixin MTaxiGMapWrapper {
  RxList<CustomMarker> markers = <CustomMarker>[].obs;
  LatLng initialCameraLocation = LatLng(0, 0);
  Set<Polyline> polylines = <Polyline>{}.obs;

  BitmapDescriptor? toDescriptor;
  BitmapDescriptor? taxiDescriptor;
  BitmapDescriptor? picMarker;

  // RxBool mapReady = false.obs;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  LatLngBounds? latLngBounds;

  Future<bool> fillMarkers({String? orderStatus}); //
  Future<BitmapDescriptor> userMarkerPicture();

  void setBounds(LatLngBounds _) {
    this.latLngBounds = _;

    print("================= abstract wraper =============\n\n");
    print(latLngBounds);
    // print(mapReady.value);
    print(markers);
    print("\n\n================= abstract wraper =============");
  }

  Future<void> loadBitmapsUp() async {
    if (toDescriptor == null)
      toDescriptor = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
    if (taxiDescriptor == null) {}
    taxiDescriptor = await BitmapDescriptorLoader(
        (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
            .buffer
            .asUint8List())),
        60,
        60,
        isBytes: true);

    // if (picMarker == null) picMarker = await this.userMarkerPicture();
  }

  void setPolylines(List<LatLng> _pCords) {
    polylines.clear();
    polylines.add(Polyline(
      color: Color.fromARGB(255, 172, 89, 252),
      polylineId: PolylineId("polyline"),
      jointType: JointType.round,
      points: _pCords,
      width: 2,
      startCap: Cap.buttCap,
      endCap: Cap.roundCap,
      // geodesic: true,
    ));
  }

  LatLngBounds createBounds() {
    List<LatLng> positions = markers
        .map((e) => LatLng(e.position.latitude, e.position.longitude))
        .toList();

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
    // mapReady.value = true;
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  // Widget getMap() {
  //   print("[[[[[[[[[[[[[[[[[[ L O A D I N G ]]]]]]]]]]]]]]]]]");
  //   // print("[[[[[[[[[[[[[[[[[[ ${mapReady.value} ]]]]]]]]]]]]]]]]]");
  //   print("[[[[[[[[[[[[[[[[[[ $latLngBounds ]]]]]]]]]]]]]]]]]");
  //   print("[[[[[[[[[[[[[[[[[[=====================]]]]]]]]]]]]]]]]]");

  //   if (latLngBounds != null) {
  //     print("[[[[[[[[[[[[[[[[[[ M A P  -- R E A D Y ]]]]]]]]]]]]]]]]]");
  //     return MGoogleMap(markers, initialCameraLocation, latLngBounds!,
  //         polylines: this.polylines);
  //   } else {
  //     return Center(child: CircularProgressIndicator());
  //   }
  // }
}
