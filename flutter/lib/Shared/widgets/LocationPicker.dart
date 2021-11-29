import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart' as GeoLoc;

class LocationPickerController extends MGoogleMapController {
  late void Function() showBlackScreen;
  late void Function() showFakeMarkerAndPickButton;
  late void Function() showConfirmButton;
  late void Function() showPickButton;
  late void Function() showGrayedOutButton;
  late void Function(Location newLocation) setLocation;
  late void Function(Set<Polyline> polylines) setPolylines;
}

class LocationPicker extends StatefulWidget {
  final MapHelper.LocationChangesNotifier notifyParentOfLocationFinalized;
  final Function notifyParentOfConfirm;
  final double blackScreenBottomTextMargin;
  final bool myLocationButtonEnabled;
  // Location location;
  final LocationPickerController mezPickGoogleMapController;

  LocationPicker(
      {required this.notifyParentOfLocationFinalized,
      required this.notifyParentOfConfirm,
      this.blackScreenBottomTextMargin = 0,
      this.myLocationButtonEnabled = true,
      required this.mezPickGoogleMapController});
  @override
  LocationPickerState createState() =>
      LocationPickerState(this.mezPickGoogleMapController);
}

enum BottomButtomToShow { Pick, Confirm, GrayedOut }

class LocationPickerState extends State<LocationPicker> {
  final LanguageController _lang = Get.find<LanguageController>();
  Location? location;

  bool _showLoading = false;
  bool _showFakeMarker = true;
  bool _showBlackScreen = true;
  BottomButtomToShow _bottomButtomToShow = BottomButtomToShow.GrayedOut;

  LocationPickerController _mezPickGoogleMapController;

  LocationPickerState(this._mezPickGoogleMapController) {
    _mezPickGoogleMapController.showBlackScreen = showBlackScreen;
    _mezPickGoogleMapController.showFakeMarkerAndPickButton =
        showFakeMarkerAndPickButton;
    _mezPickGoogleMapController.setLocation = setLocation;
    _mezPickGoogleMapController.showConfirmButton = showConfirmButton;
    _mezPickGoogleMapController.showPickButton = showPickButton;
    _mezPickGoogleMapController.showGrayedOutButton = showGrayedOutButton;
  }

/******************************  Controller functions ************************************/

  void showBlackScreen() {
    setState(() {
      _showBlackScreen = true;
    });
  }

  void showFakeMarkerAndPickButton() {
    setState(() {
      _showFakeMarker = true;
      _bottomButtomToShow = BottomButtomToShow.Pick;
    });
  }

  void showPickButton() {
    setState(() {});
  }

  void showConfirmButton() {
    setState(() {
      _bottomButtomToShow = BottomButtomToShow.Confirm;
    });
  }

  void showGrayedOutButton() {
    setState(() {
      _bottomButtomToShow = BottomButtomToShow.GrayedOut;
    });
  }

  void setLocation(Location newLocation) {
    location = newLocation;
    mezDbgPrint("MezPickedGMap did updated => Location changed !!!");
    setState(() {
      _showLoading = true;
      this
          ._mezPickGoogleMapController
          .moveToNewLatLng(newLocation.latitude, newLocation.longitude);
      _showLoading = false;
      _showBlackScreen = true;
    });
  }

/******************************  Init and build function ************************************/
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return _showLoading == false || location != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              MGoogleMap(
                mGoogleMapController: _mezPickGoogleMapController,
                notifyParent: widget.notifyParentOfLocationFinalized,
                initialLocation:
                    LatLng(location!.latitude, location!.longitude),
                periodicRedrendring: false,
                myLocationButtonEnabled: widget.myLocationButtonEnabled,
              ),
              _showFakeMarker ? pickerMarker() : SizedBox(),
              _showBlackScreen ? gestureDetector() : SizedBox(),
              bottomButton()
            ],
          )
        : Center(child: CircularProgressIndicator());
  }

/******************************  Widgets ************************************/
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

  Widget bottomButton() {
    switch (_bottomButtomToShow) {
      case BottomButtomToShow.Pick:
        return buildBottomButton(
            _lang.strings["shared"]["pickLocation"]["pick"],
            widget.notifyParentOfLocationFinalized);
      case BottomButtomToShow.Confirm:
        return buildBottomButton("CONFIRM", widget.notifyParentOfConfirm);
      case BottomButtomToShow.GrayedOut:
        return SizedBox();
    }
  }

  Widget buildBottomButton(String buttonText, Function? notifier) {
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
                notifier?.call(_loc);
                setState(() {
                  _showFakeMarker = false;
                  showGrayedOutButton();
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

  Widget gestureDetector() {
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

/******************************  helper functions ************************************/
  Future<Location> getCenterAndGeoCode() async {
    LatLng _mapCenter = await this._mezPickGoogleMapController.getMapCenter();

    GeoLoc.LocationData _newLocationData =
        Location.buildLocationData(_mapCenter.latitude, _mapCenter.longitude);

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
}
