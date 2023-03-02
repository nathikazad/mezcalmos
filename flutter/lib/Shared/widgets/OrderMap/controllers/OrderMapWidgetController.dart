import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class OrderMapWidgetController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  StreamSubscription<LatLng?>? driverLocationStream;
  String? subscriptionId;
  late int deliveryOrderId;
  Rxn<LatLng> deliveryLocation = Rxn();
  Rxn<UserInfo> driver = Rxn();
  bool shouldUpdate = false;

  Future<void> initMap(
      {required int deliveryOrderId,
      required bool updateDriver,
      required String? polyline,
      required MezLocation? from,
      required MezLocation to}) async {
    this.deliveryOrderId = deliveryOrderId;
    driver.value = await get_order_driver_info(orderId: deliveryOrderId);
    shouldUpdate = updateDriver;
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
      latLng: from?.toLatLng(),
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

    if (shouldUpdate) {
      _listenToDriverLoc();
    } else {
      await driverLocationStream?.cancel();
      driverLocationStream = null;
    }
  }

  void _listenToDriverLoc() {
    mezDbgPrint("Start listening on driver location 😛");
    subscriptionId = _hasuraDb.createSubscription(start: () {
      driverLocationStream =
          listen_order_driver_location(orderId: deliveryOrderId)
              .listen((LatLng? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from order map widget update driver 🤣 =====> $event");
          deliveryLocation.value = event;

          mGoogleMapController.addOrUpdateUserMarker(
            latLng: deliveryLocation.value!,
            markerId: "driver",
            customImgHttpUrl: driver.value?.image,
            fitWithinBounds: true,
          );
        }
      });
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
