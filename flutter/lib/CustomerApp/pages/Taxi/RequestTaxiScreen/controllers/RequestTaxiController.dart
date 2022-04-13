import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/OnlineTaxiDriver.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Taxi']['RequestTaxiScreen'];

class RequestTaxiController {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();
  final TaxiController controller = Get.put<TaxiController>(TaxiController());

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
        .then((_) => locationPickerController.showConfirmButton());

    pickedFromTo.value = true;
  }

  /// Calls `TaxiController.fecthOnlineTaxiDrivers` and check if within 5KM then returns the driver.
  void startFetchingOnlineDrivers() {
    controller.fecthOnlineTaxiDrivers().then((List<OnlineTaxiDriver> drivers) {
      // Weo loop throught each driver and we call the mgoogleMap refresh from withing the controller
      drivers.forEach((OnlineTaxiDriver driver) {
        mezDbgPrint("======= [ driver ] ====== ${driver.toJson()}");
        final LatLng driverLocation =
            LatLng(driver.position['lat'], driver.position['lng']);

        final bool isWithinRange = MapHelper.calculateDistance(
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
    mezDbgPrint(
        "zlaganga : $textFieldType | newLocationAddress : ${newLocation?.address}");

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
    currentFocusedTextField.refresh();
    taxiRequest.refresh();
    if (taxiRequest.value.isFromToSet()) {
      locationPickerController.setAnimateMarkersPolyLinesBounds(true);
      locationPickerController.animateAndUpdateBounds();
      updateRouteInformation()
          .then((_) => locationPickerController.showConfirmButton());
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
  // Future<void> waitForCurrentOrderStreamFirstTrigger(String orderId) async {
  //   if (Get.find<OrderController>().getOrder(orderId) == null) {
  //     mezDbgPrint(
  //         "[+] s@@d ==> [ REQUEST TAXI ORDER ]  RACING CONDITION HAPPENING ... ");
  //     await Get.find<OrderController>()
  //         ._getInProcessOrderStream(orderId)
  //         .firstWhere((Order? order) => order != null);
  //   } else
  //     mezDbgPrint(
  //         "[+] s@@d ==> [ REQUEST TAXI ORDER ] NO RACING CONDITION HAPPEND ! ");
  // }

  /// after confirm button is clicked on mez pick google map.
  ///
  /// return true if success , false else.
  Future<bool> requestTaxi() async {
    // we show grayed Confirm button so the user won't press it twice.
    locationPickerController.showLoadingIconOnConfirm();

    // build order and call controller function
    final ServerResponse response =
        await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      final String orderId = response.data["orderId"];
      // await waitForCurrentOrderStreamFirstTrigger(orderId);
      // in case the widget is still mounted , then make dart scheduale this delayed call as soon as possible ,
      // so we don't fall into assertion error ('!_debugLocked': is not true.)
      await Future<void>.delayed(Duration.zero, () {
        popEverythingAndNavigateTo(getTaxiOrderRoute(orderId));
      });
      return Future<bool>.value(true);
    } else {
      MezSnackbar("Oops :(", _i18n()['failedToRequestTaxi'],
          position: SnackPosition.TOP);
      locationPickerController.showConfirmButton();
      return Future<bool>.value(false);
    }
  }

/******************************  Helper function ************************************/
  void updateModelAndMarker(
      SearchComponentType textFieldType, Location newLocation) {
    if (textFieldType == SearchComponentType.From) {
      taxiRequest.value.setFromLocation(newLocation);
      //ignore_for_file:unawaited_futures
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
    final MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        taxiRequest.value.from!, taxiRequest.value.to!);
    if (route != null) {
      final int estimatedPrice =
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
    final int roundedKm = (distanceInMeteres / 1000).round();
    return roundedKm <= 1 ? 35 : roundedKm * 15;
  }

  void dispose() {
    timer?.cancel();
    timer = null;
  }
}
