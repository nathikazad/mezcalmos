import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:location/location.dart' as GeoLoc;

typedef SearchLocationNotifier = void Function(
    Location? location, SearchComponentType locationType);

enum DropDownState { Expand, Collapse }

class LocationDropDownItem {
  final String title;
  final Icon icon;
  final VoidCallback function;

  LocationDropDownItem(
      {required this.icon, required this.function, required this.title});
}

class LocationChoicesDropDown extends StatefulWidget {
  SearchLocationNotifier eventNotifier;
  DropDownState initialDropDownState;
  LocationChoicesDropDown(this.eventNotifier,
      {this.initialDropDownState = DropDownState.Collapse});

  @override
  LocationChoicesDropDownState createState() => LocationChoicesDropDownState();
}

class LocationChoicesDropDownState extends State<LocationChoicesDropDown> {
  LanguageController _lang = Get.find<LanguageController>();
  CustomerAuthController _authController = Get.find<CustomerAuthController>();
  SearchComponentType textFieldType = SearchComponentType.From;

  double getHeightByDropDownState() {
    return widget.initialDropDownState == DropDownState.Expand ? 100 : 0;
  }

  List<LocationDropDownItem> _dropDownItems = [];

  List<LocationDropDownItem> getSavedLocationsWithCallbacks() {
    return _authController.customerRxn.value?.savedLocations
            .map<LocationDropDownItem>((e) {
          return LocationDropDownItem(
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              function: () {
                mezcalmosSnackBar(e.name, e.location.address);
                Location? _savedLoc = _authController.getLocationById(e.id!);
                widget.eventNotifier(_savedLoc, textFieldType);
              },
              title: e.name);
        }).toList() ??
        [];
  }

  Future<Location> getCurrentLocation() async {
    GeoLoc.LocationData res = (await GeoLoc.Location().getLocation());
    mezDbgPrint("Got current loc ====> $res");
    return Location("", res);
  }

  @override
  void initState() {
    // adding static ones first
    _dropDownItems.addAll([
      LocationDropDownItem(
          function: () async {
            widget.eventNotifier(await getCurrentLocation(), textFieldType);
          },
          title: "Current location",
          icon: Icon(Icons.location_on, color: Colors.purple)),
      LocationDropDownItem(
          function: () async {
            // we might just return a saved snapshot to reduce the await
            widget.eventNotifier(await getCurrentLocation(), textFieldType);
          },
          title: "Pick From Map",
          icon: Icon(Icons.location_searching_outlined, color: Colors.purple))
    ]);
    // adding dynamic savedLocations
    _dropDownItems.addAll(getSavedLocationsWithCallbacks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 68,
        left: 15,
        right: 15,
        child: AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            height: getHeightByDropDownState(),
            width: Get.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(0),
                )),
            child: Wrap(
              spacing: 20,
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                ..._dropDownItems.map<Widget>((e) => SizedBox(
                      // width: 20,
                      height: 20,
                      child: InkWell(
                        onTap: () => e.function(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            e.icon,
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              e.title,
                              style: TextStyle(fontFamily: 'psb'),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )));
  }
}
