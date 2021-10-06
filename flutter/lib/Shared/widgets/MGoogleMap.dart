import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class MGoogleMap extends StatefulWidget {
  List<CustomMarker> customMarkers;
  LatLng initialLocation;
  Set<Polyline> polylines;
  LatLngBounds? bounds;
  Set<Marker> markers = <Marker>{};

  MGoogleMap(this.customMarkers, this.initialLocation,
      {this.polylines = const <Polyline>{}, this.bounds});

  @override
  State<StatefulWidget> createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> {
  GoogleMapController? _controller;

  void updateMarkers() {
    List<LatLng> _bnds = [];
    List<Marker> _mrkrs = [];

    widget.customMarkers.forEach((cmarker) {
      if (cmarker.fitInBounds) _bnds.add(cmarker.position);
      _mrkrs.add(cmarker.marker());
    });

    /* basically means :
    *   if all markers have fitInBounds = false  (we don't care about them in the fitBounds)
    *   or all markers have firBounds = true  (We have to show all of them in the fitbounds)
    *   then we will include the Polyline's Bounds , 
    *   else we will just fit the markers with fitInBounds = True.
    */

    if (_bnds.isEmpty || _bnds.length == _mrkrs.length) {
      _bnds.addAll(_getLatLngBoundsFromPolyline(widget.polylines));
    }
    setState(() {
      if (_bnds.isNotEmpty) widget.bounds = createMapBounds(_bnds);
      if (_mrkrs.isNotEmpty) {
        widget.markers.assignAll(_mrkrs);
      }

      if (_controller != null && widget.bounds != null) {
        _controller
            ?.animateCamera(CameraUpdate.newLatLngBounds(widget.bounds!, 100));
      }
    });
  }

  // in case we need it in future.
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
    mezDbgPrint("+ Init MGoogleMap :: called !");
    updateMarkers();

    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint("+ Dispose MGoogleMap :: called !");
    // favoid keeping listeners in memory.
    cancelMarkersSubs(widget.customMarkers);
    // gmapControlelr disposing.
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("+ build MGoogleMap :: called !");

    return widget.customMarkers.isNotEmpty
        ? GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            // minMaxZoomPreference: MinMaxZoomPreference(10, 30),
            buildingsEnabled: false,
            markers:
                widget.customMarkers.map((element) => element.marker()).toSet(),
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

              if (widget.bounds != null)
                await _gController.animateCamera(
                    CameraUpdate.newLatLngBounds(widget.bounds!, 100));

              Completer<GoogleMapController>().complete(_gController);
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
