import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class MGoogleMap extends StatefulWidget with MezDisposable {
  // List<CustomMarker> customMarkers;
  LatLng initialLocation;
  Set<Polyline> polylines;
  LatLngBounds? bounds;
  List<Marker> markers;
  Map<String, Stream<LocationData>> idWithSubscription;
  String debugString;
  MGoogleMap(
    this.markers,
    this.initialLocation, {
    this.debugString = "",
    this.polylines = const <Polyline>{},
    this.bounds,
    this.idWithSubscription = const {},
  }) {
    mezDbgPrint("MGoogleMap cosntructor ${this.hashCode} ${this.debugString}");
  }
  @override
  State<MGoogleMap> createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> with MezDisposable {
  GoogleMapController? _controller;
  Completer<GoogleMapController> _completer = Completer();
  // to make sure each marker gets fully handled when the new data comes on it's corresponding stream!
  List<String> _markersCurrentlyBeingUpdated = <String>[];

// Cheker -> Animate first and Double check if the bounds fit well the MapScreen
  Future<void> _boundsReChecker(CameraUpdate u) async {
    _controller?.animateCamera(u);
    _controller?.animateCamera(u);
    LatLngBounds? l1 = await _controller?.getVisibleRegion();
    LatLngBounds? l2 = await _controller?.getVisibleRegion();
    if (l1 != null && l2 != null) {
      print(l1.toString());
      print(l2.toString());
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
        await _boundsReChecker(u);
    }
  }

  // Animate the camera using widget.bounds
  Future<void> _animateCameraWithNewBounds(LatLngBounds? _bounds) async {
    if (_controller != null && _bounds != null) {
      CameraUpdate _camUpdate = CameraUpdate.newLatLngBounds(_bounds, 80);

      await _controller?.animateCamera(_camUpdate);
      await _boundsReChecker(_camUpdate);
    }
  }

  // Calculate bounds from the polyline's List of LatLng
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

  LatLngBounds? _getMarkersAndPolylinesBounds() {
    List<LatLng> _bnds = [];

    widget.markers.forEach((cmarker) {
      _bnds.add(cmarker.position);
    });

    if (widget.polylines.isNotEmpty) {
      _bnds.addAll(_getLatLngBoundsFromPolyline(widget.polylines));
    }

    return _bnds.isEmpty ? null : createMapBounds(_bnds);
  }

  // main function for updating the bounds and start the animation
  Future<void> animateAndUpdateBounds() async {
    LatLngBounds? _polyMarkersBounds = _getMarkersAndPolylinesBounds();
    if (_polyMarkersBounds != null) {
      setState(() {
        widget.bounds = _polyMarkersBounds;
      });
      await _animateCameraWithNewBounds(widget.bounds);
    }
  }

  // @override
  // void didUpdateWidget(covariant MGoogleMap oldWidget) async {
  //   mezDbgPrint(
  //       "MGoogleMap didUpdateWidget ${this.hashCode} ${widget.debugString}");
  //   await animateAndUpdateBounds();
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void initState() {
    super.initState();

    mezDbgPrint("MGoogleMap initstate ${this.hashCode} ${widget.debugString}");
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      _controller?.setMapStyle(json.encode(mapStyle));
    });
    animateAndUpdateBounds();

    widget.idWithSubscription.forEach((markerId, stream) {
      stream.listen((newLoc) {
        if (!_markersCurrentlyBeingUpdated.contains(markerId)) {
          _markersCurrentlyBeingUpdated.add(markerId);
          int i = widget.markers
              .indexWhere((element) => element.markerId.value == markerId);
          setState(() {
            mezDbgPrint(
                "Inside MgoogleMap::widget.idWithSubscription::listener :: marker id -> ${widget.markers[i].markerId.value}");
            widget.markers[i] = Marker(
                markerId: MarkerId(markerId),
                icon: widget.markers[i].icon,
                position: LatLng(newLoc.latitude!, newLoc.longitude!));

            _markersCurrentlyBeingUpdated.remove(markerId);
          });

          LatLngBounds? _bounds = _getMarkersAndPolylinesBounds();
          if (_bounds != null) {
            _animateCameraWithNewBounds(_bounds);
          }
        }
        // we skip if that markerId is already being handled .
      }).canceledBy(this);
    });
  }

  @override
  void dispose() {
    mezDbgPrint("MGoogleMap disposed ${this.hashCode} ${widget.debugString}");
    // favoid keeping listeners in memory.
    cancelSubscriptions();
    // gmapControlelr disposing.
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Inside MGoogleMap build ${this.hashCode} ${widget.debugString}");
    // mezDbgPrint(widget.markers.)
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
              await _gController.setMapStyle(json.encode(mapStyle));
              print("onMapCreated");
              print(widget.bounds?.toJson());
              _controller = _gController;
              await _animateCameraWithNewBounds(widget.bounds);

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

List<Map<String, dynamic>> mapStyle = [
  {
    "featureType": "all",
    "elementType": "geometry.fill",
    "stylers": [
      {"weight": "2.00"}
    ]
  },
  {
    "featureType": "all",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#9c9c9c"}
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.text",
    "stylers": [
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "all",
    "stylers": [
      {"color": "#f2f2f2"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "all",
    "stylers": [
      {"saturation": -100},
      {"lightness": 45}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#eeeeee"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#7b7b7b"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "all",
    "stylers": [
      {"visibility": "simplified"}
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.icon",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "transit",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "all",
    "stylers": [
      {"color": "#46bcec"},
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#c8d7d4"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#070707"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#ffffff"}
    ]
  }
];
