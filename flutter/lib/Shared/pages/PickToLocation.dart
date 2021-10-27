import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickToLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


// init
// load marker
// center marker in current location (MezGoogleMap  Interaction)
// show move the map to pick location with black overlay (has to be reusable)
// on click pick location
//    get center from map, geocode to an address (MezGoogleMap  Interaction)
//    construct Location object with lat, lng and address and return


// search bar
//  on type
//      fetch results from google and display
//      on click result
//         then we center the map to result location (MezGoogleMap  Interaction)
//         show move the map to pick location with black overlay (has to be reusable)
//         on click pick location
//            get center from map, geocode to an address (MezGoogleMap  Interaction)
//            construct Location object with lat, lng and address and return