import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class RestaurantOrderViewController {
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
        mezDbgPrint(
            "Order route informations ====🥸🥸🥸🥸===== => ${order.value!.routeInformation}");
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
          mezDbgPrint(event);
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.dropoffDriver?.location?.toJson()}");
            order.value = event;
            order.value?.dropoffDriver = event.dropoffDriver;
            _updateMapByPhaseAndStatus();
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
    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;
    mGoogleMapController.periodicRerendering.value = true;

    // mGoogleMapController.periodicRerendering.value = true;
    if (order.value?.routeInformation?.polyline != null)
      mGoogleMapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline,
      );

    _updateMapByPhaseAndStatus();

    await waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          MezRouter.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        // controller.setNotifiedAsTrue(order.value!);
      }
    });
  }

// Map methods //
  void _updateMapByPhaseAndStatus() {
    if (order.value!.inDeliveryPhase()) {
      mezDbgPrint(
          "PICK UP PHASE snapshot [$_statusSnapshot] - [${order.value!.status}]");
      if (_statusSnapshot != order.value!.status) {
        if (order.value?.restaurant.location != null) {
          mGoogleMapController.setLocation(
            LocModel.MezLocation(
              "_",
              LocationData.fromMap(
                <String, dynamic>{
                  "latitude": order.value!.restaurant.location.latitude,
                  "longitude": order.value!.restaurant.location.longitude
                },
              ),
            ),
          );
        }

        _statusSnapshot = order.value?.status;
        // add laundry marker
        mGoogleMapController.addOrUpdateUserMarker(
          latLng: order.value?.restaurant.location.toLatLng(),
          customImgHttpUrl: order.value?.restaurant.image,
          fitWithinBounds: true,
          markerId: order.value?.restaurant.firebaseId,
        );
        // add customer's marker - destination
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
          latLng: order.value?.to.toLatLng(),
          fitWithinBounds: true,
        );
      }
      // keep updating driver's marker
      mezDbgPrint("Updating driver location");
      mGoogleMapController.addOrUpdateUserMarker(
        latLng: order.value?.dropoffDriver?.location,
        customImgHttpUrl: order.value?.dropoffDriver?.image,
        fitWithinBounds: true,
        markerId: "dropOff_driver",
      );

      mGoogleMapController.animateAndUpdateBounds();
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

  Future<ServerResponse> setReadyForDelivery() async {
    return _callRestaurantCloudFunction(
        'readyForOrderPickup', order.value!.orderId);
  }

  Future<ServerResponse> prepareOrder() async {
    return _callRestaurantCloudFunction('prepareOrder', order.value!.orderId);
  }

  Future<ServerResponse> cancelOrder() async {
    return _callRestaurantCloudFunction(
        "cancelOrderFromAdmin", order.value!.orderId);
  }

  Future<ServerResponse> _callRestaurantCloudFunction(
      String functionName, int orderId,
      {Map<String, dynamic>? optionalParams}) async {
    mezDbgPrint("calling cloud func");
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant2-$functionName');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderId": orderId,
        "fromRestaurantOperator": true,
        ...optionalParams ?? {}
      });
      mezDbgPrint("Response : ${response.data}");
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

// dispose
  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }
}
