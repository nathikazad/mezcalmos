import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["MezServicesMapView"];

typedef MezServicesMapViewCallBack = Future<List<Marker>> Function(
    LatLng? mapCenter, double distance);

class MezServicesMapView extends StatefulWidget {
  final Set<Marker> markers;
  final MezServicesMapViewCallBack fetchNewData;
  final MGoogleMapController mGoogleMapController;
  final List<Widget> children;

  const MezServicesMapView(
      {required this.markers,
      required this.fetchNewData,
      this.children = const [],
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
    mezDbgPrint("This is called..... ${widget.markers.length} ✅✅");
    if (widget.markers.isEmpty) {
      _controller.markers.clear();
      _controller.mGoogleMapController.clearMarkers();
    } else {
      _controller.fillInMarkers(widget.markers.toList());
    }
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
          if (_controller.showRefetchButton &&
              _controller.mGoogleMapController.isMapReady)
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
                  label: "${_i18n()['fetch']}"),
            ),
          if (widget.children.isNotEmpty &&
              _controller.mGoogleMapController.isMapReady)
            ...widget.children
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
    mGoogleMapController.recenterButtonEnabled.value = true;

    unawaited(await Get.find<LocationController>()
        .getCurrentLocation()
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
      return null;
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
      List<Marker> newMarkers = await fetchNewData(mapCenter, distance);
      fillInMarkers(newMarkers);

      mezDbgPrint(
          "✅ markers in child component =====>${mGoogleMapController.markers.value.length}");
      _showRefetchButton.value = false;
    }
  }

  void fillInMarkers(List<Marker> newMarkers) {
    mezDbgPrint("👊new markers ========>${newMarkers.length}");

    List<MezMarker> newMarkersToAdd = [];

    for (Marker newMarker in newMarkers) {
      // if (newMarkersToAdd.length >= 10) {
      //   break;
      // }

      final bool markerExists = mGoogleMapController.markers.any(
          (MezMarker oldMarker) =>
              oldMarker.markerId.value == newMarker.markerId.value);

      if (!markerExists) {
        newMarkersToAdd.add(MezMarker(
          markerId: newMarker.markerId,
          icon: newMarker.icon,
          onTap: newMarker.onTap,
          anchor: newMarker.anchor,
          position: newMarker.position,
          consumeTapEvents: true,
        ));
      }
    }

    mGoogleMapController.markers.addAll(newMarkersToAdd);
  }
}
