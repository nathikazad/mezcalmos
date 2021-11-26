import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart' as GeoLoc;

class MezPickGoogleMapController {
  void Function()? showBlackScreen;
  void Function()? showFakeMarker;
  void Function(LatLng newLocation)? setLocation;
}

class MezPickGoogleMap extends StatefulWidget {
  final LocationChangesNotifier notifyParent;
  double blackScreenBottomTextMargin;
  List<Marker> markers;
  Set<Polyline> polylines;
  bool myLocationButtonEnabled;
  bool animateMarkersPolyLinesBounds;
  MinMaxZoomPreference minMaxZoomPrefs;
  final MezPickGoogleMapController mezPickGoogleMapController;

  MezPickGoogleMap(
      {Key? key,
      required this.notifyParent,
      this.blackScreenBottomTextMargin = 0,
      this.myLocationButtonEnabled = true,
      this.polylines = const {},
      this.animateMarkersPolyLinesBounds = true,
      this.minMaxZoomPrefs = MinMaxZoomPreference.unbounded,
      this.markers = const [],
      required this.mezPickGoogleMapController})
      : super(key: key);
  @override
  MezPickGoogleMapState createState() =>
      MezPickGoogleMapState(this.mezPickGoogleMapController);
}

class MezPickGoogleMapState extends State<MezPickGoogleMap> {
  // shared original google map Key
  final GlobalKey<MGoogleMapState> mGoogleMapKey = GlobalKey();
  final LanguageController _lang = Get.find<LanguageController>();
  late LatLng location;

  bool _showLoading = false;
  bool _showFakeMarker = true;
  bool _showBlackScreen = true;

  Future<LatLng?> getMapCenter() async {
    return await mGoogleMapKey.currentState?.getMapCenter();
  }

  MezPickGoogleMapState(MezPickGoogleMapController mezPickGoogleMapController) {
    mezPickGoogleMapController.showBlackScreen = showBlackScreen;
    mezPickGoogleMapController.showFakeMarker = showFakeMarker;
    mezPickGoogleMapController.setLocation = setLocation;
  }

  void showBlackScreen() {
    setState(() {
      _showBlackScreen = true;
    });
  }

  void showFakeMarker() {
    setState(() {
      _showFakeMarker = true;
    });
  }

  void setLocation(LatLng newLocation) {
    location = newLocation;
    mezDbgPrint("MezPickedGMap did updated => Location changed !!!");
    setState(() {
      _showLoading = true;
      mGoogleMapKey.currentState
          ?.moveToNewLatLng(newLocation.latitude, newLocation.longitude);
      _showLoading = false;
      _showBlackScreen = true;
    });
  }

  void initState() async {
    GeoLoc.LocationData locData = await GeoLoc.Location().getLocation();
    location = LatLng(locData.latitude!, locData.longitude!);
    super.initState();
  }

  Widget pickerMarker() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        color: Colors.transparent,
        height: 30,
        width: 20,
        child: ClipRect(
          child: Image.asset(
            "assets/images/PurpleLocationPicker.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return _showLoading == false
        ? Stack(
            alignment: Alignment.center,
            children: [
              MGoogleMap(
                polylines: widget.polylines,
                animateMarkersPolyLinesBounds:
                    widget.animateMarkersPolyLinesBounds,
                notifyParent: widget.notifyParent,
                markers: widget.markers,
                initialLocation: location,
                key: mGoogleMapKey,
                minMaxZoomPrefs: widget.minMaxZoomPrefs,
                periodicRedrendring: false,
                myLocationButtonEnabled: widget.myLocationButtonEnabled,
              ),
              _showFakeMarker ? pickerMarker() : SizedBox(),
              _showBlackScreen ? gestureDetector() : SizedBox(),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }

  GestureDetector gestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showBlackScreen = false;
        });
      },
      child: Container(
        width: Get.width,
        color: Colors.black45,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
            bottom: widget.blackScreenBottomTextMargin, left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Icon(
                Icons.open_with,
                color: Colors.white,
                size: 20,
              ),
            ),
            Expanded(
              child: Text(
                _lang.strings["shared"]["inputLocation"]["moveMapIfNotPrecise"],
                // "You can move the map if position is not precise.",
                overflow: TextOverflow.visible,
                softWrap: true,
                textAlign: TextAlign.center,
                // maxLines: ,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'psb', fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
