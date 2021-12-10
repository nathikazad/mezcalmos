import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/MapBottomBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart' as TaxiOrder;
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/LocationPicker.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  // MyPopupMenuController _popUpController = MyPopupMenuController();
  SearchComponentType _currentFocusedTextField = SearchComponentType.From;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.find<TaxiController>();
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();

  /******************************  Init and build function ************************************/

  @override
  void initState() {
    // set the location Enabled Button to be false
    locationPickerController.myLocationButtonEnabled.value = false;
    // set blackScreenBottom 110
    locationPickerController.blackScreenBottomTextMargin.value = 110;

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
        setState(() {});
        locationPickerController.setLocation(taxiRequest.value.from!);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back),
      //  AppBar(),
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
                      locationPickerMapController:
                          this.locationPickerController,
                      notifyParentOfLocationFinalized:
                          updateModelAndMaybeCalculateRoute,
                      notifyParentOfConfirm: (Location? _) async =>
                          await requestTaxi(_))),
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
              taxiRequest.value.isFromToSet()
                  ? MapBottomBar(taxiRequest: taxiRequest)
                  : SizedBox()
            ]),
      ),
    );
  }

/******************************  EVENT HANDLERS ************************************/
// when one of the dropdowns (pick current location, a saved location or a places suggestion clicked)
  void updateModelAndHandoffToLocationPicker(
      Location? newLocation, SearchComponentType textFieldType) {
    mezDbgPrint(
        "updateModelAndHandoffToLocationPicker textFieldType ===> $textFieldType");
    mezDbgPrint(
        "updateModelAndHandoffToLocationPicker Address ===> ${newLocation?.address}");
    if (newLocation != null) {
      _currentFocusedTextField = textFieldType;
      updateModelAndMarker(textFieldType, newLocation);
      locationPickerController.setLocation(newLocation);
      locationPickerController.showFakeMarkerAndPickButton();
    } else {
      // Location cleared
      locationPickerController.removeMarker(textFieldType.toShortString());
      locationPickerController.showGrayedOutButton();
      mezDbgPrint("showGrayedOutButton");
    }
    locationSearchBarController.collapseDropdown();
    locationPickerController.clearPolyline();
    setState(() {});
  }

// after pick button is clicked after user verifies gps locaiton
  void updateModelAndMaybeCalculateRoute(Location newLocation) {
    locationPickerController.showOrHideBlackScreen(true);
    updateModelAndMarker(_currentFocusedTextField, newLocation);
    if (taxiRequest.value.isFromToSet()) {
      updateRouteInformation();
      locationPickerController.showConfirmButton();
      mezDbgPrint("++showConfirmButton");
    } else {
      mezDbgPrint("showGrayedOutButton");
      locationPickerController.showGrayedOutButton();
    }
    setState(() {});
  }

// after confirm button is clicked on mez pick google map
  Future<void> requestTaxi(Location? loc) async {
    // build order and call controller function
    ServerResponse response = await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      String orderId = response.data["orderId"];
      // in case the widget is still mounted , then make dart scheduale this delayed call as soon as possible ,
      // so we don't fall into assertion error ('!_debugLocked': is not true.)
      Future.delayed(Duration.zero,
          () => popEverythingAndNavigateTo(getTaxiOrderRoute(orderId))
          // popUntilAndNavigateTo(kHomeRoute, getTaxiOrderRoute(oid))
          );
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
          markerId: textFieldType.toShortString(),
          latLng: newLocation.toLatLng());
    }
    setState(() {});
  }

  void updateRouteInformation() async {
    MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        taxiRequest.value.from!, taxiRequest.value.to!);
    if (route != null) {
      int estimatedPrice =
          getEstimatedRidePriceInPesos(route.distance.distanceInMeters);
      taxiRequest.value.setRouteInformation(TaxiOrder.RouteInformation(
          polyline: route.encodedPolyLine,
          distance: route.distance,
          duration: route.duration));
      mezDbgPrint("Polyliiines ====> ${route.polylineList}");
      mezDbgPrint("Polyliiines ====> ${taxiRequest.value.toString()}");
      locationPickerController.addPolyline(route.polylineList);
      // #question @saad why is there a set state here?
      // taxiRequest is obx and locationPickcontroller will calls
    } else {
      // TODO:handle route error
    }
  }

  int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    // 35 is always the minimum possible price !
    return 35;
  }
}
