import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

void initilizeMap(
    MGoogleMapController mapController, Rxn<Order> order, ServiceInfo service) {
  final DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  if (order.value?.routeInformation != null) {
    mapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline);
  }

  // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
  Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.to.toLatLng(),
    ),
    // USER MARKER
    mapController.addOrUpdateUserMarker(
      latLng: deliveryAuthAuthController.currentLocation?.toLatLng(),
    ),
    // Restaurant Marker
    mapController.addOrUpdateUserMarker(
      latLng: service.location.toLatLng(),
      markerId: service.firebaseId,
      customImgHttpUrl: service.image,
    )
  ]).then((_) {
    if (deliveryAuthAuthController.currentLocation != null)
      mapController.setLocation(
        Location.fromLocationData(
          deliveryAuthAuthController.currentLocation!,
        ),
      );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;
    mapController.animateAndUpdateBounds();
  });
}
