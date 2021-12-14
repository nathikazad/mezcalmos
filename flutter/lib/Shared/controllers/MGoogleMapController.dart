import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;

class MGoogleMapController {
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<Marker> markers = <Marker>[].obs;
  Rxn<Location> location = Rxn();
  RxBool animateMarkersPolyLinesBounds = false.obs;
  GoogleMapController? controller;

  void _addOrUpdateMarker(Marker marker) {
    markers.removeWhere(
        (element) => element.markerId.value == marker.markerId.value);
    markers.add(marker);
  }

  Future<void> addOrUpdateCircleMarker(LatLng latLng,
      {String markerId = "default"}) async {
    markers.removeWhere((element) => element.markerId.value == markerId);
    markers.add(Marker(
        markerId: MarkerId(markerId),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), aPurpleLocationCircle),
        flat: true,
        position: latLng));
  }

  void removeCircleMarker({String markerId = "default"}) {
    markers.removeWhere((element) => element.markerId.value == markerId);
  }

  Future<void> addOrUpdateUserMarker(
      {String? markerId, required LatLng latLng, String? imgUrl}) async {
    BitmapDescriptor icon = await BitmapDescriptorLoader(
        (await cropRonded((await http.get(Uri.parse(imgUrl ??
                Get.find<AuthController>().user!.image ??
                aDefaultAvatar)))
            .bodyBytes) as Uint8List),
        60,
        60,
        isBytes: true);
    // default userId is authenticated's
    this._addOrUpdateMarker(Marker(
        markerId: MarkerId(markerId ?? Get.find<AuthController>().user!.uid),
        icon: icon,
        position: latLng));
  }

  Future<void> addOrUpdateTaxiDriverMarker(
      String markerId, LatLng latLng) async {
    this._addOrUpdateMarker(Marker(
        markerId: MarkerId(markerId),
        icon: await BitmapDescriptorLoader(
            (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
                .buffer
                .asUint8List())),
            60,
            60,
            isBytes: true),
        flat: true,
        position: latLng));
  }

  Future<void> addOrUpdatePurpleDestinationMarker(
      {String markerId = "dest", required LatLng latLng}) async {
    BitmapDescriptor icon = await BitmapDescriptorLoader(
        (await cropRonded(
            (await rootBundle.load(purple_destination_marker_asset))
                .buffer
                .asUint8List())),
        60,
        60,
        isBytes: true);
    // markerId = markerId;

    this._addOrUpdateMarker(
        Marker(markerId: MarkerId(markerId), icon: icon, position: latLng));
  }

  void removeDestinationMarker({String id = "dest"}) {
    this.removeMarkerById(id);
  }

  void decodeAndAddPolyline({required String encodedPolylineString}) {
    this.addPolyline(MapHelper.loadUpPolyline(encodedPolylineString)
        .map<PointLatLng>((e) => PointLatLng(e.latitude, e.longitude))
        .toList());
  }

  void removeMarkerById(String markerId) {
    markers.removeWhere((element) => element.markerId.value == markerId);
  }

  void addPolyline(List<PointLatLng> latLngPoints) {
    mezDbgPrint("---< $latLngPoints");
    mezDbgPrint(
        "[   M GOOGLE MAP CONTROLLER BEFORE ] ===> POLYLINES > $polylines");
    Polyline _poly = Polyline(
        color: Color.fromARGB(255, 172, 89, 252),
        jointType: JointType.round,
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('_poly_'),
        visible: true,
        points: latLngPoints
            .map<LatLng>((e) => LatLng(e.latitude, e.longitude))
            .toList());
    polylines.assign(_poly);

    mezDbgPrint(
        "[   M GOOGLE MAP CONTROLLER AFTER ] ===> POLYLINES > $polylines");

    this.animateMarkersPolyLinesBounds.value = true;
  }

  void clearPolyline() {
    polylines.clear();
  }

  void setAnimateMarkersPolyLinesBounds(bool value) {
    this.animateMarkersPolyLinesBounds.value = value;
  }

  void moveToNewLatLng(double lat, double lng) async {
    await controller?.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
  }

  Future<LatLng> getMapCenter() async {
    LatLngBounds? visibleRegion = await controller?.getVisibleRegion();

    LatLng centerLatLng = visibleRegion == null
        ? LatLng(0, 0)
        : LatLng(
            (visibleRegion.northeast.latitude +
                    visibleRegion.southwest.latitude) /
                2,
            (visibleRegion.northeast.longitude +
                    visibleRegion.southwest.longitude) /
                2,
          );

    return centerLatLng;
  }

  void setLocation(Location newLocation) {
    this.location.value = newLocation;
  }
}
