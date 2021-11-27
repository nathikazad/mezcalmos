import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart' as GeoLoc;

class MezPickGoogleMapController {
  void Function()? showBlackScreen;
  void Function()? showFakeMarker;
  void Function(bool shouldShow)? shouldShowConfirmButton;
  void Function(Location newLocation)? setLocation;
  void Function(Set<Polyline> polylines)? setPolylines;
}

class MezPickGoogleMap extends StatefulWidget {
  LocationChangesNotifier notifyParentOfPick;
  LocationChangesNotifier notifyParentOfConfirm;
  double blackScreenBottomTextMargin;
  List<Marker> markers;
  Set<Polyline> polylines;
  bool myLocationButtonEnabled;
  bool animateMarkersPolyLinesBounds;
  MinMaxZoomPreference minMaxZoomPrefs;
  // Location location;
  final MezPickGoogleMapController mezPickGoogleMapController;

  MezPickGoogleMap(
      {Key? key,
      // required this.location,
      required this.notifyParentOfPick,
      required this.notifyParentOfConfirm,
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
  Location? location;

  bool _showLoading = false;
  bool _showFakeMarker = true;
  bool _showBlackScreen = true;
  bool _showPickButton = false;

  Future<LatLng?> getMapCenter() async {
    return await mGoogleMapKey.currentState?.getMapCenter();
  }

  MezPickGoogleMapState(MezPickGoogleMapController mezPickGoogleMapController) {
    mezPickGoogleMapController.showBlackScreen = showBlackScreen;
    mezPickGoogleMapController.showFakeMarker = showFakeMarker;
    mezPickGoogleMapController.setLocation = setLocation;
    mezPickGoogleMapController.setPolylines = setPolylines;
    mezPickGoogleMapController.shouldShowConfirmButton = shouldShowPickButton;
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

  void shouldShowPickButton(bool shouldShow) {
    setState(() {
      _showPickButton = shouldShow;
    });
  }

  void setLocation(Location newLocation) {
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

  void setPolylines(Set<Polyline> polylines) {
    setState(() {});
  }

  void initState() {
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
    return _showLoading == false || location != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              MGoogleMap(
                polylines: widget.polylines,
                animateMarkersPolyLinesBounds:
                    widget.animateMarkersPolyLinesBounds,
                notifyParent: widget.notifyParentOfPick,
                markers: widget.markers,
                initialLocation:
                    LatLng(location!.latitude, location!.longitude),
                key: mGoogleMapKey,
                minMaxZoomPrefs: widget.minMaxZoomPrefs,
                periodicRedrendring: false,
                myLocationButtonEnabled: widget.myLocationButtonEnabled,
              ),
              _showFakeMarker ? pickerMarker() : SizedBox(),
              _showBlackScreen ? gestureDetector() : SizedBox(),
              widget.polylines.isEmpty
                  ? _shouldShowPickButton()
                  : confirmButton()
            ],
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget confirmButton() {
    return bottomButton("CONFIRM", widget.notifyParentOfConfirm);
  }

  Widget _shouldShowPickButton() {
    return _showPickButton
        ? bottomButton(_lang.strings["shared"]["pickLocation"]["pick"],
            widget.notifyParentOfPick)
        : SizedBox();
  }

  Future<Location> getCenterAndGeoCode() async {
    LatLng? _mapCenter = await getMapCenter();

    GeoLoc.LocationData _newLocationData =
        Location.buildLocationData(_mapCenter!.latitude, _mapCenter.longitude);

    double kmDistance = MapHelper.calculateDistance(_newLocationData,
        Location.buildLocationData(location!.latitude, location!.longitude));

    String formattedAddress = location!.address;

    if (kmDistance > 0.5) {
      formattedAddress = await MapHelper.getAdressFromLatLng(LatLng(
              _newLocationData.latitude!, _newLocationData.longitude!)) ??
          location!.address;
    }

    return Future.value(Location(formattedAddress, _newLocationData));
  }

  Widget bottomButton(String buttonText, LocationChangesNotifier notifier) {
    return Positioned(
        bottom: 10,
        left: 15,
        right: 15,
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(81, 132, 255, 1),
              Color.fromRGBO(206, 73, 252, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: TextButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(Get.width,
                      getSizeRelativeToScreen(20, Get.height, Get.width))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: () async {
                var _loc = await getCenterAndGeoCode();
                mezDbgPrint("------> Got new address : ${_loc.address}");
                notifier(_loc);
                setState(() {
                  _showFakeMarker = false;
                  _showPickButton = false;
                });
              },
              child: Text(buttonText,
                  style: TextStyle(
                    fontFamily: 'psr',
                    color: Colors.white,
                    fontSize: 18.sp,
                  ))),
        ));
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
