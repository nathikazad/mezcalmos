import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/models/Location.dart' as LocationModel;

class MGoogleMap extends StatefulWidget {
  final MapHelper.LocationChangesNotifier? notifyParentOfNewLocation;
  // LatLng initialLocation;
  final Duration rerenderDuration;
  final String? debugString;
  final MGoogleMapController mGoogleMapController;
  // this is used when we don't want to re-render the map periodically.
  final bool periodicRerendering;
  final bool myLocationButtonEnabled;
  MGoogleMap(
      {Key? key,
      this.notifyParentOfNewLocation,
      this.periodicRerendering = true,
      this.myLocationButtonEnabled = false,
      // required this.initialLocation,
      this.debugString,
      this.rerenderDuration = const Duration(seconds: 2),
      required this.mGoogleMapController})
      : super(key: key);

  @override
  State<MGoogleMap> createState() => MGoogleMapState();
}

class MGoogleMapState extends State<MGoogleMap> {
  Timer? _reRenderingTimer;
  Completer<GoogleMapController> _completer = Completer();
  // to make sure each marker gets fully handled when the new data comes on it's corresponding stream!
  MGoogleMapState();

  @override
  void didUpdateWidget(MGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    mezDbgPrint(
        "MGoogleMap didUpdateWidget ${this.hashCode} ${widget.debugString}");
    widget.mGoogleMapController.animateAndUpdateBounds();
  }

  @override
  void initState() {
    super.initState();
    mezDbgPrint("MGoogleMap initstate ${this.hashCode} ${widget.debugString}");
    // one time polylines LatLng points extraction.
    widget.mGoogleMapController.animateAndUpdateBounds();
    // attach Callback onResume to avoid Map going black in some devices after going back from background to foreGround.
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      widget.mGoogleMapController.controller?.setMapStyle(mezMapStyle);
    });
    // control our re-rendring Separately;
    _reRenderingTimer = widget.periodicRerendering
        ? Timer.periodic(widget.rerenderDuration, (_) {
            // mezDbgPrint("MGOOGLEMAP ---> RE REN D R ING!");
            widget.mGoogleMapController.animateAndUpdateBounds();
          })
        : null;
  }

  @override
  void dispose() {
    mezDbgPrint("MGoogleMap disposed $hashCode ${widget.debugString}");
    _reRenderingTimer?.cancel();
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

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Inside MGoogleMap build $hashCode ${widget.debugString}");

    return Stack(
      children: [
        Obx(
          () => widget.mGoogleMapController.location.value != null
              ? GoogleMap(
                  onTap: (_) {
                    widget.mGoogleMapController.onMapTap?.call();
                  },
                  padding: EdgeInsets.all(20),
                  mapToolbarEnabled: false,
                  minMaxZoomPreference:
                      widget.mGoogleMapController.getMapMinMaxZommPrefs(),
                  onCameraMove: (camMove) {
                    widget.mGoogleMapController
                        .updateMarkersIconOnZoomChange(zoom: camMove.zoom);
                  },
                  myLocationButtonEnabled: false,
                  buildingsEnabled: false,
                  markers: widget.mGoogleMapController.markers.toSet(),
                  polylines: widget.mGoogleMapController.polylines,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  mapType: MapType.normal,
                  tiltGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: widget.mGoogleMapController.location.value!
                          .toLatLng(),
                      tilt: 9.440717697143555,
                      zoom: 5.151926040649414),
                  onMapCreated: (GoogleMapController _gController) async {
                    mezDbgPrint(
                        "\n\n\n\n\n o n   m a p   c r e a t e d !\n\n\n\n\n\n");
                    widget.mGoogleMapController.controller = _gController;
                    await _gController.setMapStyle(mezMapStyle);
                    await widget.mGoogleMapController.animateAndUpdateBounds();
                    _completer.complete(_gController);
                  },
                )
              : SizedBox(),
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
                    height: 10.sp,
                    width: 10.sp,
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
