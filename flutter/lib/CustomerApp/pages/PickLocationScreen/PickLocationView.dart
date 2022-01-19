// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/ButtonComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';

import '../Restaurants/ViewcartScreen/components/saveLocationDailog.dart';

enum PickLocationMode { AddNewLocation, EditLocation }

class PickLocationView extends StatefulWidget {
  final PickLocationMode? pickLocationMode;
  PickLocationView(this.pickLocationMode);
  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  // Location? locationPickerController.location;
  SavedLocation? savedLocation;
  bool showScreenLoading = false;

  LanguageController _lang = Get.find<LanguageController>();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  Future<void> geoCodeAndSetNewAddress(LatLng pickedLocation) async {
    String? address = await getAdressFromLatLng(
        LatLng(pickedLocation.latitude, pickedLocation.longitude));
    locationPickerController.location.value!.address = address ??
        "${_lang.strings['shared']['pickLocation']['address']} : ${pickedLocation.latitude}, ${pickedLocation.longitude}";
  }

  void onPickButtonClick(BuildContext context) async {
    String? _result;
    LatLng _pickedLoc = await locationPickerController.getMapCenter();
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
        await geoCodeAndSetNewAddress(_pickedLoc);
        savedLocation = SavedLocation(
            name: _result, location: locationPickerController.location.value!);
        customerAuthController.saveNewLocation(savedLocation!);
      } else {
        await geoCodeAndSetNewAddress(_pickedLoc);
        savedLocation = SavedLocation(
            name: locationPickerController.location.value!.address,
            location: locationPickerController.location.value!);
      }
    } else {
      _result = await savedLocationDailog(
          comingFromCart: Get.arguments,
          context: context,
          nameVal: savedLocation!.name,
          mode: PickLocationMode.EditLocation);
      if (_result != null && _result != "") {
        await geoCodeAndSetNewAddress(_pickedLoc);
        savedLocation = SavedLocation(
            id: savedLocation!.id,
            name: _result,
            location: locationPickerController.location.value!);

        customerAuthController.editLocation(savedLocation!);
      }
    }
    setState(() {
      locationPickerController
          .setLocation(locationPickerController.location.value!);
    });

    Get.back<SavedLocation?>(result: savedLocation);
  }

  @override
  void initState() {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      GeoLoc.Location().getLocation().then((locData) {
        setState(() {
          locationPickerController.setLocation(Location.fromFirebaseData({
            "address": null,
            "lat": locData.latitude,
            "lng": locData.longitude,
          }));
        });
      });
    } else {
      var x = Get.parameters["id"];
      savedLocation = customerAuthController
          .customerRxn()!
          .savedLocations
          .firstWhere((saved) => saved.id == x);
      GeoLoc.Location().getLocation().then((locData) {
        setState(() {
          locationPickerController.location.value = Location.fromFirebaseData({
            "address": savedLocation!.location?.address,
            "lat": savedLocation?.location?.latitude,
            "lng": savedLocation?.location?.longitude,
          });
        });
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
        bottomNavigationBar: this.showScreenLoading == false
            ? ButtonComponent(
                function: () => onPickButtonClick(context),
                widget: Center(
                    child: Text(
                        _lang.strings["customer"]["pickLocation"]
                            ["pickLocation"],
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white))),
              )
            : ButtonComponent(
                bgColor: Colors.grey.shade400,
                function: () {},
                widget: Center(
                    child: Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 1, color: Colors.black),
                ))),
        resizeToAvoidBottomInset: false,
        appBar: CustomerAppBar(
          autoBack: true,
          title: _lang.strings["customer"]["pickLocation"]["pickLocation"],
        ),
        body: mezPickLocationViewBody());
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
            child:
                Text(_lang.strings["customer"]["pickLocation"]["pickLabele"]),
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
                    locationPickerMapController: this.locationPickerController,
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
          )),
        ],
      ),
    );
  }
}
