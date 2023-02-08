import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class LaundryOpOrderViewController {
  // instances //
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<LaundryOrder> _order = Rxn();
  RestaurantOrderStatus? _statusSnapshot;
  LaundryOrderPhase? _phaseSnapshot;

  // getters //
  bool get hasData => _order.value != null;

  LaundryOrder get order => _order.value!;
  LaundryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  // streams //
  StreamSubscription<LaundryOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    try {
      _order.value =
          await get_laundry_order_by_id(orderId: orderId, withCache: false);
      if (_order.value!.routeInformation != null) {
        mGoogleMapController.decodeAndAddPolyline(
            encodedPolylineString: _order.value!.routeInformation!.polyline);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (_order.value == null) {
      mezDbgPrint("🚨 Can't get order $orderId 🚨 ROpOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_laundry_order_by_id(orderId: orderId)
            .listen((LaundryOrder? event) {
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.dropoffDriver?.location?.toJson()}");
            _order.value = event;
            _order.value?.dropoffDriver = event.dropoffDriver;
            updateMapByPhase(_order.value!.getCurrentPhase());
          }
        });
      }, cancel: () {
        orderStream?.cancel();
        orderStream = null;
      });
    }
    // first time init map
    //mGoogleMapController.animateMarkersPolyLinesBounds(true);
    if (_order.value != null) {
      _initMap();
    }
  }

  void _initMap() {
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.minMaxZoomPrefs =
        MinMaxZoomPreference.unbounded; // LEZEM
    mGoogleMapController.animateMarkersPolyLinesBounds.value = true;

    mGoogleMapController.setLocation(
      LocModel.MezLocation(
        "",
        LocModel.MezLocation.buildLocationData(
          _order.value!.to.latitude,
          _order.value!.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    mGoogleMapController.addOrUpdateUserMarker(
      latLng: _order.value?.laundry?.location.toLatLng(),
      markerId: _order.value?.laundry?.firebaseId,
      customImgHttpUrl: _order.value?.laundry?.image,
      fitWithinBounds: true,
    );

    // customer's
    mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: _order.value?.to.toLatLng(),
      fitWithinBounds: true,
    );

    if (_order.value!.routeInformation != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: _order.value!.routeInformation!.polyline);

    mGoogleMapController.animateAndUpdateBounds(
      shouldFitPolylineInBound: _order.value!.routeInformation != null,
    );
  }

  void updateMapByPhase(LaundryOrderPhase phase) {
    switch (phase) {
      case LaundryOrderPhase.Pickup:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the marker within bounds
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: _order.value?.laundry?.location.toLatLng(),
            markerId: _order.value?.laundry?.firebaseId,
            customImgHttpUrl: _order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: _order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }
        // only if pickUpDriver not null
        if (_order.value?.pickupDriver != null &&
            _order.value!.inDeliveryPhase()) {
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: _order.value?.pickupDriver?.location,
            markerId: "pickup_driver", //_order.value!.pickupDriver!.id,
            customImgHttpUrl: _order.value?.pickupDriver?.image,
            fitWithinBounds: true,
          );
        }

        break;

      case LaundryOrderPhase.Dropoff:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // needed when the view is not disposed, we have to remove it..
          mGoogleMapController.removeMarkerById("pickup_driver");
          // mezDbgPrint("Phaaaaazeeee::_phaseSnapshot ==> $_phaseSnapshot");
          // we ignore the restaurant's marker within bounds
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: _order.value?.laundry?.location.toLatLng(),
            markerId: _order.value?.laundry?.firebaseId,
            customImgHttpUrl: _order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: _order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        if (_order.value?.dropoffDriver != null) {
          // mezDbgPrint(
          //     "Phaaaaazeeee::dropoffDriver ==> ${_order.value!.dropoffDriver?.location}");

          mGoogleMapController.addOrUpdateUserMarker(
            latLng: _order.value?.dropoffDriver?.location,
            markerId: "dropoff_driver", //_order.value!.dropoffDriver!.id,
            customImgHttpUrl: _order.value?.dropoffDriver?.image,
            fitWithinBounds: true,
          );
        }
        mGoogleMapController.animateAndUpdateBounds();
        break;
      default:
    }
    mGoogleMapController.animateAndUpdateBounds();
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
          .call(<String, dynamic>{"orderId": _order.value!.orderId});
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
    _order.close();
  }
}
