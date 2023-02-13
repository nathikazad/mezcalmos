import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart'
    as LocationModel;
import 'package:mezcalmos/Shared/widgets/MezSmartPointer.dart';
import 'package:sizer/sizer.dart';

class MGoogleMap extends StatefulWidget {
  final MapHelper.LocationChangesNotifier? notifyParentOfNewLocation;

  // LatLng initialLocation;
  final Duration rerenderDuration;
  final String? debugString;
  final MGoogleMapController mGoogleMapController;
  final double recenterBtnBottomPadding;
  final EdgeInsets padding;

  const MGoogleMap({
    Key? key,
    this.padding = const EdgeInsets.only(top: 80, bottom: 50),
    this.notifyParentOfNewLocation,
    this.recenterBtnBottomPadding = 100,
    this.debugString,

    // this.mGoogleMapController,

    // this.periodicRerenderingis.debugString,
    this.rerenderDuration = const Duration(seconds: 2),
    required this.mGoogleMapController,
  }) : super(key: key);

  @override
  State<MGoogleMap> createState() => MGoogleMapState();
}

class MGoogleMapState extends State<MGoogleMap> {
  /// _reRenderingTimer
  Timer? _reRenderingTimer;
  Completer<GoogleMapController> _completer = Completer<GoogleMapController>();
  double? lastZoomSnapshot;

  @override
  void didUpdateWidget(MGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.mGoogleMapController.periodicRerendering.value == false) {
      widget.mGoogleMapController.animateAndUpdateBounds();
    }
  }

  @override
  void initState() {
    super.initState();
    // one time polylines LatLng points extraction.
    widget.mGoogleMapController.animateAndUpdateBounds();
    // attach Callback onResume to avoid Map going black in some devices after going back from background to foreGround.
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      widget.mGoogleMapController.controller.value?.setMapStyle(mezMapStyle);
    });

    _shouldRerenderOrNot(widget.mGoogleMapController.periodicRerendering.value);

    /// control our re-rendring Separately;
    /// using distinct here to not keep track of last snapshot.
    widget.mGoogleMapController.periodicRerendering.stream
        .distinct()
        .listen((bool _shouldRerender) {
      _shouldRerenderOrNot(_shouldRerender);
    });
  }

  @override
  void dispose() {
    _reRenderingTimer?.cancel();
    _reRenderingTimer = null;
    // gmapControlelr disposing.
    widget.mGoogleMapController.controller.value?.dispose();
    widget.mGoogleMapController.controller.value = null;
    mezDbgPrint(
        "MGoogleMap - Disposed { controller:${widget.mGoogleMapController.controller} | _reRenderingTimer:$_reRenderingTimer } !!!");

    super.dispose();
  }

  void _shouldRerenderOrNot(bool _shouldRerender) {
    if (_shouldRerender) {
      widget.mGoogleMapController.animateAndUpdateBounds();
      // start new timer.
      _reRenderingTimer = Timer.periodic(widget.rerenderDuration, (_) {
        if (_reRenderingTimer == null) {
          _.cancel();
          return;
        }
        widget.mGoogleMapController.animateAndUpdateBounds();
      });
    } else {
      _reRenderingTimer?.cancel();
      _reRenderingTimer = null;
    }
  }

  Future<LocationData?> _currentLocation() async {
    LocationData? currentLocation;
    try {
      currentLocation = await Location().getLocation();
      widget.notifyParentOfNewLocation?.call(
        LocationModel.MezLocation.fromFirebaseData(
          <String, dynamic>{
            "lat": currentLocation.latitude,
            "lng": currentLocation.longitude,
            "address": ""
          },
        ),
      );
    } on Exception {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: <Widget>[
            if (widget.mGoogleMapController.location.value != null)
              MGoogleMapGestures(
                mGoogleController: widget.mGoogleMapController,
                child: GoogleMap(
                  onTap: (_) {
                    widget.mGoogleMapController.onMapTap?.call();
                  },
                  padding: widget.padding,
                  mapToolbarEnabled: false,
                  // gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  //   new Factory<OneSequenceGestureRecognizer>(
                  //     () => new EagerGestureRecognizer(),
                  //   ),
                  // ].toSet(),
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(() {
                      mezDbgPrint(
                          "Pan gesture is enabled ==================> $PanGestureRecognizer()");
                      return PanGestureRecognizer();
                    })),
                  minMaxZoomPreference:
                      widget.mGoogleMapController.getMapMinMaxZommPrefs(),
                  onCameraMove: (CameraPosition camMove) {
                    if (lastZoomSnapshot != camMove.zoom) {
                      lastZoomSnapshot = camMove.zoom;
                      // make sure to not call heavy callbacks that do a lot of operations
                      // cuz this is invoked once per frame, ofc if the zoom changes.
                      widget.mGoogleMapController.onZoomChange(camMove.zoom);
                      widget.mGoogleMapController
                          .updateMarkersIconOnZoomChange(zoom: camMove.zoom);
                    }
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
                          .toLatLng()!,
                      tilt: 9.440717697143555,
                      zoom: 5.151926040649414),
                  onMapCreated: (GoogleMapController _gController) async {
                    mezDbgPrint(
                        "\n\n\n\n\n o n   m a p   c r e a t e d !\n\n\n\n\n\n");
                    widget.mGoogleMapController.controller.value = _gController;
                    await _gController.setMapStyle(mezMapStyle);
                    await widget.mGoogleMapController.animateAndUpdateBounds();
                    _completer.complete(_gController);
                    // Executing Callback that is depending on [widget.mGoogleMapController.controller].
                  },
                ),
              ).detector,
            if (widget.mGoogleMapController.recenterButtonEnabled.value)
              recenterButton(),
            if (widget.mGoogleMapController.myLocationButtonEnabled.value)
              locateMeButton()
          ],
        );
      },
    );
  }

  Positioned locateMeButton() {
    return Positioned(
      right: 10,
      bottom: 10,
      child: InkWell(
        onTap: () async {
          final LocationData? _tmpCurrentLoc = await _currentLocation();
          if (_tmpCurrentLoc != null) {
            await widget.mGoogleMapController.controller.value?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    _tmpCurrentLoc.latitude!,
                    _tmpCurrentLoc.longitude!,
                  ),
                ),
              ),
            );
          }
        },
        child: Container(
          height: 10.w,
          width: 10.w,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 8, color: Colors.black38, spreadRadius: 1)
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
    );
  }

  Positioned recenterButton() {
    return Positioned(
      left: 12,
      bottom: widget.recenterBtnBottomPadding,
      child: InkWell(
        onTap: () {
          widget.mGoogleMapController.lockInAutoZoomAnimation();
        },
        child: Container(
          padding: EdgeInsets.all(5),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 8, color: Colors.black38, spreadRadius: 1)
            ],
          ),
          child: Center(
            child: Icon(
              Icons.my_location_sharp,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}

class MGoogleMapGestures extends MezSmartPointer {
  final MGoogleMapController mGoogleController;

  MGoogleMapGestures({
    required Widget child,
    required this.mGoogleController,
  }) : super(child: child);

  @override
  void onDoubleTap() {
    if (mGoogleController.enableMezSmartPointer) {
      mGoogleController.unlockAutoZoomAnimation();
      mGoogleController.controller.value?.animateCamera(CameraUpdate.zoomIn());
    }
  }

  @override
  void onLongPress() {
    // leaving these here for refrences
    // We can do something here in future upon longpresses.
  }

  @override
  void onMove() {
    if (mGoogleController.enableMezSmartPointer) {
      // this beasically upon right and Left movements
      mGoogleController.unlockAutoZoomAnimation();
    }
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }
}
