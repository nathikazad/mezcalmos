import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

typedef MezServicesMapViewCallBack = Future<List<MezMarker>> Function(
    LatLng? mapCenter, double distance);

class MezServicesMapView extends StatefulWidget {
  final Set<Marker> markers;
  final MezServicesMapViewCallBack fetchNewData;

  const MezServicesMapView({required this.markers, required this.fetchNewData});

  @override
  _MezServicesMapViewState createState() => _MezServicesMapViewState();
}

class _MezServicesMapViewState extends State<MezServicesMapView> {
  late MezServicesMapController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MezServicesMapController(widget.markers, widget.fetchNewData);
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MGoogleMap(
          mGoogleMapController: _controller.mGoogleMapController,
        ),
        if (_controller.showRefetchButton)
          Positioned(
            top: 5,
            child: MezButton(
              height: 60,
              width: 50.mezW,
              onClick: () async {
                await _controller.fetchData();
              },
              label: 'Fetch in this area',
            ),
          ),
      ],
    );
  }
}

class MezServicesMapController {
  final Set<Marker> markers;
  final MezServicesMapViewCallBack fetchNewData;
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  Rxn<LatLng> _currentLocation = Rxn();
  RxBool _showRefetchButton = RxBool(true);
  bool get showRefetchButton => _showRefetchButton.value;

  MezServicesMapController(this.markers, this.fetchNewData);

  void init() {
    mezlog("init");

    mGoogleMapController.periodicRerendering.value = true;

    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      MezLocation(
        "",
        MezLocation.buildLocationData(
          15.862782,
          -97.07638,
        ),
      ),
    );

    mGoogleMapController.markers
        .addAll(markers.map((Marker e) => MezMarker(markerId: e.markerId)));
    mezlog(mGoogleMapController.markers.length);

    unawaited(locPkg.Location().getLocation().then((LocationData location) {
      mezlog(location);
      if (location.latitude != null && location.longitude != null)
        _currentLocation.value =
            LatLng(location.latitude!, location.longitude!);
      mezlog(_currentLocation.value!);
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
      mGoogleMapController.markers.addAll(newMarkers);
      mGoogleMapController.markers.value =
          mGoogleMapController.markers.toSet().toList();

      mezDbgPrint(
          "✅ markers in child component =====>${mGoogleMapController.markers.value.length}");
      _showRefetchButton.value = false;
    }
  }
}
