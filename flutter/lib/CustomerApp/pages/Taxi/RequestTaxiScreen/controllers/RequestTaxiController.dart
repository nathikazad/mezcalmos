import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:location/location.dart' as GeoLoc;

class RequestTaxiController {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();
  final TaxiController controller = Get.put<TaxiController>(TaxiController());
  final LanguageController languageController = Get.find<LanguageController>();
  final OrderController orderController = Get.find<OrderController>();

  Rx<SearchComponentType> currentFocusedTextField =
      SearchComponentType.From.obs;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  RxBool pickedFromTo = false.obs;
  Timer? timer;

  /// this is called at initState time , loads up the map and set the current location as the user's current loc.
  void initiateViewAndMapWithCurrentLocation() {
    locationPickerController.setOnMapTap(onTap: () {
      locationSearchBarController.unfocusAllFocusNodes.call();
    });

    // set current SearchComponent:
    locationSearchBarController.focusedTextField.value =
        currentFocusedTextField.value;
    // set the location Enabled Button to be false
    locationPickerController.myLocationButtonEnabled.value = false;
    // set blackScreenBottom 110
    locationPickerController.blackScreenBottomTextMargin.value = 80;

    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      taxiRequest.value.from = Location("", locData);
      updateModelAndMarker(SearchComponentType.From, taxiRequest.value.from!);
      locationPickerController.setLocation(taxiRequest.value.from!);
    });
  }

  /// this is called at initState time , when there a TaxiOrder that the user want to re-create.
  void initiateTaxiOrderReCreation(TaxiRequest orderToReCreate) {
    taxiRequest.value = orderToReCreate;

    locationPickerController.setOnMapTap(onTap: () {
      locationSearchBarController.unfocusAllFocusNodes.call();
    });

    // set current SearchComponent:
    locationSearchBarController.focusedTextField(currentFocusedTextField.value);
    // set the location Enabled Button to be false
    locationPickerController.myLocationButtonEnabled.value = false;
    // set blackScreenBottom 110

    locationPickerController.blackScreenBottomTextMargin.value = 80;

    updateModelAndMarker(SearchComponentType.From, taxiRequest.value.from!);
    locationPickerController.setLocation(taxiRequest.value.from!);
    locationPickerController.addOrUpdateUserMarker(
        markerId: SearchComponentType.From.toShortString(),
        latLng: LatLng(taxiRequest.value.from!.latitude,
            taxiRequest.value.from!.longitude));

    updateModelAndMarker(SearchComponentType.To, taxiRequest.value.to!);
    locationPickerController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(taxiRequest.value.to!.position.latitude!,
            taxiRequest.value.to!.position.longitude!));
    locationPickerController.hideFakeMarker();
    locationPickerController.setAnimateMarkersPolyLinesBounds(true);
    locationPickerController.animateAndUpdateBounds();
    updateRouteInformation()
        .then((value) => locationPickerController.showConfirmButton());

    pickedFromTo.value = true;
  }

  /// Calls `TaxiController.fecthOnlineTaxiDrivers` and check if within 5KM then returns the driver.
  void startFetchingOnlineDrivers() {
    controller.fecthOnlineTaxiDrivers().then((drivers) {
      // Weo loop throught each driver and we call the mgoogleMap refresh from withing the controller
      drivers.forEach((driver) {
        mezDbgPrint("======= [ driver ] ====== ${driver.toJson()}");
        LatLng driverLocation =
            LatLng(driver.position['lat'], driver.position['lng']);

        bool isWithinRange = MapHelper.calculateDistance(
                Location.buildLocationData(
                    driverLocation.latitude, driverLocation.longitude),
                Location.buildLocationData(
                    locationPickerController.location.value!.latitude,
                    locationPickerController.location.value!.longitude)) <=
            5;

        if (isWithinRange) {
          mezDbgPrint(
              "[xdbg]Adding marker with driver name === ${driver.name} | id ${driver.taxiId}");
          locationPickerController.addOrUpdateTaxiDriverMarker(
              driver.taxiId, driverLocation,
              markerTitle: driver.name);
        }
        // we remove if there is already
        else {
          locationPickerController.removeMarkerById(driver.taxiId);
        }
      });
    });
  }

/******************************  EVENT HANDLERS ************************************/
// when one of the dropdowns (pick current location, a saved location or a places suggestion clicked)
  void updateModelAndHandoffToLocationPicker(
      Location? newLocation, SearchComponentType textFieldType) {
    // locationPickerController.removeCircleMarker();
    if (newLocation != null) {
      currentFocusedTextField.value = textFieldType;
      updateModelAndMarker(textFieldType, newLocation);
      locationPickerController.setLocation(newLocation);
      locationPickerController.moveToNewLatLng(
          newLocation.latitude, newLocation.longitude);
      locationPickerController.showFakeMarkerAndPickButton();
      locationPickerController.showOrHideBlackScreen(true);
    } else {
      // Location cleared
      locationPickerController.removeMarkerById(textFieldType.toShortString());
      locationPickerController.showGrayedOutButton();
      pickedFromTo.value = false;
    }
    locationSearchBarController.collapseDropdown();
    locationPickerController.clearPolyline();
  }

// after pick button is clicked after user verifies gps locaiton
  void updateModelAndMaybeCalculateRoute(Location newLocation) {
    locationPickerController.showOrHideBlackScreen(false);

    updateModelAndMarker(currentFocusedTextField.value, newLocation);
    if (taxiRequest.value.isFromToSet()) {
      locationPickerController.setAnimateMarkersPolyLinesBounds(true);
      locationPickerController.animateAndUpdateBounds();
      updateRouteInformation()
          .then((value) => locationPickerController.showConfirmButton());
      pickedFromTo.value = true;
    } else {
      locationPickerController.setAnimateMarkersPolyLinesBounds(false);
      locationPickerController.showGrayedOutButton();
      // locationPickerController.removeCircleMarker();
      pickedFromTo.value = true;
    }
  }

  /// Call this right after customer presses Confirm button
  /// Uses : Make sure that the order has been successfully written to database + already consumed by the listener.
  Future<void> waitForCurrentOrderStreamFirstTrigger(String orderId) async {
    if (Get.find<OrderController>().getOrder(orderId) == null) {
      mezDbgPrint(
          "[+] s@@d ==> [ REQUEST TAXI ORDER ]  RACING CONDITION HAPPENING ... ");
      await Get.find<OrderController>()
          .getCurrentOrderStream(orderId)
          .firstWhere((order) => order != null);
    } else
      mezDbgPrint(
          "[+] s@@d ==> [ REQUEST TAXI ORDER ] NO RACING CONDITION HAPPEND ! ");
  }

  // after confirm button is clicked on mez pick google map
  Future<void> requestTaxi() async {
    // we show grayed Confirm button so the user won't press it twice.
    this.locationPickerController.showLoadingIconOnConfirm();

    // build order and call controller function
    ServerResponse response = await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      String orderId = response.data["orderId"];
      await waitForCurrentOrderStreamFirstTrigger(orderId);
      // in case the widget is still mounted , then make dart scheduale this delayed call as soon as possible ,
      // so we don't fall into assertion error ('!_debugLocked': is not true.)
      await Future.delayed(Duration.zero, () {
        popEverythingAndNavigateTo(getTaxiOrderRoute(orderId));
      });
    } else {
      MezSnackbar(
          "Oops :(",
          Get.find<LanguageController>().strings['customer']['taxiView']
              ['failedToRequestTaxi'],
          position: SnackPosition.TOP);
      this.locationPickerController.showConfirmButton();
    }
  }

/******************************  Helper function ************************************/
  void updateModelAndMarker(
      SearchComponentType textFieldType, Location newLocation) async {
    if (textFieldType == SearchComponentType.From) {
      taxiRequest.value.setFromLocation(newLocation);
      locationPickerController.addOrUpdateUserMarker(
          markerId: textFieldType.toShortString(),
          latLng: newLocation.toLatLng());
    } else {
      taxiRequest.value.setToLocation(newLocation);
      locationPickerController.addOrUpdatePurpleDestinationMarker(
          markerId: textFieldType.toShortString(),
          latLng: newLocation.toLatLng());
    }
  }

  void onSuccessSignInUpdateUserMarker() {
    locationPickerController.addOrUpdateUserMarker(
        markerId: SearchComponentType.From.toShortString(),
        latLng: taxiRequest.value.from!.toLatLng());
  }

  Future<void> updateRouteInformation() async {
    MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        taxiRequest.value.from!, taxiRequest.value.to!);
    if (route != null) {
      int estimatedPrice =
          getEstimatedRidePriceInPesos(route.distance.distanceInMeters);
      taxiRequest.value.setEstimatedPrice(estimatedPrice);
      locationPickerController.addPolyline(route.polylineList);
      taxiRequest.value.setRouteInformation(MapHelper.RouteInformation(
          polyline: route.encodedPolyLine,
          distance: route.distance,
          duration: route.duration));
    } else {
      // TODO:handle route error
    }
  }

  int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    int roundedKm = (distanceInMeteres / 1000).round();
    return roundedKm <= 1 ? 35 : roundedKm * 15;
  }

  void dispose() {
    timer?.cancel();
    timer = null;
  }
}
