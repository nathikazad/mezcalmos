import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["LocationPicker"];

class LocationPickerController extends MGoogleMapController {
  /// _showFakeMarker
  RxBool _showFakeMarker = true.obs;

  /// _showBlackScreen
  RxBool _showBlackScreen = false.obs;

  /// _bottomButtomToShow
  Rx<BottomButtomToShow> _bottomButtomToShow = BottomButtomToShow.Pick.obs;

  /// blackScreenBottomTextMargin
  RxDouble blackScreenBottomTextMargin = 0.0.obs;

  LocationPickerController({bool myLocationButtonEnabled = true})
      : super(myLocationButtonEnabled: myLocationButtonEnabled);

  void showOrHideBlackScreen(bool value) {
    _showBlackScreen.value = value;
  }

  void showLoadingIconOnConfirm() {
    _bottomButtomToShow.value = BottomButtomToShow.Loading;
  }

  void showFakeMarkerAndPickButton() {
    _showFakeMarker.value = true;
    _bottomButtomToShow.value = BottomButtomToShow.Pick;
  }

  void hideFakeMarker() {
    _showFakeMarker.value = false;
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
  /// notifyParentOfLocationFinalized
  final MapHelper.LocationChangesNotifier notifyParentOfLocationFinalized;

  /// notifyParentOfConfirm
  final Function notifyParentOfConfirm;

  /// onSuccessSignIn
  final Function? onSuccessSignIn;

  /// onSuccessSignIn
  final LocationPickerController locationPickerMapController;

  /// showBottomButton
  final bool showBottomButton;
  const LocationPicker({
    this.showBottomButton = true,
    this.onSuccessSignIn,
    required this.notifyParentOfLocationFinalized,
    required this.notifyParentOfConfirm,
    required this.locationPickerMapController,
  });
  @override
  LocationPickerState createState() => LocationPickerState();
}

//ignore_for_file:constant_identifier_names
enum BottomButtomToShow { Pick, Confirm, GrayedOut, Loading }

class LocationPickerState extends State<LocationPicker> {
  Location? location;
  bool userTaped = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.locationPickerMapController.location.value != null
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              MGoogleMap(
                recenterBtnBottomPadding: 150,
                mGoogleMapController: widget.locationPickerMapController,
                notifyParentOfNewLocation:
                    widget.notifyParentOfLocationFinalized,
              ),
              widget.locationPickerMapController._showFakeMarker.value
                  ? pickerMarker()
                  : SizedBox(),
              widget.locationPickerMapController._showBlackScreen.value
                  ? gestureDetector()
                  : SizedBox(),
              widget.showBottomButton ? bottomButton() : SizedBox()
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
            aLocationPicker,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget bottomButton() {
    switch (widget.locationPickerMapController._bottomButtomToShow.value) {
      case BottomButtomToShow.Pick:
        return buildBottomButton(
          _i18n()["pick"],
          notifier: widget.notifyParentOfLocationFinalized,
          // onPress: showGrayedOutButton
        );
      case BottomButtomToShow.Confirm:
        if (Get.find<AuthController>().fireAuthUser != null) {
          return buildBottomButton(_i18n()['confirm'].toString().capitalize,
              notifier: widget.notifyParentOfConfirm);
        } else {
          return buildBottomButton(_i18n()["signInToMakeOrder"],
              notifier: (_) async {
            Get.find<AuthController>().preserveNavigationStackAfterSignIn =
                true;
            await MezRouter.toNamed<void>(kSignInRouteOptional);

            // call back in case User was signedOut and he signedIn before confirming his Order Successfully!
            widget.onSuccessSignIn?.call();
            setState(() {});
          });
        }
      case BottomButtomToShow.Loading:
        return buildBottomButton(
          null,
        );
      case BottomButtomToShow.GrayedOut:
        return buildBottomButton(
          _i18n()['confirm'].toString().capitalize,
        );
    }
  }

  Widget buildBottomButton(
    String? buttonText, {
    Function? notifier,
    Function? onPress,
  }) {
    return Positioned(
      bottom: 0,
      left: 15,
      right: widget.locationPickerMapController.myLocationButtonEnabled.value
          ? 80
          : 15,
      child: InkWell(
        onTap: notifier != null
            ? () async {
                final Location? _loc = await getCenterAndGeoCode();
                if (_loc != null) {
                  notifier.call(_loc);
                  widget.locationPickerMapController._showFakeMarker.value =
                      false;
                }
              }
            : () {},
        child: Container(
          height: 45,
          margin: EdgeInsets.only(
              bottom: widget
                      .locationPickerMapController.myLocationButtonEnabled.value
                  ? 2
                  : 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                colors: notifier != null
                    ? <Color>[
                        Color.fromRGBO(81, 132, 255, 1),
                        Color.fromRGBO(206, 73, 252, 1)
                      ]
                    : <Color>[Colors.grey.shade400, Colors.grey.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Center(
            child: buttonText != null
                ? Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontFamily: 'psr',
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  )
                : Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Colors.black,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget gestureDetector() {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanStart: (_) {
        widget.locationPickerMapController.showOrHideBlackScreen(false);
      },
      child: Container(
        width: Get.width,
        color: widget.locationPickerMapController._showBlackScreen.value
            ? Colors.black45
            : Colors.transparent,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          bottom: widget.locationPickerMapController.blackScreenBottomTextMargin
                  .value +
              35,
          left: Get.width / 5.5,
          right: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                _i18n()["moveMapIfNotPrecise"],
                // "You can move the map if position is not precise.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'psb',
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /******************************  helper functions ************************************/
  Future<Location?> getCenterAndGeoCode() async {
    final LatLng? _mapCenter =
        await widget.locationPickerMapController.getMapCenter();
    Location? finalResult;

    if (_mapCenter != null) {
      final GeoLoc.LocationData _newLocationData =
          Location.buildLocationData(_mapCenter.latitude, _mapCenter.longitude);

      final double kmDistance = MapHelper.calculateDistance(
          _newLocationData,
          Location.buildLocationData(
              widget.locationPickerMapController.location.value!.latitude,
              widget.locationPickerMapController.location.value!.longitude));

      String formattedAddress =
          widget.locationPickerMapController.location.value!.address;
      if (kmDistance > 0.5 || formattedAddress == "") {
        // ADDED : || formattedAddress == ""  CUZ on clear we set address == "".
        // and that's what 's leavign the textfields empty when re-picking but  distance is less than 0.5 km
        formattedAddress = await MapHelper.getAdressFromLatLng(
              LatLng(
                _newLocationData.latitude!,
                _newLocationData.longitude!,
              ),
            ) ??
            widget.locationPickerMapController.location.value!.address;
      }

      finalResult = Location(formattedAddress, _newLocationData);

      mezDbgPrint("@===> new location : ${finalResult.toString()}");
    }

    return finalResult;
  }
}
