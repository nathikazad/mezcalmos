import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

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
      _bnds.add(cmarker.position);
      _mrkrs.add(cmarker.marker());
    });
    setState(() {
      if (_bnds.isNotEmpty) widget.bounds = createMapBounds(_bnds);
      if (_mrkrs.isNotEmpty) widget.markers.assignAll(_mrkrs);
      if (_controller != null) {
        _controller!
            .animateCamera(CameraUpdate.newLatLngBounds(widget.bounds!, 160));
      }
    });
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
    widget.customMarkers.forEach((element) => element.cancelSub());
    super.dispose();
  }

  bool mapReady = false;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("+ build MGoogleMap :: called !");

    return widget.customMarkers.isNotEmpty
        ? GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(1, 20),
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
                    CameraUpdate.newLatLngBounds(widget.bounds!, 160));

              Completer<GoogleMapController>().complete(_gController);
            },
          )
        : Center(
            // child: Text(Random().nextInt(100).toString()),
            child: CircularProgressIndicator(),
          );
  }
}
