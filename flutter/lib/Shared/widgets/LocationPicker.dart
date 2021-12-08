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
  RxBool _showLoading = false.obs;
  RxBool _showFakeMarker = true.obs;
  RxBool _showBlackScreen = true.obs;
  Rx<BottomButtomToShow> _bottomButtomToShow = BottomButtomToShow.Pick.obs;
  RxDouble blackScreenBottomTextMargin = 0.0.obs;
  RxBool myLocationButtonEnabled = true.obs;

  late void Function() showBlackScreen;
  late void Function() hideBlackScreen;
  late void Function() showFakeMarkerAndPickButton;
  late void Function() showConfirmButton;
  late void Function() showPickButton;
  late void Function() showGrayedOutButton;
  late void Function(Location newLocation) setLocation;
  // late void Function(Set<Polyline> polylines) setPolylines;
}

class LocationPicker extends StatefulWidget {
  final MapHelper.LocationChangesNotifier notifyParentOfLocationFinalized;
  final Function notifyParentOfConfirm;

  // Location location;
  final LocationPickerController locationPickerMapController;

  LocationPicker(
      {required this.notifyParentOfLocationFinalized,
      required this.notifyParentOfConfirm,
      required this.locationPickerMapController});
  @override
  LocationPickerState createState() =>
      LocationPickerState(this.locationPickerMapController);
}

enum BottomButtomToShow { Pick, Confirm, GrayedOut }

class LocationPickerState extends State<LocationPicker> {
  final LanguageController _lang = Get.find<LanguageController>();
  Location? location;

  LocationPickerController _mezPickGoogleMapController;

  LocationPickerState(this._mezPickGoogleMapController) {
    _mezPickGoogleMapController.showBlackScreen = showBlackScreen;
    _mezPickGoogleMapController.hideBlackScreen = hideBlackScreen;
    _mezPickGoogleMapController.showFakeMarkerAndPickButton =
        showFakeMarkerAndPickButton;
    _mezPickGoogleMapController.setLocation = setLocation;
    _mezPickGoogleMapController.showConfirmButton = showConfirmButton;
    _mezPickGoogleMapController.showPickButton = showPickButton;
    _mezPickGoogleMapController.showGrayedOutButton = showGrayedOutButton;
  }

/******************************  Controller functions ************************************/

  void showBlackScreen() {
    _mezPickGoogleMapController._showBlackScreen.value = true;
  }

  void hideBlackScreen() {
    _mezPickGoogleMapController._showBlackScreen.value = false;
  }

  void showFakeMarkerAndPickButton() {
    _mezPickGoogleMapController._showFakeMarker.value = true;
    _mezPickGoogleMapController._bottomButtomToShow.value =
        BottomButtomToShow.Pick;
  }

  void showPickButton() {
    _mezPickGoogleMapController._bottomButtomToShow.value =
        BottomButtomToShow.Pick;
  }

  void showConfirmButton() {
    _mezPickGoogleMapController._bottomButtomToShow.value =
        BottomButtomToShow.Confirm;
  }

  void showGrayedOutButton() {
    _mezPickGoogleMapController._bottomButtomToShow.value =
        BottomButtomToShow.GrayedOut;
  }

  void setLocation(Location newLocation) {
    location = newLocation;
    mezDbgPrint("MezPickedGMap did updated => Location changed !!!");
    this
        ._mezPickGoogleMapController
        .moveToNewLatLng(newLocation.latitude, newLocation.longitude);
    _mezPickGoogleMapController._showLoading.value = true;
    _mezPickGoogleMapController._showLoading.value = false;
    _mezPickGoogleMapController._showBlackScreen.value = true;
  }

/******************************  Init and build function ************************************/
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Obx(() => _mezPickGoogleMapController._showLoading.value == false ||
            location != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              MGoogleMap(
                mGoogleMapController: _mezPickGoogleMapController,
                notifyParentOfNewLocation:
                    widget.notifyParentOfLocationFinalized,
                initialLocation:
                    LatLng(location!.latitude, location!.longitude),
                periodicRedrendring: false,
                myLocationButtonEnabled:
                    _mezPickGoogleMapController.myLocationButtonEnabled.value,
              ),
              _mezPickGoogleMapController._showFakeMarker.value
                  ? pickerMarker()
                  : SizedBox(),
              _mezPickGoogleMapController._showBlackScreen.value
                  ? gestureDetector()
                  : SizedBox(),
              bottomButton()
            ],
          )
        : Center(child: CircularProgressIndicator()));
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
    switch (_mezPickGoogleMapController._bottomButtomToShow.value) {
      case BottomButtomToShow.Pick:
        mezDbgPrint("0000000000  ===> returning Pick");
        return buildBottomButton(
          _lang.strings["shared"]["pickLocation"]["pick"],
          notifier: widget.notifyParentOfLocationFinalized,
          // onPress: showGrayedOutButton
        );
      case BottomButtomToShow.Confirm:
        mezDbgPrint("0000000000  ===> returning Confirm");
        return buildBottomButton("CONFIRM",
            notifier: widget.notifyParentOfConfirm);
      case BottomButtomToShow.GrayedOut:
        mezDbgPrint("0000000000  ===> returning GrayedOut");
        return buildBottomButton(
          "CONFIRM",
        );
    }
  }

  Widget buildBottomButton(String buttonText,
      {Function? notifier, Function? onPress}) {
    return Positioned(
        bottom: 10,
        left: 15,
        right: 15,
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                colors: notifier != null
                    ? [
                        Color.fromRGBO(81, 132, 255, 1),
                        Color.fromRGBO(206, 73, 252, 1)
                      ]
                    : [Colors.grey.shade400, Colors.grey.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: TextButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(Get.width,
                      getSizeRelativeToScreen(20, Get.height, Get.width))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: notifier != null
                  ? () async {
                      var _loc = await getCenterAndGeoCode();
                      notifier.call(_loc);
                      _mezPickGoogleMapController._showFakeMarker.value = false;
                    }
                  : () {},
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
        _mezPickGoogleMapController._showBlackScreen.value = false;
      },
      child: Container(
        width: Get.width,
        color: Colors.black45,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
            bottom:
                _mezPickGoogleMapController.blackScreenBottomTextMargin.value,
            left: 10,
            right: 10),
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

    mezDbgPrint("@===> old location : ${location.toString()}");

    String formattedAddress = location!.address;
    if (kmDistance > 0.5 || formattedAddress == "") {
      // ADDED : || formattedAddress == ""  CUZ on clear we set address == "".
      // and that's what 's leavign the textfields empty when re-picking but  distance is less than 0.5 km
      formattedAddress = await MapHelper.getAdressFromLatLng(LatLng(
              _newLocationData.latitude!, _newLocationData.longitude!)) ??
          location!.address;
    } else {
      mezDbgPrint(
          "%&****************************  DISTANCE LESS THAN 0.5 %%%%%%%%%%%%%%");
    }

    Location finalResult = Location(formattedAddress, _newLocationData);

    mezDbgPrint("@===> new location : ${finalResult.toString()}");

    return finalResult;
  }
}
