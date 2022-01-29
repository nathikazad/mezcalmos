import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as geoloc;
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/widgets/LocationSearchComponent.dart';

class LaundryPickLocView extends StatefulWidget {
  LaundryPickLocView({
    Key? key,
  }) : super(key: key);

  @override
  State<LaundryPickLocView> createState() => _LaundryPickLocViewState();
}

class _LaundryPickLocViewState extends State<LaundryPickLocView> {
  Location? currentLoc;
  final LocationPickerController locationPickerController =
      LocationPickerController();

  LanguageController lang = Get.find<LanguageController>();
  @override
  void initState() {
    geoloc.Location().getLocation().then((value) {
      LatLng currentLatLng = LatLng(value.latitude!, value.longitude!);
      geoCodeAndSetLocation(currentLatLng);
    });

    super.initState();
  }

  Future<void> geoCodeAndSetLocation(LatLng currentLoc) async {
    String? address = await getAdressFromLatLng(currentLoc);
    locationPickerController.setLocation(Location.fromFirebaseData({
      "address": address ??
          currentLoc.latitude.toString() + ", ${currentLoc.longitude}",
      "lat": currentLoc.latitude,
      "lng": currentLoc.longitude,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
            onPressed: () async {
              LatLng mapCenter = await locationPickerController.getMapCenter();

              if (mapCenter != locationPickerController.location.value) {
                await geoCodeAndSetLocation(mapCenter);
                mezDbgPrint(
                    'Else mapCenter : $mapCenter  ##### ${locationPickerController.location.value}');

                Get.back<Location>(
                    result: locationPickerController.location.value);
              }
            },
            child: Container(
              child: Text('Pick Location'),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child:
                Text(lang.strings["customer"]["pickLocation"]["pickLabele"]),
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
                  mezDbgPrint(
                      "Ontap on suggestion  => ${location?.toJson()} ");
                  setState(() {
                    locationPickerController.setLocation(location!);
                    locationPickerController.moveToNewLatLng(
                        location.latitude, location.longitude);
                    currentLoc = location;
                  });
                }),
          ),
          SizedBox(
            height: 10,
          ),
          // stack
          Obx(
            () => Expanded(
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
                        mezDbgPrint(
                            '#############SETTing location ${location}');
                        setState(() {
                          locationPickerController.setLocation(location);
                          currentLoc = location;
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
          ),
        ],
      ),
    );
  }
}
