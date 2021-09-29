import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

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
    print("_updateMarkers ======= CALLED");
    List<LatLng> _bnds = [];
    List<Marker> _mrkrs = [];

    widget.customMarkers.forEach((cmarker) {
      // print("Bounds ==> ${cmarker.position} !!!!");
      // print("cmrkr::id ==> ${cmarker.id} !!!!");
      _bnds.add(cmarker.position);
      _mrkrs.add(cmarker.marker());
      print("Marker added => ${cmarker.id}");
    });
    setState(() {
      if (_bnds.isNotEmpty) widget.bounds = createMapBounds(_bnds);
      if (_mrkrs.isNotEmpty) widget.markers.assignAll(_mrkrs);
      if (_controller != null) {
        print("SETSTATE::Controller NOT NULL ========= ");
        _controller!
            .animateCamera(CameraUpdate.newLatLngBounds(widget.bounds!, 120));
      }
      // print("\n\n\n\n_updateMarkers::SetState ======= CALLED\n\n\n\n");
      // print("\n\n\n\nmarkers::len ======= ${markers.length}\n\n\n\n");
    });
  }

  @override
  void didUpdateWidget(covariant MGoogleMap oldWidget) {
    updateMarkers();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
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
    print(
        "Custom Markers ==============> len > ${widget.customMarkers.length}");
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
                    CameraUpdate.newLatLngBounds(widget.bounds!, 120));

              Completer<GoogleMapController>().complete(_gController);
            },
          )
        : Center(
            // child: Text(Random().nextInt(100).toString()),
            child: CircularProgressIndicator(),
          );
  }
}

// class MGoogleMap extends StatefulWidget {
//   List<CustomMarker> customMarkers;
//   LatLng initialLocation;
//   Set<Polyline> polylines;
//   LatLngBounds? bounds;

//   MGoogleMap(this.customMarkers, this.initialLocation,
//       {this.polylines = const <Polyline>{}, this.bounds});

//   @override
//   _MGoogleMapState createState() => _MGoogleMapState();
// }

// class _MGoogleMapState extends State<MGoogleMap> {
//   late StreamSubscription<List<CustomMarker>> markersSubscription;
//   Set<Marker> markers = <Marker>{};

//   void _updateMarkers() {
//     print("_updateMarkers ======= CALLED");
//     List<LatLng> _bnds = [];
//     List<Marker> _mrkrs = [];

//     widget.customMarkers.forEach((cmarker) {
//       // print("Bounds ==> ${cmarker.position} !!!!");
//       // print("cmrkr::id ==> ${cmarker.id} !!!!");
//       _bnds.add(cmarker.position);
//       _mrkrs.add(cmarker.marker());
//       print("Marker added => ${cmarker.id}");
//     });

//     widget.bounds = createMapBounds(_bnds);
//     markers.assignAll(_mrkrs);
//     // print("\n\n\n\n_updateMarkers::SetState ======= CALLED\n\n\n\n");
//     // print("\n\n\n\nmarkers::len ======= ${markers.length}\n\n\n\n");

//     if (_controller != null) {
//       _controller!
//           .animateCamera(CameraUpdate.newLatLngBounds(widget.bounds!, 120));
//     }
//   }
//   @override
//   void didUpdateWidget(MGoogleMap oldWidget) {
//     print(" \n\n\n[[[[[[[[[[[[[    didUpdateWidget    ]]]]]]]]]]]]]]]\n\n\n");

//     print(markers.length);
//     this._updateMarkers();
//     setState(() {});
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void initState() {
//     super.initState();

//   }

//   GoogleMapController? _controller;


//   @override
//   void dispose() {
//     markersSubscription.cancel();

//     super.dispose();
//   }

//   bool mapReady = false;

//   @override
//   Widget build(BuildContext context) {
//     print("[Gooooooooooogle map] markers ====> ${markers.length}");
//     print(
//         "[Gooooooooooogle map] cmarkers ====> ${widget.customMarkers.length}");
//     return markers.isNotEmpty
//         ? GoogleMap(
//             padding: EdgeInsets.all(20),
//             mapToolbarEnabled: false,
//             myLocationButtonEnabled: false,
//             minMaxZoomPreference: MinMaxZoomPreference(1, 20),
//             buildingsEnabled: false,
//             markers: markers,
//             // widget.customMarkers.map((element) => element.marker()).toSet(),
//             polylines: widget.polylines,
//             zoomControlsEnabled: false,
//             compassEnabled: false,
//             mapType: MapType.normal,
//             tiltGesturesEnabled: true,
//             initialCameraPosition: CameraPosition(
//                 target: widget.initialLocation,
//                 tilt: 9.440717697143555,
//                 zoom: 5.151926040649414),
//             onMapCreated: (GoogleMapController _gController) async {
//               await _gController.setMapStyle(GetStorage().read('map_style'));
//               _controller = _gController;

//               if (widget.bounds != null)
//                 await _gController.animateCamera(CameraUpdate.newLatLngBounds(
//                     widget.bounds!,
//                     // _createBounds(<LatLng>[widget.boundsSource, widget.boundsSource]),
//                     120));
//               // await updateCameraLocation(
//               //   widget.boundsSource,
//               //   widget.boundsDestination,
//               //   _controller,
//               // );

//               Completer<GoogleMapController>().complete(_gController);
//             },
//           )
//         : Center(
//             // child: Text(Random().nextInt(100).toString()),
//             child: CircularProgressIndicator(),
//           );
//   }
// }
