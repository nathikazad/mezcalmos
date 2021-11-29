import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/componenets/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/LocationPicker.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  // MyPopupMenuController _popUpController = MyPopupMenuController();
  late SearchComponentType _currentFocusedTextField;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.find<TaxiController>();
  LocationPickerController locationPickerController =
      LocationPickerController();
  LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();

  /******************************  Init and build function ************************************/

  @override
  void initState() {
    _currentFocusedTextField = SearchComponentType.From;
    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      MapHelper.getAdressFromLatLng(
              LatLng(locData.latitude!, locData.longitude!))
          .then((address) {
        taxiRequest.value.from = Location(
            address ??
                "${locData.latitude.toString()}, ${locData.longitude.toString()}",
            locData);
        updateModelAndMarker(SearchComponentType.From, taxiRequest.value.from!);
        locationPickerController.setLocation(taxiRequest.value.from!);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 1, right: 1),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: LocationPicker(
                      myLocationButtonEnabled: false,
                      blackScreenBottomTextMargin: 110,
                      locationPickerMapController:
                          this.locationPickerController,
                      notifyParentOfLocationFinalized:
                          updateModelAndMaybeCalculateRoute,
                      notifyParentOfConfirm: requestTaxi)),
              Container(
                height: 40,
                width: Get.width,
                color: Colors.white,
              ),
              LocationSearchBar(
                  request: taxiRequest,
                  locationSearchBarController: locationSearchBarController,
                  newLocationChosenEvent:
                      updateModelAndHandoffToLocationPicker),
            ]),
      ),
    );
  }

/******************************  EVENT HANDLERS ************************************/
// when one of the dropdowns (pick current location, a saved location or a places suggestion clicked)
  void updateModelAndHandoffToLocationPicker(
      Location? newLocation, SearchComponentType textFieldType) {
    if (newLocation != null) {
      _currentFocusedTextField = textFieldType;
      updateModelAndMarker(textFieldType, newLocation);
      locationPickerController.setLocation(newLocation);
      locationPickerController.showFakeMarkerAndPickButton();
    } else {
      // Location cleared
      locationPickerController.removeMarker(textFieldType.toShortString());
      locationPickerController.showGrayedOutButton();
    }
    locationSearchBarController.collapseDropdown();
    locationPickerController.clearPolyline();
  }

// after pick button is clicked after user verifies gps locaiton
  void updateModelAndMaybeCalculateRoute(Location newLocation) {
    updateModelAndMarker(_currentFocusedTextField, newLocation);
    if (taxiRequest.value.isFromToSet()) {
      updateRouteInformation();
      locationPickerController.showConfirmButton();
    } else {
      locationPickerController.showGrayedOutButton();
    }
  }

// after confirm button is clicked on mez pick google map
  void requestTaxi() async {
    // build order and call controller function
    ServerResponse response = await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      // we do not pop the RequestTaxiView because the user can cancel after and then we just have to pop the viewOrderRoute
      popEverythingAndNavigateTo(getTaxiOrderRoute(response.data["orderId"]));
      mezcalmosSnackBar("Success :)", response.errorMessage!,
          position: SnackPosition.TOP);
    } else {
      mezcalmosSnackBar("Error :(", "Failed to request a taxi !",
          position: SnackPosition.TOP);
      mezDbgPrint("Error requesting the taxi : ${response.toString()}");
    }
  }

/******************************  Helper function ************************************/
  void updateModelAndMarker(
      SearchComponentType textFieldType, Location newLocation) async {
    if (textFieldType == SearchComponentType.From) {
      taxiRequest.value.setFromLocation(newLocation);
      locationPickerController.addOrUpdateUserMarker(
          textFieldType.toShortString(), newLocation.toLatLng());
    } else {
      taxiRequest.value.setToLocation(newLocation);
      locationPickerController.addOrUpdatePurpleDestinationMarker(
          textFieldType.toShortString(), newLocation.toLatLng());
    }
  }

  void updateRouteInformation() async {
    MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        taxiRequest.value.from!, taxiRequest.value.to!);
    if (route != null) {
      int estimatedPrice =
          getEstimatedRidePriceInPesos(route.distance.distanceInMeters);
      taxiRequest.value.distance = route.distance;
      taxiRequest.value.duration = route.duration;
      taxiRequest.value.estimatedPrice = estimatedPrice;
      taxiRequest.value.polyline = route.encodedPolyLine;
      locationPickerController.addPolyline(route.polylineList);
    } else {
      // TODO:handle route error
    }
  }

  int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    // 35 is always the minimum possible price !
    return 35;
  }
}
