// Example of the View
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:sizer/sizer.dart';

enum PickLocationMode { AddNewLocation, EditLocation, NonLoggedInPick }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["PickLocationScreen"]["PickLocationView"];

class PickLocationView extends StatefulWidget {
  final PickLocationMode? pickLocationMode;

  const PickLocationView(this.pickLocationMode);
  static Future<MezLocation> navigate({required int restaurantId}) {
    return MezRouter.toPath(SharedRoutes.kPickToLocation)
        .then<MezLocation>((_) {
      return MezRouter.backResult;
    });
  }

  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  final LocationPickerController locationPickerController =
      LocationPickerController();

  bool showScreenLoading = false;
  LatLng? currentLatLng;

  @override
  void initState() {
    mezDbgPrint(
        "Pick location view ===========================================>>>");
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
        // first we set Location without GeoCoding the address
        setNewLocationOnController(
            latlng: LatLng(locData.latitude!, locData.longitude!));
        // then we try to get the address
        geoCodeAndSetControllerLocation(
            LatLng(locData.latitude!, locData.longitude!));
      });
    } else if (widget.pickLocationMode == PickLocationMode.EditLocation) {
      currentLatLng = MezRouter.bodyArguments as LatLng?;
      mezDbgPrint("Current latlng from recent router =>>>>>$currentLatLng");
      if (currentLatLng != null) {
        geoCodeAndSetLocation(currentLatLng!);
      }
    } else {
      mezDbgPrint("Iniiit");

      GeoLoc.Location().getLocation().then((GeoLoc.LocationData value) {
        currentLatLng = LatLng(value.latitude!, value.longitude!);

        geoCodeAndSetLocation(currentLatLng!);
      });
    }
    mezDbgPrint('LOOOOOOOOC ' + locationPickerController.location.toString());
    super.initState();
  }

  Future<void> geoCodeAndSetLocation(LatLng currentLoc) async {
    final String? address = await getAdressFromLatLng(currentLoc);

    setState(() {
      locationPickerController.setLocation(MezLocation.fromFirebaseData({
        "address": address ??
            currentLoc.latitude.toString() + ", ${currentLoc.longitude}",
        "lat": currentLoc.latitude,
        "lng": currentLoc.longitude,
      }));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => pickButton(),
        ),
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          autoBack: true,
          title: "${_i18n()["pickLocation"]}",
        ),
        body: mezPickLocationViewBody());
  }

  // ------------------------------------------- Functions -------------------------------------------

  /// Get the related Address to a given [latLng], without awaiting the GeoCoding , mainly used onInit
  ///
  /// To not make the Map dependable on awaiting it to finish and onDone , it sets it to the controller::location.
  void geoCodeAndSetControllerLocation(LatLng latLng) {
    getAdressFromLatLng(latLng).then((String? addrs) {
      mezDbgPrint("+ Done resolving user's Address $addrs !");
      setNewLocationOnController(latlng: latLng, address: addrs);
    }).catchError((e) {
      mezDbgPrint("Failed to get address of User's Lat Lng $latLng");
    });
  }

  /// Get the related Address to a given [latLng],
  /// This is the Same As [geoCodeAndSetControllerLocation] , the only diffrene that this is
  ///
  /// an Awaitable method, wheres the other is not, we use this when user clicks Save/Add new Saved Location
  Future<void> awaitGeoCodeAndSetControllerLocation(LatLng latLng) async {
    final String? addrs = await getAdressFromLatLng(latLng);
    setNewLocationOnController(latlng: latLng, address: addrs);
  }

  void setNewLocationOnController({required LatLng latlng, String? address}) {
    locationPickerController.setLocation(MezLocation.fromFirebaseData({
      "address": address ??
          latlng.latitude.toString() + ', ' + latlng.longitude.toString(),
      "lat": latlng.latitude,
      "lng": latlng.longitude,
    }));
    setState(() {});
  }

  Future<void> onPickButtonClick(BuildContext context) async {
    String? _result;
    final LatLng? _pickedLoc = await locationPickerController.getMapCenter();
    if (_pickedLoc != null) {
      await locationPickerController.moveToNewLatLng(
          _pickedLoc.latitude, _pickedLoc.longitude);
      //  locationPickerController.setLocation(_pickedLoc);
      await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
      setState(() {
        // showScreenLoading = true;
      });
      if (widget.pickLocationMode == PickLocationMode.NonLoggedInPick) {
        await MezRouter.back(
            backResult: locationPickerController.location.value);
      } else if (widget.pickLocationMode == PickLocationMode.EditLocation) {
        await MezRouter.back(
            backResult: locationPickerController.location.value);
        mezDbgPrint(locationPickerController.location.value!.address);
      } else {
        await MezRouter.back(
            backResult: locationPickerController.location.value);
      }
    }
  }

  // ------------------------------------------- WIDGETS -------------------------------------------
  Widget pickButton() {
    return showScreenLoading == false && locationPickerController.isMapReady
        ? Container(
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
              onPressed: () async => onPickButtonClick(context),
              child: Center(
                  child: Text(_i18n()["pickLocation"],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white, fontSize: 12.sp))),
            ),
          )
        : Container(
            height: 50,
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Colors.grey.shade400),
              onPressed: null,
              child: Center(
                child: Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 1, color: Colors.black),
                ),
              ),
            ),
          );
  }

  Container mezPickLocationViewBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(_i18n()["pickLabele"]),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: LocationSearchComponent(
                hintPadding: EdgeInsets.only(left: 10),
                suffixPadding: EdgeInsets.only(right: 10),
                showSearchIcon: true,
                text: locationPickerController.location.value?.address,
                onClear: () {},
                notifyParent: (MezLocation? location) {
                  setState(() {
                    locationPickerController.setLocation(location!);
                    locationPickerController.moveToNewLatLng(
                        location.latitude, location.longitude);
                  });
                }),
          ),
          SizedBox(
            height: 10,
          ),
          // stack
          Expanded(
              child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade200),
            child: locationPickerController.location.value != null
                ? LocationPicker(
                    showBottomButton: false,
                    locationPickerMapController: locationPickerController,
                    notifyParentOfConfirm: (_) {},
                    notifyParentOfLocationFinalized: (MezLocation location) {
                      mezDbgPrint("NEwLOC notif");
                      setState(() {
                        locationPickerController.setLocation(location);
                      });
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 1,
                    ),
                  ),
          )),
        ],
      ),
    );
  }
}
