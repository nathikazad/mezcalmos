import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class MGoogleMap extends StatefulWidget with MezDisposable {
  // List<CustomMarker> customMarkers;
  LatLng initialLocation;
  Set<Polyline> polylines;
  LatLngBounds? bounds;
  RxList<Marker> markers;
  Map<String, Stream<LocationData>> idWithSubscription;

  MGoogleMap(
    this.markers,
    this.initialLocation, {
    this.polylines = const <Polyline>{},
    this.bounds,
    this.idWithSubscription = const {},
  });

  @override
  State<StatefulWidget> createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> with MezDisposable {
  GoogleMapController? _controller;
  Completer<GoogleMapController> _completer = Completer();

  // LatLng getMapCenter()
  // {

  // }

  void updateMarkers() {
    List<LatLng> _bnds = [];

    widget.markers.forEach((cmarker) {
      _bnds.add(cmarker.position);
    });

    /* basically means :
    *
    *   if all markers have fitInBounds = false  (we don't care about them in the fitBounds)
    *   or all markers have firBounds = true  (We have to show all of them in the fitbounds)
    *   then we will include the Polyline's Bounds , 
    *   else we will just fit the markers with fitInBounds = True.
    *
    */

    if (_bnds.isEmpty) {
      _bnds.addAll(_getLatLngBoundsFromPolyline(widget.polylines));
    }

    if (mounted) {
      setState(() {
        if (_bnds.isNotEmpty) widget.bounds = createMapBounds(_bnds);
        if (_controller != null && widget.bounds != null) {
          _controller?.animateCamera(
              CameraUpdate.newLatLngBounds(widget.bounds!, 100));
        }
      });
    }
  }

  List<LatLng> _getLatLngBoundsFromPolyline(Set<Polyline> p) {
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
  }

  @override
  void didUpdateWidget(covariant MGoogleMap oldWidget) {
    updateMarkers();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    updateMarkers();

    widget.idWithSubscription.forEach((markerId, stream) {
      stream.listen((newLoc) {
        setState(() {
          int i = widget.markers
              .indexWhere((element) => element.markerId.value == markerId);
          widget.markers[i] = Marker(
              markerId: MarkerId(markerId),
              icon: widget.markers[i].icon,
              position: LatLng(newLoc.latitude!, newLoc.longitude!));
        });
      }).canceledBy(this);
    });

    super.initState();
  }

  @override
  void dispose() {
    // favoid keeping listeners in memory.
    cancelSubscriptions();
    // gmapControlelr disposing.
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.markers.isNotEmpty
        ? GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            // minMaxZoomPreference: MinMaxZoomPreference(10, 30),
            buildingsEnabled: false,
            markers: Set<Marker>.from(widget.markers),
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

              if (widget.bounds != null && _controller != null) {
                await _controller!.animateCamera(
                    CameraUpdate.newLatLngBounds(widget.bounds!, 100));
              }
              _completer.complete(_gController);
            },
          )
        : Center(
            child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Transform.scale(scale: .8, child: MezLogoAnimation())),
          );
  }
}
