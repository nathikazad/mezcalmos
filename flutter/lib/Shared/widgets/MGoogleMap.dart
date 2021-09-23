import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

class MGoogleMap extends StatefulWidget {
  Map<String, dynamic> markerIdWithLocationSubscription;
  List<CustomMarker> _cMarkers;
  LatLng initialLocation;
  Set<Polyline> polylines;
  // bounds
  LatLng boundsSource;
  LatLng boundsDestination;

  MGoogleMap(this._cMarkers, this.initialLocation, this.boundsSource,
      this.boundsDestination,
      {this.markerIdWithLocationSubscription = const <String, dynamic>{
        "id": null,
        "sub": null,
      },
      this.polylines = const <Polyline>{}});

  @override
  _MGoogleMapState createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> {
  Set<Marker> markers = <Marker>{};

  void _updateMarkers() {
    markers.clear();
    setState(() {
      widget._cMarkers.forEach((cmarker) {
        markers.add(cmarker.marker());
      });
    });
  }

  // ============================= BOUNDS UPDATE ===========================
  Future<void> updateCameraLocation(
      LatLng source, LatLng destination, GoogleMapController? mapController,
      {String? mode, double myPadding = 150}) async {
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

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, myPadding);

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
  // =======================================================================

  @override
  void initState() {
    super.initState();
    // initializing all the markers needed
    _updateMarkers();

    if (widget.markerIdWithLocationSubscription["sub"] != null &&
        widget.markerIdWithLocationSubscription["id"] != null) {
      widget.markerIdWithLocationSubscription["sub"]!.listen((loc) {
        updateMarkerLocationById(
            loc, widget.markerIdWithLocationSubscription["id"]);
        updateCameraLocation(new LatLng(loc.latitude, loc.longitude),
            widget.boundsDestination, _controller);
      });

      updateCameraLocation(
          widget.boundsSource, widget.boundsDestination, _controller);
      setState(() {});
    } else {
      updateCameraLocation(
          widget.boundsSource, widget.boundsDestination, _controller);
      setState(() {});
    }
  }

  GoogleMapController? _controller;

  void updateMarkerLocationById(LocationData newLocalData, String id) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    int i = widget._cMarkers.indexWhere((element) => element.id == id);
    if (i != -1) {
      widget._cMarkers[
              widget._cMarkers.indexWhere((element) => element.id == id)] =
          new CustomMarker(id, latlng, widget._cMarkers[i].icon);
      this._updateMarkers();
    }
  }

  @override
  void dispose() {
    if (widget.markerIdWithLocationSubscription["sub"] != null) {
      widget.markerIdWithLocationSubscription["sub"]!.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.all(20),
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      minMaxZoomPreference: MinMaxZoomPreference(1, 20),
      buildingsEnabled: false,
      markers: markers,
      polylines: widget.polylines,
      zoomControlsEnabled: false,
      compassEnabled: false,
      mapType: MapType.normal,
      tiltGesturesEnabled: true,
      initialCameraPosition: CameraPosition(
          target: widget.initialLocation,
          tilt: 9.440717697143555,
          zoom: 5.151926040649414),
      onMapCreated: (GoogleMapController _gController) async {
        await _gController.setMapStyle(GetStorage().read('map_style'));
        _controller = _gController;
        await _gController.animateCamera(CameraUpdate.newLatLngBounds(
            _createBounds(<LatLng>[widget.boundsSource, widget.boundsSource]),
            120));
        await updateCameraLocation(
          widget.boundsSource,
          widget.boundsDestination,
          _controller,
        );

        Completer<GoogleMapController>().complete(_gController);
      },
    );
  }
}
