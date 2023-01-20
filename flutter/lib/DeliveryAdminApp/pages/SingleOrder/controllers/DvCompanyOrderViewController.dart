import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/SingleOrder/mapInitHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DvCompanyOrderViewcontroller {
  // instances //
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  DeliveryOpAuthController deliveryAuthAuthController =
      Get.find<DeliveryOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<DeliveryOrder> order = Rxn();
  DeliveryOrderStatus? _statusSnapshot;

  // getters //
  DeliveryOrderStatus get orderStatus {
    return order.value!.status;
  }

  // streams //
  StreamSubscription<DeliveryOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    try {
      order.value = await get_driver_order_by_id(orderId: orderId);
      if (order.value!.routeInformation != null) {
        mezDbgPrint(order.value.toString());
        mapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (order.value == null) {
      mezDbgPrint(
          "🚨 Can't get order $orderId 🚨 DvRestaurantOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_driver_restaurant_order_by_id(orderId: orderId)
            .listen((DeliveryOrder? event) {
          mezDbgPrint(event);
          if (event != null) {
            mezDbgPrint("Stream triggred from order controller ✅✅✅✅✅✅✅✅✅");
            order.value = event;
            handleRestaurantOrder(event);
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
    initOrderMap();
  }

// Map methods //

  void initOrderMap() {
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;

    // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
    // Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.dropoffLocation.toLatLng(),
    );
    // USER MARKER

    // Restaurant Marker
    mapController.addOrUpdateUserMarker(
      latLng: order.value?.pickupLocation.toLatLng(),
      markerId: order.value?.serviceInfo.hasuraId.toString(),
      customImgHttpUrl: order.value?.serviceInfo.image,
    );
    //   if (order.value != null) handleRestaurantOrder(order.value!);

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        mezDbgPrint("InitiiiiiiiiiInitiiiiiiiiiInitiiiiiiiiiInitiiiiiiiii");
        initilizeMap(mapController, order, order.value!.serviceInfo);
      }
    });
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  /// this handles Restaurant Order.
  void handleRestaurantOrder(DeliveryOrder order) {
    mezDbgPrint(
        " 🛵🛵🛵🛵 Driver location update ====>${order.driverLocation?.toJson()}");
    switch (order.status) {
      case DeliveryOrderStatus.PackageReady:
        // only update once upon Ready
        if (_statusSnapshot != order.status) {
          // ignoring customer's marker (destination)
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.dropoffLocation.toLatLng(),
            // fitWithinBounds: false,
          );
        }
        // update position of our delivery Guy
        mapController.addOrUpdateUserMarker(
            latLng: order.driverLocation,
            fitWithinBounds: true,
            customImgHttpUrl: order.customerInfo.image);
        mapController.animateAndUpdateBounds();
        _statusSnapshot = order.status;
        break;

      case DeliveryOrderStatus.OnTheWayToDropoff:
        // only update once.
        if (_statusSnapshot != order.status) {
          // ignoring Restaurant's marker
          mapController.addOrUpdateUserMarker(
            latLng: order.dropoffLocation.toLatLng(),
            markerId: order.serviceInfo.hasuraId.toString(),
            customImgHttpUrl: order.serviceInfo.image,
            fitWithinBounds: false,
          );

          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.dropoffLocation.toLatLng(),
            fitWithinBounds: true,
          );
        }
        // updating our delivery guy location
        mapController.addOrUpdateUserMarker(
          latLng: order.driverLocation,
          fitWithinBounds: true,
        );
        mapController.animateAndUpdateBounds();
        _statusSnapshot = order.status;
        break;
      default:
        _statusSnapshot = order.status;
    }
  }
}
