import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/User.dart';

void initilializeMap(
    MGoogleMapController mapController, Rxn<Order> order, ServiceInfo service) {
  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  if (order.value!.routeInformation != null) {
    mapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline);
  }

  // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
  Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: LatLng(
        order.value!.to.latitude,
        order.value!.to.longitude,
      ),
    ),
    // USER MARKER
    mapController.addOrUpdateUserMarker(
      latLng: LatLng(
        deliveryAuthAuthController.currentLocation.latitude!,
        deliveryAuthAuthController.currentLocation.longitude!,
      ),
    ),
    // Restaurant Marker
    mapController.addOrUpdateUserMarker(
      latLng: LatLng(
        service.location.latitude,
        service.location.longitude,
      ),
      markerId: service.id,
      customImgHttpUrl: service.image,
    )
  ]).then((_) {
    mapController.setLocation(
      Location.fromLocationData(
        deliveryAuthAuthController.currentLocation,
      ),
    );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;
    mapController.animateAndUpdateBounds();
  });
}
