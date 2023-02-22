import 'dart:async';
import 'package:get/get.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/old/customerApp/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/OnlineTaxiDriver.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Taxi']['RequestTaxiScreen'];

class RequestTaxiController {
  /// LocationPickerController
  final LocationPickerController locationPickerController =
      LocationPickerController(myLocationButtonEnabled: false)
        ..enableMezSmartPointer = false;

  /// LocationSearchBarController
  final LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();

  /// TaxiController
  final TaxiController controller = Get.put<TaxiController>(TaxiController());

  /// currentFocusedTextField
  Rx<SearchComponentType> currentFocusedTextField =
      SearchComponentType.From.obs;

  /// taxiRequest
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;

  /// pickedFromTo
  RxBool pickedFromTo = false.obs;
  RxList<OnlineTaxiDriver> onlineDrivers = <OnlineTaxiDriver>[].obs;

  Rx<DateTime> _scheduleTime = DateTime.now().add(Duration(minutes: 15)).obs;
  void setScheduleTime(DateTime dt) {
    _scheduleTime.value = dt;
    _scheduleTime.refresh();
  }

  DateTime scheduleTime() {
    if (DateTime.now().difference(_scheduleTime.value).inMinutes > -15)
      _scheduleTime.value = DateTime.now().add(Duration(minutes: 15));

    return _scheduleTime.value;
  }

  final AnimatedSliderController sliderController =
      AnimatedSliderController(maxSliderHeight: 52.h);

  /// this is called at initState time , loads up the map and set the current location as the user's current loc.
  void initMapAndStartFetchingOnlineDrivers() {
    locationPickerController.setOnMapTap(onTap: () {
      locationSearchBarController.unfocusAllFocusNodes.call();
    });

    // set current SearchComponent:
    locationSearchBarController.focusedTextField.value =
        currentFocusedTextField.value;
    // set the location Enabled Button to be false
    // locationPickerController.myLocationButtonEnabled.value = false;
    // set blackScreenBottom 110
    locationPickerController.blackScreenBottomTextMargin.value = 80;

    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      taxiRequest.value.from = MezLocation("", locData);
      mezDbgPrint(
          " GeoLoc.Location().getLocation ==> ${taxiRequest.value.from}");
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
    // locationPickerController.myLocationButtonEnabled.value = false;
    // set blackScreenBottom 110

    locationPickerController.blackScreenBottomTextMargin.value = 80;

    updateModelAndMarker(SearchComponentType.From, taxiRequest.value.from!);
    locationPickerController.setLocation(taxiRequest.value.from!);
    locationPickerController.addOrUpdateUserMarker(
      markerId: SearchComponentType.From.toShortString(),
      latLng: taxiRequest.value.from?.toLatLng(),
    );

    updateModelAndMarker(SearchComponentType.To, taxiRequest.value.to!);
    locationPickerController.addOrUpdatePurpleDestinationMarker(
      markerId: SearchComponentType.To.toShortString(),
      latLng: taxiRequest.value.to?.position.toLatLng(),
    );

    // locationPickerController.periodicRerendering.value = true;
    locationPickerController.hideFakeMarker();
    locationPickerController.setAnimateMarkersPolyLinesBounds(true);
    updateRouteInformation()
        .then((_) => locationPickerController.showConfirmButton());
    pickedFromTo.value = true;
    locationPickerController.lockInAutoZoomAnimation();
  }

  /******************************  EVENT HANDLERS ************************************/
// when one of the dropdowns (pick current location, a saved location or a places suggestion clicked)
  void updateModelAndHandoffToLocationPicker(
      MezLocation? newLocation, SearchComponentType textFieldType) {
    mezDbgPrint(
        "zlaganga : $textFieldType | newLocationAddress : ${newLocation?.address}");
    locationSearchBarController.collapseDropdown();
    locationPickerController.clearPolyline();
    // locationPickerController.removeCircleMarker();
    if (newLocation != null) {
      currentFocusedTextField.value = textFieldType;
      // currentFocusedTextField.refresh();
      updateModelAndMarker(textFieldType, newLocation);
      locationPickerController.setLocation(newLocation);
      locationPickerController.moveToNewLatLng(
        newLocation.latitude,
        newLocation.longitude,
      );
      locationPickerController.showFakeMarkerAndPickButton();
      locationPickerController.showOrHideBlackScreen(true);
    } else {
      // Location cleared
      locationPickerController.removeMarkerById(textFieldType.toShortString());
      locationPickerController.showGrayedOutButton();
      pickedFromTo.value = false;
    }
    // mezDbgPrint("updateModelAndHandoffToLocationPicker@saad => $textFieldType",
    //     showMilliSeconds: true);
    // // reset the camera to any left marker if there is else, to currentLocation
    // if (locationPickerController.markers.isNotEmpty) {
    //   double lat = locationPickerController.markers.first.position.latitude;
    //   double lng = locationPickerController.markers.first.position.latitude;
    //   locationPickerController.moveToNewLatLng(lat, lng);
    // } else {
    //   MapHelper.getCurrentLocation().then((loc) {
    //     locationPickerController.moveToNewLatLng(loc.latitude, loc.longitude);
    //   });
    // }
  }

// after pick button is clicked after user verifies gps locaiton
  void updateModelAndMaybeCalculateRoute(MezLocation newLocation) {
    locationPickerController.showOrHideBlackScreen(false);
    updateModelAndMarker(currentFocusedTextField.value, newLocation);

    if (taxiRequest.value.isFromToSet()) {
      locationPickerController.periodicRerendering.value = true;
      locationPickerController.setAnimateMarkersPolyLinesBounds(true);
      locationPickerController.animateAndUpdateBounds();
      updateRouteInformation()
          .then((_) => locationPickerController.showConfirmButton());
      pickedFromTo.value = true;
    } else {
      locationPickerController.setAnimateMarkersPolyLinesBounds(false);
      locationPickerController.showGrayedOutButton();
      pickedFromTo.value = false;
    }
    taxiRequest.refresh();
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
    if (taxiRequest.value.scheduledTime != null) {
      if (DateTime.now()
              .difference(taxiRequest.value.scheduledTime!)
              .inMinutes >
          -15) {
        MezSnackbar(
          "Oops :(",
          "Shedule time should be 15 minutes or more ahead schedule time!",
          position: SnackPosition.TOP,
        );
        locationPickerController.showConfirmButton();
        return Future<bool>.value(false);
      }
    }
    // build order and call controller function
    final ServerResponse response =
        await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      final int orderId = int.parse(response.data["orderId"]);
      // await waitForCurrentOrderStreamFirstTrigger(orderId);
      // in case the widget is still mounted , then make dart scheduale this delayed call as soon as possible ,
      // so we don't fall into assertion error ('!_debugLocked': is not true.)

      await Future<void>.delayed(Duration.zero, () {
        MezRouter.popEverythingAndNavigateTo(getTaxiOrderRoute(orderId));
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
    SearchComponentType textFieldType,
    MezLocation newLocation,
  ) {
    if (textFieldType == SearchComponentType.From) {
      taxiRequest.value.setFromLocation(newLocation);
      //ignore_for_file:unawaited_futures
      locationPickerController.addOrUpdateUserMarker(
        markerId: textFieldType.toShortString(),
        latLng: newLocation.toLatLng(),
      );
    } else {
      taxiRequest.value.setToLocation(newLocation);
      locationPickerController.addOrUpdatePurpleDestinationMarker(
        markerId: textFieldType.toShortString(),
        latLng: newLocation.toLatLng(),
      );
    }
    // taxiRequest.refresh();
  }

  void onSuccessSignInUpdateUserMarker() {
    locationPickerController.addOrUpdateUserMarker(
      markerId: SearchComponentType.From.toShortString(),
      latLng: taxiRequest.value.from?.toLatLng(),
    );
  }

  Future<void> updateRouteInformation() async {
    final MapHelper.Route? route = await MapHelper.getDurationAndDistance(
        taxiRequest.value.from!, taxiRequest.value.to!);
    if (route != null) {
      final int estimatedPrice =
          getEstimatedRidePriceInPesos(route.distance.distanceInMeters);
      taxiRequest.value.setEstimatedPrice(estimatedPrice);
      locationPickerController.addPolyline(route.polylineList);
      taxiRequest.value.setRouteInformation(
        MapHelper.RouteInformation(
          polyline: route.encodedPolyLine,
          distance: route.distance,
          duration: route.duration,
        ),
      );
      taxiRequest.refresh();
    } else {
      // TODO:handle route error
    }
  }

  int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    final int roundedKm = (distanceInMeteres / 1000).round();
    return roundedKm <= 1 ? 35 : roundedKm * 15;
  }

  void dispose() {}

  void scheduleClick() {
    sliderController.slideUp();
  }
}
