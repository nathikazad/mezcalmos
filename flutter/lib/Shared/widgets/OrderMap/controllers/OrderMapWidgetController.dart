import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
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
    //mGoogleMapController.initialZoomLevel = 10;
    // mGoogleMapController.minMaxZoomPrefs = MinMaxZoomPreference(10, 16);
    mGoogleMapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;

    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;
    mGoogleMapController.recenterButtonEnabled.value = true;
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
    if (from != null) {
      final String mapsUrl =
          getGMapsDirectionLink(from.toLatLng()!, to.toLatLng()!);
      mGoogleMapController.gmapsLink.value = mapsUrl;
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
