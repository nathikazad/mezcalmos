import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class ServiceLocationCard extends StatefulWidget {
  const ServiceLocationCard({Key? key, required this.location})
      : super(key: key);

  final Location location;

  @override
  State<ServiceLocationCard> createState() => _ServiceLocationCardState();
}

class _ServiceLocationCardState extends State<ServiceLocationCard> {
  // MGoogleMapController mapController = MGoogleMapController();

  LatLng? restaurantLatLng;
  @override
  void initState() {
    // TODO: implement initState
    if (getRestaurantLatLng() != null) {
      //initRestaurantLocationMapController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.location != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '${_i18n()["location"]}',
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              widget.location.address,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromRGBO(120, 120, 120, 1),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // IgnorePointer(
          //   ignoring: true,
          //   child: Card(
          //     child: Container(
          //       decoration:
          //           BoxDecoration(borderRadius: BorderRadius.circular(10)),
          //       height: 35.h,
          //       width: double.infinity,
          //       //child: MGoogleMap(mGoogleMapController: mapController),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      );
    } else {
      return Container();
    }
  }

//   void initRestaurantLocationMapController() {
//     // mapController.periodicRerendering.value = false;
//     mapController.recenterButtonEnabled.value = false;
//     mapController.minMaxZoomPrefs = MinMaxZoomPreference(15.1, 15.2);
//     // centering the map on the location marker
//     mapController.setLocation(widget.location);

//     mapController.addOrUpdatePurpleDestinationMarker(
//         latLng: getRestaurantLatLng()!);
// //TODO @m66are disable recentre button  enable mez pointer
//     //  mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
//     // mapController.animateMarkersPolyLinesBounds.value = true;
//   }

  LatLng? getRestaurantLatLng() {
    if (widget.location.latitude != null && widget.location.longitude != null) {
      return LatLng(widget.location.latitude!, widget.location.longitude!);
    }
    return null;
  }
}
