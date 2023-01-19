import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustRestaurantOrderViewController {
  // instances //
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<RestaurantOrder> order = Rxn();
  RestaurantOrderStatus? _statusSnapshot;

  // getters //
  RestaurantOrderStatus get orderStatus {
    return order.value!.status;
  }

  // streams //
  StreamSubscription<RestaurantOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    try {
      order.value =
          await get_restaurant_order_by_id(orderId: orderId, withCache: false);
      if (order.value!.routeInformation != null) {
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: order.value!.routeInformation!.polyline);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_restaurant_order_by_id(orderId: orderId)
            .listen((RestaurantOrder? event) {
         
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.dropoffDriver?.location?.toJson()}");
            order.value = event;
            order.value?.dropoffDriver = event.dropoffDriver;
            updateMapIfDeliveryPhase(order.value!.status);
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
    // first time init map
    //mGoogleMapController.animateMarkersPolyLinesBounds(true);
    if (order.value != null) {
      await _initMap();
    }
  }

  Future<void> _initMap() async {
    // first time init map
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      LocModel.Location(
        "",
        LocModel.Location.buildLocationData(
          order.value?.to.latitude,
          order.value?.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    await mGoogleMapController.addOrUpdateUserMarker(
      latLng: order.value?.restaurant.location.toLatLng(),
      markerId: order.value?.restaurant.firebaseId,
      customImgHttpUrl: order.value?.restaurant.image,
      fitWithinBounds: true,
    );
    // customer's
    await mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.to.toLatLng(),
      fitWithinBounds: true,
    );
    if (order.value!.routeInformation != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    // await mGoogleMapController.animateAndUpdateBounds(
    //     shouldFitPolylineInBound: order.value?.routeInformation != null);
  }

  void updateMapIfDeliveryPhase(RestaurantOrderStatus status) {
    switch (status) {
      case RestaurantOrderStatus.Ready:
        mezDbgPrint("+ markers => ${mGoogleMapController.markers.length}");
        mezDbgPrint("+ polys => ${mGoogleMapController.polylines.length}");

        // Customer + Restau  + Polyline

        // PICKUP :  DELIVERY -> restau
        //
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurant.firebaseId,
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: true,
          );
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.dropoffDriver?.location,
          markerId: order.value?.dropoffDriver?.hasuraId.toString(),
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );

        mGoogleMapController.animateAndUpdateBounds();
        break;

      case RestaurantOrderStatus.OnTheWay:
        if (_statusSnapshot != status) {
          _statusSnapshot = status;
          // we ignore the restaurant's marker within bounds
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: order.value?.restaurant.location.toLatLng(),
            markerId: order.value?.restaurant.hasuraId.toString(),
            customImgHttpUrl: order.value?.restaurant.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's

        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.dropoffDriver?.location,
          markerId: order.value?.dropoffDriver?.hasuraId.toString(),
          customImgHttpUrl: order.value?.dropoffDriver?.image,
          fitWithinBounds: true,
        );

        mGoogleMapController.animateAndUpdateBounds();

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

// Order status change methods

  Future<ServerResponse> addReview({
    required int orderId,
    required int serviceId,
    required String comment,
    required OrderType orderType,
    required num rate,
  }) async {
    final HttpsCallable cancelOrder =
        FirebaseFunctions.instance.httpsCallable('restaurant-addReview');
    try {
      final HttpsCallableResult<dynamic> response =
          await cancelOrder.call(<String, dynamic>{
        "orderId": orderId,
        "serviceProviderId": serviceId,
        "rating": rate,
        "comment": comment,
        "orderType": orderType.toFirebaseFormatString(),
      });
      mezDbgPrint(response.toString());
      print(response.data);
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> cancelOrder() async {
    final HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('restaurant2-cancelOrderFromCustomer');
    try {
      final HttpsCallableResult<dynamic> response = await cancelOrder
          .call(<String, dynamic>{"orderId": order.value!.orderId});
      mezDbgPrint(response.toString());
      print(response.data);

      final ServerResponse res = ServerResponse.fromJson(response.data);

      return res;
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }
}
