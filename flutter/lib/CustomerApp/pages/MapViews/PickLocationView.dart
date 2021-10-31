// Example of the View
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezPickGoogleMap.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class PickLocationView extends StatefulWidget {
  @override
  _PickLocationViewState createState() => _PickLocationViewState();
}

class _PickLocationViewState<T> extends State<PickLocationView> {
  Location? _selectedLocation;

  void onPickButtonClick() {
    Get.back<Location>(result: _selectedLocation, closeOverlays: true);
  }

  @override
  void initState() {
    GeoLoc.Location().getLocation().then((locData) {
      mezDbgPrint("Sat to current Location $locData!");
      setState(() {
        _selectedLocation = Location({
          "address": "Current Location",
          "lat": locData.latitude,
          "lng": locData.longitude,
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text("Address",
                  style: TextStyle(fontFamily: "psb", fontSize: 12)),
            ),
            SizedBox(
              height: 2,
            ),
            // column
            Container(
              padding: EdgeInsets.only(top: 10),
              child: LocationSearchComponent(
                  label: "To",
                  onClear: () {},
                  notifyParent: (Location location) {
                    mezDbgPrint(
                        "Ontap on suggestion  => ${location.toJson()} ");
                    setState(() {
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
                      child: _selectedLocation != null
                          ? MezPickGoogleMap(
                              location: LatLng(_selectedLocation!.latitude,
                                  _selectedLocation!.longitude))
                          : Center(
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
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: onPickButtonClick,
                  child: Text("Pick",
                      style: TextStyle(
                        fontFamily: 'psr',
                        color: Colors.white,
                        fontSize: 18,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
