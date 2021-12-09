// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
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
  Location? _selectedLocation;
  SavedLocation? savedLocation;
  bool showBlackScreen = true;

  LanguageController _lang = Get.find<LanguageController>();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  void onPickButtonClick() async {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      // var resault =
      //     await savedLocationDailog(function: () => mezDbgPrint("hey bro"));
      if (locationNameTxtController.text != null &&
          locationNameTxtController != "") {
        mezDbgPrint("the choosen name is ${locationNameTxtController.text}");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            locationPickerController.location.value!.latitude!,
            locationPickerController.location.value!.longitude!));
        locationPickerController.location.value!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${locationPickerController.location.value!.latitude}, ${locationPickerController.location.value!.longitude}";

        savedLocation = SavedLocation(
            name: locationNameTxtController.text.trim(),
            location: locationPickerController.location.value!);

        customerAuthController.saveNewLocation(savedLocation!);

        Get.back(result: savedLocation);
      }
    } else {
      // var resault = await savedLocationDailog(
      //     function: () => mezDbgPrint("hey bro"), nameVal: savedLocation!.name);
      if (locationNameTxtController.text != null &&
          locationNameTxtController.text != "") {
        mezDbgPrint("the choosen name is ${locationNameTxtController.text}");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            locationPickerController.location.value!.latitude!,
            locationPickerController.location.value!.longitude!));
        locationPickerController.location.value!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${locationPickerController.location.value!.latitude}, ${locationPickerController.location.value!.longitude}";

        savedLocation = SavedLocation(
            id: savedLocation!.id,
            name: locationNameTxtController.text,
            location: locationPickerController.location.value!);

        customerAuthController.editLocation(savedLocation!);

        Get.back();
      }
    }
    // Get.back();
    // mezDbgPrint(
    //     "Last Location Stored Address ==> ${locationPickerController.location!.address}");
    // mezDbgPrint("Last Location Stored Lat ==> ${locationPickerController.location!.latitude}");
    // mezDbgPrint("Last Location Stored Lng ==> ${locationPickerController.location!.longitude}");
    // if (locationPickerController.location!.address == "") {

    // }

    // Get.back<Location>(result: locationPickerController.location, closeOverlays: true);
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
            "address": "${savedLocation!.location.address}",
            "lat": savedLocation!.location.latitude,
            "lng": savedLocation!.location.longitude,
          });
        });
      });

      locationNameTxtController.text = savedLocation!.name;
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final TextEditingController locationNameTxtController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    responsiveSize(context);
    return Scaffold(
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(bottom: 30),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     gradient: LinearGradient(colors: [
      //       Color.fromRGBO(81, 132, 255, 1),
      //       Color.fromRGBO(206, 73, 252, 1)
      //     ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      //   ),
      //   child: TextButton(
      //       style: ButtonStyle(
      //           fixedSize: MaterialStateProperty.all(Size(Get.width,
      //               getSizeRelativeToScreen(20, Get.height, Get.width))),
      //           backgroundColor: MaterialStateProperty.all(Colors.transparent)

      //           // MaterialStateProperty.all(Color(0xffa8a8a8)),
      //           ),
      //       onPressed: onPickButtonClick,
      //       child: Text(_lang.strings["shared"]["pickLocation"]["pick"],
      //           style: TextStyle(
      //             fontFamily: 'psr',
      //             color: Colors.white,
      //             fontSize: 18.sp,
      //           ))),
      // ),
      resizeToAvoidBottomInset: false,
      appBar: CustomerAppBar(
        title: widget.pickLocationMode == PickLocationMode.AddNewLocation
            ? "Add Location"
            : "Edit Location",
        autoBack: true,
      ),
      bottomNavigationBar: ButtonComponent(
        widget: Center(
          child: Text(
            widget.pickLocationMode == PickLocationMode.AddNewLocation
                ? "Save Location"
                : "Edit Location",
            style: txt.headline1!.copyWith(color: Colors.white),
          ),
        ),
        // bgColor: (locationNameTxtController.text == "") ? Colors.grey[300]: Color.fromRGBO(172, 89, 252, 1),
        function: onPickButtonClick,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                widget.pickLocationMode == PickLocationMode.AddNewLocation
                    ? "Save new location"
                    : "Edit ${savedLocation!.name} location",
                style: txt.headline1!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 10),
            //   child: Text(_lang.strings["shared"]["pickLocation"]["address"],
            //       style: TextStyle(fontFamily: "psb", fontSize: 12)),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 45,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Center(
                child: TextField(
                  controller: locationNameTxtController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Location Name",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(141, 141, 141, 1),
                        fontSize: 13.33,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // column
            Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: LocationSearchComponent(
                  label: "",
                  text: locationPickerController.location.value?.address,
                  bgColor: Colors.white,
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
            // stack
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200),
                      child: locationPickerController.location != null
                          ? LocationPicker(
                              showBottomButton: false,
                              locationPickerMapController:
                                  this.locationPickerController,
                              notifyParentOfConfirm: (_) {},
                              notifyParentOfLocationFinalized:
                                  (Location location) {
                                setState(() {
                                  this.showBlackScreen = showBlackScreen;
                                  locationPickerController
                                      .setLocation(location);
                                });
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 1,
                              ),
                            ),
                    ))),
          ],
        ),
      ),
    );
  }
}
