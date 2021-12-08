// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  Location? _selectedLocation;
  SavedLocation? savedLocation;
  bool showBlackScreen = true;

  LanguageController _lang = Get.find<LanguageController>();
  CustomerAuthController customerAuthController =
      Get.find<CustomerAuthController>();

  void onPickButtonClick() async {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      var resault =
          await savedLocationDailog(function: () => mezDbgPrint("hey bro"));
      if (resault != null && resault != "") {
        mezDbgPrint("the choosen name is $resault");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            _selectedLocation!.latitude!, _selectedLocation!.longitude!));
        _selectedLocation!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}";

        savedLocation =
            SavedLocation(name: resault, location: _selectedLocation!);

        customerAuthController.saveNewLocation(savedLocation!);

        Get.back(result: savedLocation);
      }
    } else {
      var resault = await savedLocationDailog(
          function: () => mezDbgPrint("hey bro"), nameVal: savedLocation!.name);
      if (resault != null && resault != "") {
        mezDbgPrint("the choosen name is $resault");
        String? address = await MapHelper.getAdressFromLatLng(LatLng(
            _selectedLocation!.latitude!, _selectedLocation!.longitude!));
        _selectedLocation!.address = address ??
            "${_lang.strings['shared']['pickLocation']['address']} : ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}";

        savedLocation = SavedLocation(
            id: savedLocation!.id, name: resault, location: _selectedLocation!);

        customerAuthController.editLocation(savedLocation!);

        Get.back();
      }
    }
    // Get.back();
    // mezDbgPrint(
    //     "Last Location Stored Address ==> ${_selectedLocation!.address}");
    // mezDbgPrint("Last Location Stored Lat ==> ${_selectedLocation!.latitude}");
    // mezDbgPrint("Last Location Stored Lng ==> ${_selectedLocation!.longitude}");
    // if (_selectedLocation!.address == "") {

    // }

    // Get.back<Location>(result: _selectedLocation, closeOverlays: true);
  }

  @override
  void initState() {
    if (widget.pickLocationMode == PickLocationMode.AddNewLocation) {
      GeoLoc.Location().getLocation().then((locData) {
        mezDbgPrint("Sat to current Location $locData!");
        setState(() {
          _selectedLocation = Location.fromFirebaseData({
            "address": "",
            "lat": locData.latitude,
            "lng": locData.longitude,
          });
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
          _selectedLocation = Location.fromFirebaseData({
            "address": "${savedLocation!.location.address}",
            "lat": savedLocation!.location.latitude,
            "lng": savedLocation!.location.longitude,
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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(_lang.strings["shared"]["pickLocation"]["address"],
                  style: TextStyle(fontFamily: "psb", fontSize: 12)),
            ),
            SizedBox(
              height: 2,
            ),
            // column
            Container(
              padding: EdgeInsets.only(top: 10),
              child: LocationSearchComponent(
                  label: "",
                  text: _selectedLocation?.address,
                  onClear: () {},
                  notifyParent: (Location? location) {
                    mezDbgPrint(
                        "Ontap on suggestion  => ${location?.toJson()} ");
                    setState(() {
                      this.showBlackScreen = showBlackScreen;
                      _selectedLocation = location;
                    });
                  }),
            ),
            // stack
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200),
                      child:
                          // _selectedLocation != null
                          //     ? MezPickGoogleMap(
                          //         showBlackScreen: showBlackScreen,
                          //         notifyParent: (Location location) {
                          //           setState(() {
                          //             this.showBlackScreen = showBlackScreen;
                          //             _selectedLocation = location;
                          //           });
                          //         },
                          //         location: LatLng(_selectedLocation!.latitude,
                          //             _selectedLocation!.longitude))
                          //     :
                          Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 1,
                        ),
                      ),
                    ))),
            Container(
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
                          MaterialStateProperty.all(Colors.transparent)

                      // MaterialStateProperty.all(Color(0xffa8a8a8)),
                      ),
                  onPressed: onPickButtonClick,
                  child: Text(_lang.strings["shared"]["pickLocation"]["pick"],
                      style: TextStyle(
                        fontFamily: 'psr',
                        color: Colors.white,
                        fontSize: 18.sp,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
