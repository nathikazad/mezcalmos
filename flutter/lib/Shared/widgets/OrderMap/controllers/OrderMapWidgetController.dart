import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class OrderMapWidgetController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription<MezLocation?>? driverLocationStream;
  String? subscriptionId;
  late int deliveryOrderId;
  Rxn<MezLocation> deliveryLocation = Rxn();

  Future<void> _initMap(
      {required int deliveryOrderId,
      required bool updateDriver,
      required String? polyline,
      required MezLocation from,
      required MezLocation to}) async {
    this.deliveryOrderId = deliveryOrderId;
    // first time init map
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      MezLocation(
        "",
        MezLocation.buildLocationData(
          to.latitude,
          to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    await mGoogleMapController.addOrUpdatePackageMarkerMarker(
      latLng: from.toLatLng(),
      markerId: "from",
      fitWithinBounds: true,
    );
    // customer's
    await mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: to.toLatLng(),
      fitWithinBounds: true,
    );
    if (polyline != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: polyline);
  }

  Future<void> listenToDriverLoc() async {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      // driverLocationStream = listen_on_restaurant_order_by_id(orderId: orderId)
      //     .listen((RestaurantOrder? event) {
      //   if (event != null) {
      //     mezDbgPrint(
      //         "Stream triggred from order map widget update driver 🤣 =====> ${event.dropoffDriver?.location?.toJson()}");
      //     order.value = event;
      //     order.value?.dropoffDriver = event.dropoffDriver;
      //     updateMapIfDeliveryPhase(order.value!.status);
      //   }
      // });
    }, cancel: () {
      driverLocationStream?.cancel();
      driverLocationStream = null;
    });
  }

  void dispose() {
    driverLocationStream?.cancel();
    driverLocationStream = null;
  }
}
