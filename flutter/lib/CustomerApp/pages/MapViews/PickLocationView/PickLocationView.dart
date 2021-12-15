// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationPicker.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/saveLocationDailog.dart';

enum PickLocationMode { AddNewLocation, EditLocation }

class PickLocationView extends StatefulWidget {
  final PickLocationMode? pickLocationMode;
  PickLocationView(this.pickLocationMode);
  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  final LocationPickerController locationPickerController =
      LocationPickerController();
  // Location? locationPickerController.location;
  SavedLocation? savedLocation;
  bool showBlackScreen = true;

  LanguageController _lang = Get.find<LanguageController>();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  void onPickButtonClick(BuildContext context) async {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      var resault = await savedLocationDailog(
          context: context, function: () => mezDbgPrint("hey bro"));
      if (resault != null && resault != "") {
        mezDbgPrint("the choosen name is $resault");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            locationPickerController.location.value!.latitude!,
            locationPickerController.location.value!.longitude!));
        locationPickerController.location.value!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${locationPickerController.location.value!.latitude}, ${locationPickerController.location.value!.longitude}";

        savedLocation = SavedLocation(
            name: resault, location: locationPickerController.location.value!);

        customerAuthController.saveNewLocation(savedLocation!);

        Get.back(result: savedLocation);
      }
    } else {
      var resault = await savedLocationDailog(
          context: context,
          function: () => mezDbgPrint("hey bro"),
          nameVal: savedLocation!.name);
      if (resault != null && resault != "") {
        mezDbgPrint("the choosen name is $resault");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            locationPickerController.location.value!.latitude!,
            locationPickerController.location.value!.longitude!));
        locationPickerController.location.value!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${locationPickerController.location.value!.latitude}, ${locationPickerController.location.value!.longitude}";

        savedLocation = SavedLocation(
            id: savedLocation!.id,
            name: resault,
            location: locationPickerController.location.value!);

        customerAuthController.editLocation(savedLocation!);

        Get.back();
      }
    }
  }

  @override
  void initState() {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      GeoLoc.Location().getLocation().then((locData) {
        mezDbgPrint("Sat to current Location $locData!");
        setState(() {
          locationPickerController.setLocation(Location.fromFirebaseData({
            "address": "",
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

      mezDbgPrint(
          "the value sanded is ${savedLocation!.toFirebaseFormattedJson()}");
      GeoLoc.Location().getLocation().then((locData) {
        mezDbgPrint("Sat to current Location $locData!");
        setState(() {
          locationPickerController.location.value = Location.fromFirebaseData({
            "address": "${savedLocation!.location?.address}",
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
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      bottomNavigationBar: ButtonComponent(
        function: () => onPickButtonClick(context),
        widget: Center(
            child: Text("Pick Location",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white))),
      ),
      resizeToAvoidBottomInset: false,
      appBar: CustomerAppBar(
        autoBack: true,
        title: "Pick location",
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: LocationSearchComponent(
                  label: "",
                  text: locationPickerController.location.value?.address,
                  onClear: () {},
                  notifyParent: (Location? location) {
                    mezDbgPrint(
                        "Ontap on suggestion  => ${location?.toJson()} ");
                    setState(() {
                      this.showBlackScreen = showBlackScreen;
                      locationPickerController.setLocation(location!);
                    });
                  }),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                  "Search for specefic location or you can just mark your location and click pick location"),
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
                      locationPickerMapController:
                          this.locationPickerController,
                      notifyParentOfConfirm: (_) {},
                      notifyParentOfLocationFinalized: (Location location) {
                        setState(() {
                          this.showBlackScreen = showBlackScreen;
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
      ),
    );
  }
}
