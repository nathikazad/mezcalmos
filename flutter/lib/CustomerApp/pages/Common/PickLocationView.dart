// Example of the View
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/SaveLocationDailog.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:sizer/sizer.dart';

enum PickLocationMode { AddNewLocation, EditLocation, NonLoggedInPick }

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["PickLocationScreen"]["PickLocationView"];

class PickLocationView extends StatefulWidget {
  final PickLocationMode? pickLocationMode;

  const PickLocationView(this.pickLocationMode);

  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  final LocationPickerController locationPickerController =
      LocationPickerController();

  // Location? locationPickerController.location;
  SavedLocation? savedLocation;
  bool showScreenLoading = false;
  LatLng? currentLatLng;

  LanguageController _lang = Get.find<LanguageController>();

  // CustomerAuthController customerAuthController =
  //     Get.find<CustomerAuthController>();

  // Future<void> geoCodeAndSetNewAddress(LatLng pickedLocation) async {
  //   String? address = await getAdressFromLatLng(
  //       LatLng(pickedLocation.latitude, pickedLocation.longitude));
  //   locationPickerController.location.value!.address = address ??
  //       "${_lang.strings['shared']['pickLocation']['address']} : ${pickedLocation.latitude}, ${pickedLocation.longitude}";
  // }

  @override
  void initState() {
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
      final String? x = Get.parameters["id"];
      savedLocation = Get.find<CustomerAuthController>()
          .customerRxn()!
          .savedLocations
          .firstWhere((SavedLocation saved) => saved.id == x);
      GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
        setState(() {
          locationPickerController.location.value = Location.fromFirebaseData({
            "address": savedLocation!.location?.address,
            "lat": savedLocation?.location?.latitude,
            "lng": savedLocation?.location?.longitude,
          });
        });
      });
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
      locationPickerController.setLocation(
        Location.fromFirebaseData(<String, dynamic>{
          "address": address ??
              currentLoc.latitude.toString() + ", ${currentLoc.longitude}",
          "lat": currentLoc.latitude,
          "lng": currentLoc.longitude,
        }),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      bottomNavigationBar: showScreenLoading == false
          ? ButtonComponent(
              function: () async {
                await onPickButtonClick(context);
              },
              widget: Center(
                child: Text(
                  _i18n()["pickLocation"],
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white, fontSize: 12.sp),
                ),
              ),
            )
          : ButtonComponent(
              bgColor: Colors.grey.shade400,
              function: () {},
              widget: Center(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
      resizeToAvoidBottomInset: false,
      appBar: CustomerAppBar(
        autoBack: true,
        title: _i18n()["pickLocation"],
      ),
      body: mezPickLocationViewBody(),
    );
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
    locationPickerController.setLocation(
      Location.fromFirebaseData(<String, dynamic>{
        "address": address ??
            latlng.latitude.toString() + ', ' + latlng.longitude.toString(),
        "lat": latlng.latitude,
        "lng": latlng.longitude,
      }),
    );
    setState(() {});
  }

  Future<void> onPickButtonClick(BuildContext context) async {
    String? _result;
    final LatLng _pickedLoc = await locationPickerController.getMapCenter();

    locationPickerController.moveToNewLatLng(
        _pickedLoc.latitude, _pickedLoc.longitude);

    setState(() {
      showScreenLoading = true;
    });
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      _result = await savedLocationDailog(
        context: context,
        comingFromCart: Get.arguments,
      );
      if (_result != null && _result != "") {
        await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
        savedLocation = SavedLocation(
            name: _result, location: locationPickerController.location.value!);
        Get.find<CustomerAuthController>().saveNewLocation(savedLocation!);
      } else {
        await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
        savedLocation = SavedLocation(
            name: locationPickerController.location.value!.address,
            location: locationPickerController.location.value!);
      }
      setState(() {
        locationPickerController
            .setLocation(locationPickerController.location.value!);
      });

      Get.back<SavedLocation?>(result: savedLocation);
    } else if (widget.pickLocationMode == PickLocationMode.EditLocation) {
      _result = await savedLocationDailog(
          comingFromCart: Get.arguments,
          context: context,
          nameVal: savedLocation!.name,
          mode: PickLocationMode.EditLocation);
      if (_result != null && _result != "") {
        await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
        savedLocation = SavedLocation(
            id: savedLocation!.id,
            name: _result,
            location: locationPickerController.location.value!);

        Get.find<CustomerAuthController>().editLocation(savedLocation!);
      }
      setState(() {
        locationPickerController
            .setLocation(locationPickerController.location.value!);
      });

      Get.back<SavedLocation?>(result: savedLocation);
    } else if (widget.pickLocationMode == PickLocationMode.NonLoggedInPick) {
      Get.back<Location>(result: locationPickerController.location.value);
    }
  }

  // ------------------------------------------- WIDGETS -------------------------------------------
  Container mezPickLocationViewBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(_i18n()["pickLabele"]),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: LocationSearchComponent(
                hintPadding: EdgeInsets.only(left: 10),
                suffixPadding: EdgeInsets.only(right: 10),
                useBorders: false,
                showSearchIcon: true,
                text: locationPickerController.location.value?.address,
                onClear: () {},
                notifyParent: (Location? location) {
                  setState(() {
                    locationPickerController.setLocation(location!);
                    locationPickerController.moveToNewLatLng(
                        location.latitude, location.longitude);
                  });
                }),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade200,
              ),
              child: locationPickerController.location.value != null
                  ? LocationPicker(
                      showBottomButton: false,
                      locationPickerMapController: locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (Location location) {
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
            ),
          ),
        ],
      ),
    );
  }
}
