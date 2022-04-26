import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class RestaurantLocationCard extends StatefulWidget {
  const RestaurantLocationCard({Key? key, required this.restaurant})
      : super(key: key);
  final Restaurant restaurant;

  @override
  State<RestaurantLocationCard> createState() => _RestaurantLocationCardState();
}

class _RestaurantLocationCardState extends State<RestaurantLocationCard> {
  MGoogleMapController mapController = MGoogleMapController();

  LatLng? restaurantLatLng;
  @override
  void initState() {
    // TODO: implement initState
    if (getRestaurantLatLng() != null) {
      initRestaurantLocationMapController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.restaurant.info.location != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '${_i18n()["location"]} :',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              widget.restaurant.info.location.address,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          IgnorePointer(
            ignoring: true,
            child: Card(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 40.h,
                width: double.infinity,
                child: MGoogleMap(mGoogleMapController: mapController),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void initRestaurantLocationMapController() {
    // mapController.periodicRerendering.value = false;
    mapController.recenterButtonEnabled.value = false;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference(15.5, 15.6);
    // centering the map on the location marker
    mapController.setLocation(widget.restaurant.info.location);

    mapController.addOrUpdatePurpleDestinationMarker(
        latLng: getRestaurantLatLng()!);
//TODO @m66are disable recentre button  enable mez pointer
    //  mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    // mapController.animateMarkersPolyLinesBounds.value = true;
  }

  LatLng? getRestaurantLatLng() {
    if (widget.restaurant.info.location.latitude != null &&
        widget.restaurant.info.location.longitude != null) {
      return LatLng(widget.restaurant.info.location.latitude!,
          widget.restaurant.info.location.longitude!);
    }
    return null;
  }
}
