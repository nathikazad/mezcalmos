import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:sizer/sizer.dart';

class MGoogleMapController {
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<Marker> markers = <Marker>[].obs;
  Rxn<Location> location = Rxn();
  RxBool animateMarkersPolyLinesBounds = false.obs;
  GoogleMapController? controller;
  LatLngBounds? bounds;
  Function? onMapTap;

  RxDouble markersDefaultSize = 10.h.obs;

  MinMaxZoomPreference? minMaxZoomPrefs;

  void setOnMapTap({required Function onTap}) {
    this.onMapTap = onTap;
  }

  void _addOrUpdateMarker(Marker marker) {
    markers.removeWhere(
        (element) => element.markerId.value == marker.markerId.value);
    markers.add(marker);
  }

  void updateMarkersIconOnZoomChange({required double zoom}) {
    ///
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

  double _calculateMarkersSize() {
    var res = markersDefaultSize.value;

    if (SizerUtil.height <= 868) {
      mezDbgPrint(
          "Size of screen height is less or equal to [868] , returning 60 as marker size !");
      return 60;
    } else {
      mezDbgPrint(
          "Size of screen height is greater than [868] , returning ${res} as marker size !");

      return res;
    }
  }

  Future<void> addOrUpdateUserMarker(
      {String? markerId,
      required LatLng latLng,
      String? customImgHttpUrl}) async {
    BitmapDescriptor icon;

    String? uImg = Get.find<AuthController>().user?.image ??
        Get.find<AuthController>().user?.bigImage;

    if (uImg == null) {
      icon = await bitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(aDefaultAvatar)).buffer.asUint8List())),
          _calculateMarkersSize(),
          _calculateMarkersSize(),
          isBytes: true);
    } else {
      icon = await bitmapDescriptorLoader(
          (await cropRonded(
              (await http.get(Uri.parse(customImgHttpUrl ?? uImg)))
                  .bodyBytes) as Uint8List),
          _calculateMarkersSize(),
          _calculateMarkersSize(),
          isBytes: true);
    }

    // default userId is authenticated's
    this._addOrUpdateMarker(Marker(
        markerId: MarkerId(
            markerId ?? Get.find<AuthController>().user?.id ?? 'ANONYMOUS'),
        icon: icon,
        position: latLng));
  }

  Future<void> addOrUpdateTaxiDriverMarker(
      String markerId, LatLng latLng) async {
    this._addOrUpdateMarker(Marker(
        markerId: MarkerId(markerId),
        icon: await bitmapDescriptorLoader(
            (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
                .buffer
                .asUint8List())),
            _calculateMarkersSize(),
            _calculateMarkersSize(),
            isBytes: true),
        flat: true,
        position: latLng));
  }

  Future<void> addOrUpdatePurpleDestinationMarker(
      {String markerId = "dest", required LatLng latLng}) async {
    BitmapDescriptor icon = await bitmapDescriptorLoader(
        (await cropRonded(
            (await rootBundle.load(purple_destination_marker_asset))
                .buffer
                .asUint8List())),
        _calculateMarkersSize(),
        _calculateMarkersSize(),
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

  void removerAuthenticatedUserMarker() {
    markers.removeWhere((element) =>
        element.markerId.value ==
        (Get.find<AuthController>().user?.id ?? 'ANONYMOUS'));
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

  void setBounds(LatLngBounds? bounds) {
    this.bounds = bounds;
  }

  // Animate the camera using widget.bounds
  Future<void> animateCameraWithNewBounds() async {
    if (controller != null && this.bounds != null) {
      CameraUpdate _camUpdate = CameraUpdate.newLatLngBounds(this.bounds!, 100);
      await controller!.animateCamera(_camUpdate);
      await _boundsReChecker(_camUpdate);
    }
  }

  // Cheker -> Animate first and Double check if the bounds fit well the MapScreen
  Future<void> _boundsReChecker(CameraUpdate u) async {
    controller?.animateCamera(u);
    controller?.animateCamera(u);
    LatLngBounds? l1 = await controller?.getVisibleRegion();
    LatLngBounds? l2 = await controller?.getVisibleRegion();
    if (l1 != null && l2 != null) {
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
        await _boundsReChecker(u);
    }
  }

  // adds up the markers the new markers latLn ot polyline's and calculate out of them all the latLngbounds
  LatLngBounds? _getMarkersAndPolylinesBounds() {
    List<LatLng> _bnds = [..._getLatLngBoundsFromPolyline(polylines)];
    // mezDbgPrint("+ Added Polyline ${_bnds} TO BOUNDS!");

    markers.forEach((cmarker) {
      // mezDbgPrint("+ ADDING MARKER ${cmarker.markerId.value} TO BOUNDS!");
      _bnds.add(cmarker.position);
    });
    return _bnds.isEmpty ? null : MapHelper.createMapBounds(_bnds);
  }

  // Calculate bounds from the polyline's List of LatLng
  // we're using this onInit (one time calculation since we have the polyline always the same)
  List<LatLng> _getLatLngBoundsFromPolyline(Set<Polyline> p) {
    if (p.isNotEmpty) {
      double minLat = p.first.points.first.latitude;
      double minLong = p.first.points.first.longitude;
      double maxLat = p.first.points.first.latitude;
      double maxLong = p.first.points.first.longitude;
      p.forEach((poly) {
        poly.points.forEach((point) {
          if (point.latitude < minLat) minLat = point.latitude;
          if (point.latitude > maxLat) maxLat = point.latitude;
          if (point.longitude < minLong) minLong = point.longitude;
          if (point.longitude > maxLong) maxLong = point.longitude;
        });
      });

      return [LatLng(minLat, minLong), LatLng(maxLat, maxLong)];
    } else {
      return [];
    }
  }

  // main function for updating the bounds and start the animation
  Future<void> animateAndUpdateBounds() async {
    setBounds(animateMarkersPolyLinesBounds.value
        ? _getMarkersAndPolylinesBounds()
        : null);
    await animateCameraWithNewBounds();
  }

  MinMaxZoomPreference getMapMinMaxZommPrefs() {
    if (this.minMaxZoomPrefs == null) {
      return this.polylines.isNotEmpty
          ? MinMaxZoomPreference.unbounded
          : MinMaxZoomPreference(16, 17);
    } else {
      return this.minMaxZoomPrefs!;
    }
  }
}
