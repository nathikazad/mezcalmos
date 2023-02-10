import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;

class DvCompanyOrderViewController {
  // instances //
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<DeliveryOrder> order = Rxn();
  DeliveryOrderStatus? _statusSnapshot;

  // getters //
  DeliveryOrderStatus get orderStatus {
    return order.value!.status;
  }

  bool get canSetDriver {
    return true;
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
    if (order.value != null) {
      await _initMap();
    }
  }

// Map methods //

  Future<void> _initMap() async {
    // first time init map
    mapController.periodicRerendering.value = true;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;

    mapController.setLocation(
      LocModel.MezLocation(
        "",
        LocModel.MezLocation.buildLocationData(
          order.value?.dropoffLocation.latitude,
          order.value?.dropoffLocation.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    await mapController.addOrUpdateUserMarker(
      latLng: order.value?.pickupLocation.toLatLng(),
      markerId: order.value?.serviceInfo.hasuraId.toString(),
      customImgHttpUrl: order.value?.serviceInfo.image,
      fitWithinBounds: true,
    );
    // customer's
    await mapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.dropoffLocation.toLatLng(),
      fitWithinBounds: true,
    );
    if (order.value!.routeInformation != null)
      mapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    // await mapController.animateAndUpdateBounds(
    //     shouldFitPolylineInBound: order.value?.routeInformation != null);
  }

  void updateMapIfDeliveryPhase(DeliveryOrderStatus status) {
    switch (status) {
      case DeliveryOrderStatus.PackageReady:
        mezDbgPrint("+ markers => ${mapController.markers.length}");
        mezDbgPrint("+ polys => ${mapController.polylines.length}");

        // Customer + Restau  + Polyline

        // PICKUP :  DELIVERY -> restau
        //
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.serviceInfo.location.toLatLng(),
            markerId: order.value?.serviceInfo.firebaseId,
            customImgHttpUrl: order.value?.serviceInfo.image,
            fitWithinBounds: true,
          );
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.dropoffLocation.toLatLng(),
            fitWithinBounds: true,
          );
        }

        mapController.addOrUpdateUserMarker(
          latLng: order.value?.driverLocation,
          markerId: order.value?.driverInfo?.hasuraId.toString(),
          customImgHttpUrl: order.value?.driverInfo?.image,
          fitWithinBounds: true,
        );

        mapController.animateAndUpdateBounds();
        break;

      case DeliveryOrderStatus.OnTheWayToDropoff:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mapController.addOrUpdateUserMarker(
            latLng: order.value?.serviceInfo.location.toLatLng(),
            markerId: order.value?.serviceInfo.hasuraId.toString(),
            customImgHttpUrl: order.value?.serviceInfo.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.dropoffLocation.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's

        mapController.addOrUpdateUserMarker(
          latLng: order.value?.driverLocation,
          markerId: order.value?.driverInfo?.hasuraId.toString(),
          customImgHttpUrl: order.value?.driverInfo?.image,
          fitWithinBounds: true,
        );

        mapController.animateAndUpdateBounds();

        break;
      default:
    }
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

// dispose
  void dispose() {
    mezDbgPrint("Called dispose 😔😔😔😔");
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }
}
