import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class CustLaundryOrderViewController {
  // instances //
  final MGoogleMapController mGoogleMapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<LaundryOrder> order = Rxn();
  RestaurantOrderStatus? _statusSnapshot;
  LaundryOrderPhase? _phaseSnapshot;

  // getters //
  LaundryOrderStatus get orderStatus {
    return order.value!.status;
  }

  // streams //
  StreamSubscription<LaundryOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    try {
      order.value =
          await get_laundry_order_by_id(orderId: orderId, withCache: false);
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
        orderStream = listen_on_laundry_order_by_id(orderId: orderId)
            .listen((LaundryOrder? event) {
          if (event != null) {
            mezDbgPrint(
                "Stream triggred from order controller ✅✅✅✅✅✅✅✅✅ =====> ${event.dropoffDriver?.location?.toJson()}");
            order.value = event;
            order.value?.dropoffDriver = event.dropoffDriver;
            updateMapByPhase(order.value!.getCurrentPhase());
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
          order.value!.to.latitude,
          order.value!.to.longitude,
        ),
      ),
    );

    // restaurant ad customer's location are fixed (fit in bound at start)
    mGoogleMapController.addOrUpdateUserMarker(
      latLng: order.value?.laundry?.location.toLatLng(),
      markerId: order.value?.laundry?.firebaseId,
      customImgHttpUrl: order.value?.laundry?.image,
      fitWithinBounds: true,
    );

    // customer's
    mGoogleMapController.addOrUpdatePurpleDestinationMarker(
      latLng: order.value?.to.toLatLng(),
      fitWithinBounds: true,
    );

    if (order.value!.routeInformation != null)
      mGoogleMapController.decodeAndAddPolyline(
          encodedPolylineString: order.value!.routeInformation!.polyline);

    mGoogleMapController.animateAndUpdateBounds(
      shouldFitPolylineInBound: order.value!.routeInformation != null,
    );
  }

  void updateMapByPhase(LaundryOrderPhase phase) {
    switch (phase) {
      case LaundryOrderPhase.Pickup:
        if (_phaseSnapshot != phase) {
          _phaseSnapshot = phase;
          // we ignore the marker within bounds
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: order.value?.laundry?.location.toLatLng(),
            markerId: order.value?.laundry?.firebaseId,
            customImgHttpUrl: order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }
        // only if pickUpDriver not null
        if (order.value?.pickupDriver != null &&
            order.value!.inDeliveryPhase()) {
          mGoogleMapController.addOrUpdateUserMarker(
            latLng: order.value?.pickupDriver?.location,
            markerId: "pickup_driver", //order.value!.pickupDriver!.id,
            customImgHttpUrl: order.value?.pickupDriver?.image,
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
            latLng: order.value?.laundry?.location.toLatLng(),
            markerId: order.value?.laundry?.firebaseId,
            customImgHttpUrl: order.value?.laundry?.image,
            fitWithinBounds: true,
          );
          // we fit the destination into bounds
          mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value?.to.toLatLng(),
            fitWithinBounds: true,
          );
        }

        // we keep updating the delivery's
        if (order.value?.dropoffDriver != null) {
          // mezDbgPrint(
          //     "Phaaaaazeeee::dropoffDriver ==> ${order.value!.dropoffDriver?.location}");

          mGoogleMapController.addOrUpdateUserMarker(
            latLng: order.value?.dropoffDriver?.location,
            markerId: "dropoff_driver", //order.value!.dropoffDriver!.id,
            customImgHttpUrl: order.value?.dropoffDriver?.image,
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

  Future<bool> cancelOrder() async {
    try {
      CancelLaundryResponse res =
          await CloudFunctions.laundry2_cancelFromCustomer(
              orderId: order.value!.orderId);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
      return res.success;
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(stk);
      mezDbgPrint(e);
      return false;
    } catch (e) {
      mezDbgPrint(e);
      return false;
    }
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    order.close();
  }
}
