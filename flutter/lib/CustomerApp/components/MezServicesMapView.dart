import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

typedef MezServicesMapViewCallBack = Future<List<MezMarker>> Function(
    LatLng? mapCenter, double distance);

class MezServicesMapView extends StatefulWidget {
  final Set<Marker> markers;
  final MezServicesMapViewCallBack fetchNewData;
  final MGoogleMapController mGoogleMapController;

  const MezServicesMapView(
      {required this.markers,
      required this.fetchNewData,
      required this.mGoogleMapController});

  @override
  _MezServicesMapViewState createState() => _MezServicesMapViewState();
}

class _MezServicesMapViewState extends State<MezServicesMapView> {
  late MezServicesMapController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MezServicesMapController(
        markers: widget.markers,
        fetchNewData: widget.fetchNewData,
        mGoogleMapController: widget.mGoogleMapController);
    _controller.init();
  }

  @override
  void didUpdateWidget(covariant MezServicesMapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.markers.addAll(widget.markers);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          MGoogleMap(
            mGoogleMapController: _controller.mGoogleMapController,
            zoomGesturesEnabled: true,
            onCameraMove: (CameraPosition p0) {
              _controller.onMapMove(p0);
            },
          ),
          if (_controller.showRefetchButton)
            Align(
              alignment: Alignment.topCenter,
              child: MezInkwell(
                borderRadius: 15,
                elevation: 1,
                margin: EdgeInsets.only(top: 10),
                width: 50.mezW,
                height: 40,
                backgroundColor: Colors.white,
                textColor: primaryBlueColor,
                onClick: () async {
                  await _controller.fetchData();
                },
                label: 'Fetch in this area',
              ),
            )
        ],
      ),
    );
  }
}

class MezServicesMapController {
  final Set<Marker> markers;
  final MezServicesMapViewCallBack fetchNewData;
  final MGoogleMapController mGoogleMapController;
  Rxn<LatLng> _currentLocation = Rxn();
  RxBool _showRefetchButton = RxBool(true);
  bool get showRefetchButton => _showRefetchButton.value;

  MezServicesMapController(
      {required this.markers,
      required this.fetchNewData,
      required this.mGoogleMapController});

  Future<void> init() async {
    mezlog("init");

    mGoogleMapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    mGoogleMapController.initialZoomLevel = 12;
    mGoogleMapController.periodicRerendering.value = false;
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;
    // mGoogleMapController.setZoomLvl(zoomLvl: 14.0);

    unawaited(locPkg.Location()
        .getLocation()
        .then((locPkg.LocationData locationData) {
      if (locationData.latitude != null && locationData.longitude != null) {
        _currentLocation.value =
            LatLng(locationData.latitude!, locationData.longitude!);
        mezlog("Current loc==================>${_currentLocation.value}");

        mGoogleMapController.setLocation(
          MezLocation(
            "",
            MezLocation.buildLocationData(
              _currentLocation.value!.latitude,
              _currentLocation.value!.longitude,
            ),
          ),
        );

        mGoogleMapController.markers
            .addAll(markers.map((Marker e) => MezMarker(markerId: e.markerId)));
      }
    }));
  }

  void onMapMove(CameraPosition position) {
    _showRefetchButton.value = true;
  }

  Future<void> fetchData() async {
    LatLng? mapCenter = await mGoogleMapController.getMapCenter();
    double? distance = calculateDistanceFromBounds(
        await mGoogleMapController.controller.value!.getVisibleRegion());

    mezlog("Fetch with new center ${mapCenter?.toJson()}");
    if (mapCenter != null) {
      List<MezMarker> newMarkers = await fetchNewData(mapCenter, distance);
      mezDbgPrint("👊new markers ========>${newMarkers.length}");

      // add new markers to markers in controller but only new ones check if dosent exist
      mGoogleMapController.markers.addAll(newMarkers
          .where((MezMarker newMarker) => !mGoogleMapController.markers.any(
              (MezMarker oldMarker) =>
                  oldMarker.markerId.value == newMarker.markerId.value))
          .map((MezMarker newMarker) => newMarker));
      mGoogleMapController.markers.value =
          mGoogleMapController.markers.toSet().toList();

      mezDbgPrint(
          "✅ markers in child component =====>${mGoogleMapController.markers.value.length}");
      _showRefetchButton.value = false;
    }
  }
}
