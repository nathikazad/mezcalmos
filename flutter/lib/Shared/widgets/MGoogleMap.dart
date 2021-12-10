import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart' as LocationModel;
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class MGoogleMapController {
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<Marker> markers = <Marker>[].obs;
  Rxn<LocationModel.Location> location = Rxn();
  RxBool _animateMarkersPolyLinesBounds = false.obs;
  GoogleMapController? controller;

  Future<void> addCircleMarker(String markerId, LatLng latLng) async {
    markers.removeWhere((element) => element.markerId.value == markerId);
    markers.add(Marker(
        markerId: MarkerId(markerId),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), aPurpleLocationCircle),
        flat: true,
        position: latLng));
  }

  Future<void> addOrUpdateUserMarker(String markerId, LatLng latLng) async {
    BitmapDescriptor icon = await BitmapDescriptorLoader(
        (await cropRonded((await http.get(Uri.parse(
                Get.find<AuthController>().user!.image ?? aDefaultAvatar)))
            .bodyBytes) as Uint8List),
        60,
        60,
        isBytes: true);
    markerId = markerId;

    this._addOrUpdateMarker(
        Marker(markerId: MarkerId(markerId), icon: icon, position: latLng));
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
    this.removeMarker(id);
  }

  void decodeAndAddPolyline({required String encodedPolylineString}) {
    this.addPolyline(MapHelper.loadUpPolyline(encodedPolylineString)
        .map<PointLatLng>((e) => PointLatLng(e.latitude, e.longitude))
        .toList());
  }

  // base internal function
  void _addOrUpdateMarker(Marker marker) {
    markers.removeWhere(
        (element) => element.markerId.value == marker.markerId.value);
    markers.add(marker);
  }

  void removeMarker(String markerId) {
    markers.removeWhere((element) => element.markerId.value == markerId);
  }

  void addPolyline(List<PointLatLng> latLngPoints) {
    polylines.add(Polyline(
        color: Color.fromARGB(255, 172, 89, 252),
        jointType: JointType.round,
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('_poly_'),
        visible: true,
        points: latLngPoints
            .map<LatLng>((e) => LatLng(e.latitude, e.longitude))
            .toList()));

    this._animateMarkersPolyLinesBounds.value = true;
  }

  void clearPolyline() {
    polylines.clear();
  }

  void setAnimateMarkersPolyLinesBounds(bool value) {
    this._animateMarkersPolyLinesBounds.value = value;
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
}

class MGoogleMap extends StatefulWidget with MezDisposable {
  final MapHelper.LocationChangesNotifier? notifyParentOfNewLocation;
  LatLng initialLocation;
  Map<String, Stream<LocationData>> idWithSubscription;
  Duration rerenderDuration;
  String debugString;
  final MGoogleMapController mGoogleMapController;
  // this is used when we don't want to re-render the map periodically.
  bool periodicRedrendring;
  bool myLocationButtonEnabled;
  MGoogleMap(
      {Key? key,
      this.notifyParentOfNewLocation,
      this.periodicRedrendring = true,
      this.myLocationButtonEnabled = false,
      required this.initialLocation,
      this.rerenderDuration = const Duration(seconds: 2),
      this.debugString = "",
      this.idWithSubscription = const {},
      required this.mGoogleMapController})
      : super(key: key);

  @override
  State<MGoogleMap> createState() => MGoogleMapState();
}

class MGoogleMapState extends State<MGoogleMap> with MezDisposable {
  Timer? _reRendringTimer;
  Completer<GoogleMapController> _completer = Completer();
  List<LatLng> _polylinesLatLngBounds = [];
  // to make sure each marker gets fully handled when the new data comes on it's corresponding stream!
  List<String> _markersCurrentlyBeingUpdated = <String>[];
  // Set<Polyline> polylines = <Polyline>{};
  // List<Marker> markers = <Marker>[];
  // bool animateMarkersPolyLinesBounds = false;
  MGoogleMapState();

// Cheker -> Animate first and Double check if the bounds fit well the MapScreen
  Future<void> _boundsReChecker(CameraUpdate u) async {
    widget.mGoogleMapController.controller?.animateCamera(u);
    widget.mGoogleMapController.controller?.animateCamera(u);
    LatLngBounds? l1 =
        await widget.mGoogleMapController.controller?.getVisibleRegion();
    LatLngBounds? l2 =
        await widget.mGoogleMapController.controller?.getVisibleRegion();
    if (l1 != null && l2 != null) {
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
        await _boundsReChecker(u);
    }
  }

  // Animate the camera using widget.bounds
  Future<void> _animateCameraWithNewBounds(LatLngBounds? _bounds) async {
    if (widget.mGoogleMapController.controller != null && _bounds != null) {
      CameraUpdate _camUpdate = CameraUpdate.newLatLngBounds(_bounds, 100.sp);
      await widget.mGoogleMapController.controller!.animateCamera(_camUpdate);
      await _boundsReChecker(_camUpdate);
    }
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

  // adds up the markers the new markers latLn ot polyline's and calculate out of them all the latLngbounds
  LatLngBounds? _getMarkersAndPolylinesBounds() {
    List<LatLng> _bnds = [..._polylinesLatLngBounds];
    widget.mGoogleMapController.markers.forEach((cmarker) {
      _bnds.add(cmarker.position);
    });
    return _bnds.isEmpty ? null : MapHelper.createMapBounds(_bnds);
  }

  // main function for updating the bounds and start the animation
  Future<void> animateAndUpdateBounds() async {
    LatLngBounds? _polyMarkersBounds =
        widget.mGoogleMapController._animateMarkersPolyLinesBounds.value
            ? _getMarkersAndPolylinesBounds()
            : null;
    if (_polyMarkersBounds != null) {
      await _animateCameraWithNewBounds(_polyMarkersBounds);
    }
  }

  Future<void> moveToNewLatLng(double lat, double lng) async {
    await widget.mGoogleMapController.controller
        ?.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
  }

  @override
  void didUpdateWidget(MGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    mezDbgPrint(
        "MGoogleMap didUpdateWidget ${this.hashCode} ${widget.debugString}");
    animateAndUpdateBounds();
  }

  @override
  void initState() {
    super.initState();
    mezDbgPrint("MGoogleMap initstate ${this.hashCode} ${widget.debugString}");
    // one time polylines LatLng points extraction.
    _polylinesLatLngBounds =
        _getLatLngBoundsFromPolyline(widget.mGoogleMapController.polylines);
    animateAndUpdateBounds();
    // attach Callback onResume to avoid Map going black in some devices after going back from background to foreGround.
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      widget.mGoogleMapController.controller?.setMapStyle(mezMapStyle);
    });
    // control our re-rendring Separately;
    _reRendringTimer = widget.periodicRedrendring
        ? Timer.periodic(widget.rerenderDuration, (_) {
            mezDbgPrint("MGOOGLEMAP ---> RE REN D R ING!");
            animateAndUpdateBounds();
          })
        : null;

    widget.idWithSubscription.forEach((markerId, stream) {
      stream.listen((newLoc) {
        if (!_markersCurrentlyBeingUpdated.contains(markerId)) {
          mezDbgPrint("N E W    L O C A T I O N");
          _markersCurrentlyBeingUpdated.add(markerId);
          int i = widget.mGoogleMapController.markers
              .indexWhere((element) => element.markerId.value == markerId);
          mezDbgPrint(
              "Inside MgoogleMap::widget.idWithSubscription::listener :: marker id -> ${widget.mGoogleMapController.markers[i].markerId.value}");
          this.setState(() {
            widget.mGoogleMapController.markers[i] = Marker(
                markerId: MarkerId(markerId),
                icon: widget.mGoogleMapController.markers[i].icon,
                position: LatLng(newLoc.latitude!, newLoc.longitude!));
          });
          _markersCurrentlyBeingUpdated.remove(markerId);
          // animateAndUpdateBounds();
          mezDbgPrint(" E N D  -  L O C A T I O N");
        }
        // we skip if that markerId is already being handled .
      }).canceledBy(this);
    });
  }

  @override
  void dispose() {
    mezDbgPrint("MGoogleMap disposed ${this.hashCode} ${widget.debugString}");
    _reRendringTimer?.cancel();
    // favoid keeping listeners in memory.
    cancelSubscriptions();
    // gmapControlelr disposing.
    widget.mGoogleMapController.controller?.dispose();
    widget.mGoogleMapController.controller = null;
    super.dispose();
  }

  Future<LocationData?> _currentLocation() async {
    LocationData? currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
      widget.notifyParentOfNewLocation?.call(
        LocationModel.Location.fromFirebaseData({
          "lat": currentLocation.latitude,
          "lng": currentLocation.longitude,
          "address": ""
        }),
      );
    } on Exception {
      currentLocation = null;
    }
    return currentLocation;
  }

  bool userTaped = false;
  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Inside MGoogleMap build ${this.hashCode} ${widget.debugString}");
    responsiveSize(context);
    return Stack(
      children: [
        Obx(
          () => GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            minMaxZoomPreference:
                widget.mGoogleMapController.polylines.isNotEmpty
                    ? MinMaxZoomPreference.unbounded
                    : MinMaxZoomPreference(16, 17),
            myLocationButtonEnabled: false,
            buildingsEnabled: false,
            markers: widget.mGoogleMapController.markers.toSet(),
            polylines: widget.mGoogleMapController.polylines,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                target: widget.initialLocation,
                tilt: 9.440717697143555,
                zoom: 5.151926040649414),
            onMapCreated: (GoogleMapController _gController) async {
              mezDbgPrint(
                  "\n\n\n\n\n o n   m a p   c r e a t e d !\n\n\n\n\n\n");
              widget.mGoogleMapController.controller = _gController;
              await _gController.setMapStyle(mezMapStyle);
              await animateAndUpdateBounds();
              _completer.complete(_gController);
            },
          ),
        ),
        // ),
        widget.myLocationButtonEnabled
            ? Positioned(
                right: 10,
                bottom: 10,
                child: InkWell(
                  onTap: () async {
                    LocationData? _tmpCurrentLoc = await _currentLocation();
                    if (_tmpCurrentLoc != null) {
                      widget.mGoogleMapController.controller
                          ?.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(_tmpCurrentLoc.latitude!,
                              _tmpCurrentLoc.longitude!),
                        ),
                      ));
                    }
                  },
                  child: Container(
                    height: 50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.black38,
                            spreadRadius: 1)
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.gps_fixed_rounded,
                        color: Color(0xffa8a8a8),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
