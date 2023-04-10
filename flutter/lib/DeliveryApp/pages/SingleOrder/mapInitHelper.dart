import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

void initilizeMap(
    {required MGoogleMapController mapController,
    required Rxn<DeliveryOrder> order,
    required UserInfo service,
    required LatLng? driverLoc}) {
  if (order.value?.routeInformation != null) {
    mapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline);
  }

  // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
  Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.dropOffLocation.toLatLng(),
      markerId: "dropOff",
    ),
    // USER MARKER
    mapController.addOrUpdateUserMarker(
      latLng: driverLoc,
    ),
    // Restaurant Marker
    mapController.addOrUpdatePackageMarkerMarker(
        latLng: order.value?.pickupLocation?.toLatLng(), markerId: "pickUp")
  ]).then((_) {
    if (driverLoc != null)
      mapController.setLocation(
        MezLocation.fromLocationData(
          MezLocation.buildLocationData(
              driverLoc.latitude, driverLoc.longitude),
        ),
      );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;
    mapController.animateAndUpdateBounds();
  });
}
