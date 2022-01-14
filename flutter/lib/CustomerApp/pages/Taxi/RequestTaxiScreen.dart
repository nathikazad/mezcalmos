import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/LocationSearchBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/TaxiBottomBars/TaxiRequestBottomBar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart' as TaxiOrder;
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:location/location.dart' as GeoLoc;

/*
  - TaxiReqScreen -
    - From , to picked > Construct TaxiRequest Model.
      - onConfirm  -> ViewTaxiRequest.

*/

class RequestTaxiScreen extends StatefulWidget {
  @override
  _RequestTaxiScreenState createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  // MyPopupMenuController _popUpController = MyPopupMenuController();
  Rx<SearchComponentType> _currentFocusedTextField =
      SearchComponentType.From.obs;
  Rx<TaxiRequest> taxiRequest = TaxiRequest().obs;
  TaxiController controller = Get.put<TaxiController>(TaxiController());
  final LocationPickerController locationPickerController =
      LocationPickerController();
  final LocationSearchBarController locationSearchBarController =
      LocationSearchBarController();
  //TaxiRequest? orderRequest;
  bool _pickedFromTo = false;
  /******************************  Init and build function ************************************/

  @override
  void initState() {
    if (Get.arguments != null) {
      taxiRequest.value = Get.arguments as TaxiRequest;

      mezDbgPrint(
          "============ the older requist is ${(Get.arguments as TaxiRequest).status} ===========");
      locationPickerController.setOnMapTap(onTap: () {
        locationSearchBarController.unfocusAllFocusNodes.call();
        setState(() {});
      });

      // set current SearchComponent:
      locationSearchBarController
          .focusedTextField(_currentFocusedTextField.value);
      // set the location Enabled Button to be false
      locationPickerController.myLocationButtonEnabled.value = false;
      // set blackScreenBottom 110
      locationPickerController.blackScreenBottomTextMargin.value = 80;

      GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
        //taxiRequest.value.from = Location("", locData);
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

        setState(() {
          _pickedFromTo = true;
        });
      });
    } else {
      locationPickerController.setOnMapTap(onTap: () {
        locationSearchBarController.unfocusAllFocusNodes.call();
        setState(() {});
      });

      // set current SearchComponent:
      locationSearchBarController.focusedTextField.value =
          _currentFocusedTextField.value;
      // set the location Enabled Button to be false
      locationPickerController.myLocationButtonEnabled.value = false;
      // set blackScreenBottom 110
      locationPickerController.blackScreenBottomTextMargin.value = 80;

      GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
        taxiRequest.value.from = Location("", locData);
        updateModelAndMarker(SearchComponentType.From, taxiRequest.value.from!);
        locationPickerController.setLocation(taxiRequest.value.from!);
        // locationPickerController.addOrUpdateCircleMarker(LatLng(
        //     taxiRequest.value.from!.latitude,
        //     taxiRequest.value.from!.longitude));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
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

                    /// [onSuccessSignIn] THIS WILL GETS EXECUTED IF USER GOT SIGNED IN SUCCESSFULY
                    // AFTER HE CREATED HIS TAXI REQUESTED WHILE HE WAS SIGNEDOUT
                    onSuccessSignIn: onSuccessSignInUpdateUserMarker,
                    locationPickerMapController: this.locationPickerController,
                    notifyParentOfLocationFinalized:
                        updateModelAndMaybeCalculateRoute,
                    notifyParentOfConfirm: (Location? _) async {
                      if (GetStorage().read(getxLmodeKey) == "prod" &&
                          Get.find<AuthController>().fireAuthUser?.uid ==
                              testUserIdInProd) {
                        MezSnackbar("Oops",
                            "This prod version is live and running , we can't let you do that :( !");
                      } else
                        await requestTaxi(_);
                    }),
              ),
              LocationSearchBar(
                  request: taxiRequest,
                  locationSearchBarController: locationSearchBarController,
                  newLocationChosenEvent:
                      updateModelAndHandoffToLocationPicker),
              _pickedFromTo
                  // from , to
                  ? BottomBar(
                      taxiRequest: taxiRequest.value,
                    )
                  : SizedBox()
            ]),
      ),
    );
  }

/******************************  EVENT HANDLERS ************************************/
// when one of the dropdowns (pick current location, a saved location or a places suggestion clicked)
  void updateModelAndHandoffToLocationPicker(
      Location? newLocation, SearchComponentType textFieldType) {
    // locationPickerController.removeCircleMarker();
    if (newLocation != null) {
      _currentFocusedTextField.value = textFieldType;
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
      setState(() {
        _pickedFromTo = false;
      });
    }
    locationSearchBarController.collapseDropdown();
    locationPickerController.clearPolyline();
  }

// after pick button is clicked after user verifies gps locaiton
  void updateModelAndMaybeCalculateRoute(Location newLocation) {
    locationPickerController.showOrHideBlackScreen(false);

    updateModelAndMarker(_currentFocusedTextField.value, newLocation);
    if (taxiRequest.value.isFromToSet()) {
      locationPickerController.setAnimateMarkersPolyLinesBounds(true);
      locationPickerController.animateAndUpdateBounds();
      updateRouteInformation()
          .then((value) => locationPickerController.showConfirmButton());
      setState(() {
        _pickedFromTo = true;
      });
    } else {
      locationPickerController.setAnimateMarkersPolyLinesBounds(false);
      locationPickerController.showGrayedOutButton();
      // locationPickerController.removeCircleMarker();
      setState(() {
        _pickedFromTo = false;
      });
    }
  }

  // after confirm button is clicked on mez pick google map
  Future<void> requestTaxi(Location? loc) async {
    // we show grayed Confirm button so the user won't press it twice.
    this.locationPickerController.showLoadingIconOnConfirm();

    // build order and call controller function
    ServerResponse response = await controller.requestTaxi(taxiRequest.value);
    if (response.success) {
      String orderId = response.data["orderId"];
      // in case the widget is still mounted , then make dart scheduale this delayed call as soon as possible ,
      // so we don't fall into assertion error ('!_debugLocked': is not true.)
      await Future.delayed(Duration.zero, () {
        mezDbgPrint("Goung tooooo route >>>>  ${getTaxiOrderRoute(orderId)}");
        popEverythingAndNavigateTo(getTaxiOrderRoute(orderId));
      });
    } else {
      MezSnackbar("Error :(", "Failed to request a taxi !",
          position: SnackPosition.TOP);
      mezDbgPrint("Error requesting the taxi : ${response.toString()}");
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

    mezDbgPrint("updateRouteInformation::Route => ${route?.polylineList}");
    if (route != null) {
      setState(() {
        int estimatedPrice =
            getEstimatedRidePriceInPesos(route.distance.distanceInMeters);
        taxiRequest.value.setEstimatedPrice(estimatedPrice);
        locationPickerController.addPolyline(route.polylineList);
        taxiRequest.value.setRouteInformation(TaxiOrder.RouteInformation(
            polyline: route.encodedPolyLine,
            distance: route.distance,
            duration: route.duration));
      });
      mezDbgPrint("Polyliiines ====> ${route.polylineList}");
      mezDbgPrint("Polyliiines ====> ${taxiRequest.value.toString()}");
    } else {
      // TODO:handle route error
    }
  }

  int getEstimatedRidePriceInPesos(int distanceInMeteres) {
    int roundedKm = (distanceInMeteres / 1000).round();
    return roundedKm <= 1 ? 35 : roundedKm * 15;
  }
}
