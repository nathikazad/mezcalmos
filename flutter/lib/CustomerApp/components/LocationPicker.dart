import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/ResponsiveUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart' as GeoLoc;

class LocationPickerController extends MGoogleMapController {
  RxBool _showLoading = false.obs;
  RxBool _showFakeMarker = true.obs;
  RxBool _showBlackScreen = false.obs;
  Rx<BottomButtomToShow> _bottomButtomToShow = BottomButtomToShow.Pick.obs;
  RxDouble blackScreenBottomTextMargin = 0.0.obs;
  RxBool myLocationButtonEnabled = true.obs;

  void showOrHideBlackScreen(bool value) {
    _showBlackScreen.value = value;
  }

  void showFakeMarkerAndPickButton() {
    _showFakeMarker.value = true;
    _bottomButtomToShow.value = BottomButtomToShow.Pick;
  }

  void showConfirmButton() {
    _bottomButtomToShow.value = BottomButtomToShow.Confirm;
  }

  void showPickButton() {
    _bottomButtomToShow.value = BottomButtomToShow.Pick;
  }

  void showGrayedOutButton() {
    _bottomButtomToShow.value = BottomButtomToShow.GrayedOut;
  }
}

class LocationPicker extends StatefulWidget {
  final MapHelper.LocationChangesNotifier notifyParentOfLocationFinalized;
  final Function notifyParentOfConfirm;
  // Location location;
  final LocationPickerController locationPickerMapController;
  final bool showBottomButton;
  LocationPicker(
      {this.showBottomButton = true,
      required this.notifyParentOfLocationFinalized,
      required this.notifyParentOfConfirm,
      required this.locationPickerMapController});
  @override
  LocationPickerState createState() => LocationPickerState();
}

enum BottomButtomToShow { Pick, Confirm, GrayedOut }

class LocationPickerState extends State<LocationPicker> {
  final LanguageController _lang = Get.find<LanguageController>();
  Location? location;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Obx(() =>
        widget.locationPickerMapController._showLoading.value == false ||
                widget.locationPickerMapController.location.value != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  MGoogleMap(
                    mGoogleMapController: widget.locationPickerMapController,
                    notifyParentOfNewLocation:
                        widget.notifyParentOfLocationFinalized,
                    periodicRerendering: false,
                    //   periodicRedrendring: false,
                    myLocationButtonEnabled: widget.locationPickerMapController
                        .myLocationButtonEnabled.value,
                  ),
                  widget.locationPickerMapController._showFakeMarker.value
                      ? pickerMarker()
                      : SizedBox(),
                  widget.locationPickerMapController._showBlackScreen.value
                      ? gestureDetector()
                      : SizedBox(),
                  this.widget.showBottomButton ? bottomButton() : SizedBox()
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
    switch (widget.locationPickerMapController._bottomButtomToShow.value) {
      case BottomButtomToShow.Pick:
        mezDbgPrint("0000000000  ===> returning Pick");
        return buildBottomButton(
          _lang.strings["shared"]["pickLocation"]["pick"],
          notifier: widget.notifyParentOfLocationFinalized,
          // onPress: showGrayedOutButton
        );
      case BottomButtomToShow.Confirm:
        if (Get.find<AuthController>().fireAuthUser != null) {
          return buildBottomButton("CONFIRM",
              notifier: widget.notifyParentOfConfirm);
        } else {
          return buildBottomButton("Sign in to make order",
              notifier: (_) async {
            await Get.toNamed(kSignInRouteOptional);
            setState(() {});
          });
        }

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
        bottom: 0,
        left: 15,
        right: widget.locationPickerMapController.myLocationButtonEnabled.value
            ? 80
            : 15,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(
              bottom: widget
                      .locationPickerMapController.myLocationButtonEnabled.value
                  ? 2
                  : 30),
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
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: notifier != null
                  ? () async {
                      var _loc = await getCenterAndGeoCode();
                      notifier.call(_loc);
                      widget.locationPickerMapController._showFakeMarker.value =
                          false;
                    }
                  : () {},
              child: Center(
                child: Text(buttonText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'psr',
                      color: Colors.white,
                      fontSize: 18.sp,
                    )),
              )),
        ));
  }

  Widget gestureDetector() {
    return GestureDetector(
      onTap: () {
        widget.locationPickerMapController._showBlackScreen.value = false;
      },
      child: Container(
        width: Get.width,
        color: Colors.black45,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
            bottom: widget.locationPickerMapController
                    .blackScreenBottomTextMargin.value +
                35,
            left: (Get.width / 5.5).sp,
            right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0, right: 5),
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.start,
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
    LatLng _mapCenter =
        await this.widget.locationPickerMapController.getMapCenter();

    GeoLoc.LocationData _newLocationData =
        Location.buildLocationData(_mapCenter.latitude, _mapCenter.longitude);

    double kmDistance = MapHelper.calculateDistance(
        _newLocationData,
        Location.buildLocationData(
            widget.locationPickerMapController.location.value!.latitude,
            widget.locationPickerMapController.location.value!.longitude));

    mezDbgPrint("@===> old location : ${location.toString()}");

    String formattedAddress =
        widget.locationPickerMapController.location.value!.address;
    if (kmDistance > 0.5 || formattedAddress == "") {
      // ADDED : || formattedAddress == ""  CUZ on clear we set address == "".
      // and that's what 's leavign the textfields empty when re-picking but  distance is less than 0.5 km
      formattedAddress = await MapHelper.getAdressFromLatLng(LatLng(
              _newLocationData.latitude!, _newLocationData.longitude!)) ??
          widget.locationPickerMapController.location.value!.address;
    } else {
      mezDbgPrint(
          "%&****************************  DISTANCE LESS THAN 0.5 %%%%%%%%%%%%%%");
    }

    Location finalResult = Location(formattedAddress, _newLocationData);

    mezDbgPrint("@===> new location : ${finalResult.toString()}");

    return finalResult;
  }
}
