import 'dart:async';
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
  RxList<Marker> markers;
  Map<String, Stream<LocationData>> idWithSubscription;
  String parentName;
  MGoogleMap(
    this.markers,
    this.initialLocation,
    this.parentName, {
    this.polylines = const <Polyline>{},
    this.bounds,
    this.idWithSubscription = const {},
  }) {
    mezDbgPrint("MGoogleMap cosntructor ${this.hashCode} ${this.parentName}");
  }
  @override
  State<MGoogleMap> createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> with MezDisposable {
  GoogleMapController? _controller;
  Completer<GoogleMapController> _completer = Completer();

  // LatLng getMapCenter()
  // {

  // }

  void animateAndUpdateBounds() {
    mezDbgPrint("MGoogleMap animateAndUpdateBounds ${this.hashCode}");
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

    setState(() {
      if (_bnds.isNotEmpty) widget.bounds = createMapBounds(_bnds);
    });

    if (_controller != null && widget.bounds != null) {
      _controller
          ?.animateCamera(CameraUpdate.newLatLngBounds(widget.bounds!, 100));
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
    mezDbgPrint(
        "MGoogleMap didUpdateWidget ${this.hashCode} ${widget.parentName}");
    animateAndUpdateBounds();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    mezDbgPrint("MGoogleMap initstate ${this.hashCode} ${widget.parentName}");
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      _controller?.setMapStyle(json.encode(mapStyle));
    });
    animateAndUpdateBounds();

    // widget.idWithSubscription.forEach((markerId, stream) {
    //   stream.listen((newLoc) {
    //     int i = widget.markers
    //         .indexWhere((element) => element.markerId.value == markerId);
    //     setState(() {
    //       mezDbgPrint(
    //           "Inside MgoogleMap::widget.idWithSubscription::listener :: marker id -> ${widget.markers[i].markerId.value}");
    //       widget.markers[i] = Marker(
    //           markerId: MarkerId(markerId),
    //           icon: widget.markers[i].icon,
    //           position: LatLng(newLoc.latitude!, newLoc.longitude!));
    //     });
    //   }).canceledBy(this);
    // });

    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint("MGoogleMap disposed ${this.hashCode} ${widget.parentName}");
    // favoid keeping listeners in memory.
    // cancelSubscriptions();
    // gmapControlelr disposing.
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Inside MGoogleMap build ${this.hashCode} ${widget.parentName}");
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
