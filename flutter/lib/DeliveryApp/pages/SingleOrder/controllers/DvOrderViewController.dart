import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/mapInitHelper.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/mutations/hsDeliveryOrderMutations.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/subscriptions/hsDeliveryOrderSubscriptions.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryAction.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DvOrderViewcontroller {
  // instances //
  final MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

  DeliveryAuthController deliveryAuthAuthController =
      Get.find<DeliveryAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  // vars //
  Rxn<DeliveryOrder> _order = Rxn();
  cModels.DeliveryOrderStatus? _statusSnapshot;
  RxBool isSettingPickUpTime = false.obs;
  RxBool isSettingDropoffTime = false.obs;

  // getters //
  cModels.DeliveryOrderStatus get orderStatus {
    return _order.value!.status;
  }

  bool get isLaundryPickup {
    return order.orderType == cModels.OrderType.Laundry &&
        order.deliveryDirection == cModels.DeliveryDirection.FromCustomer;
  }

  bool get isCourier {
    return order.orderType == cModels.OrderType.Courier;
  }

  DeliveryOrder get order => _order.value!;
  bool get hasData => _order.value != null;
  bool get inPickupPhase =>
      _order.value!.deliveryDirection == cModels.DeliveryDirection.FromCustomer;
  bool get pickuSetted => _order.value?.estimatedArrivalAtPickup != null;
  bool get dropoffSetted => _order.value?.estimatedArrivalAtDropoff != null;
  DateTime? get pickupTime => _order.value?.estimatedArrivalAtPickup;
  DateTime? get dropoffTime => _order.value?.estimatedArrivalAtDropoff;

  // streams //
  StreamSubscription<DeliveryOrder?>? orderStream;
  String? subscriptionId;

  // init
  Future<void> init({required int orderId}) async {
    _order.value = await get_driver_order_by_id(orderId: orderId);
    mezDbgPrint(
        "TIME FROM QUERY ========>${_order.value?.estimatedArrivalAtDropoff}");

    if (_order.value!.routeInformation != null) {
      mezDbgPrint(_order.value.toString());
      mapController.decodeAndAddPolyline(
          encodedPolylineString: _order.value!.routeInformation!.polyline);
    }

    if (_order.value == null) {
      mezDbgPrint(
          "🚨 Can't get order $orderId 🚨 DvRestaurantOrderViewController");
    } else {
      subscriptionId = hasuraDb.createSubscription(start: () {
        orderStream = listen_on_driver_order_by_id(orderId: orderId)
            .listen((DeliveryOrder? event) {
          if (event != null) {
            _order.value = null;
            _order.value = event;

            _order.refresh();

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
    mezDbgPrint(
        "Locations 📍  \n DROPOFF : ${_order.value!.dropOffLocation.toJson()}  \n PICKUP : ${_order.value!.pickupLocation?.toJson()} ,  \n DRIVER : ${_order.value!.driverLocation?.toJson()}");
    Future<void>.microtask(
      () => deliveryAuthAuthController.currentLocation != null
          ? mapController.setLocation(
              MezLocation.fromLocationData(
                deliveryAuthAuthController.currentLocation!,
              ),
            )
          : null,
    );
    mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    mapController.animateMarkersPolyLinesBounds.value = true;
    mapController.periodicRerendering.value = true;

    // doing this once to avoid doing it constaintly in [handleRestaurantOrder::switch::default]
    // Future.wait(<Future<void>>[
    // DESTINATION MARKER
    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: _order.value?.dropOffLocation.toLatLng(),
    );
    // USER MARKER
    mapController.addOrUpdateUserMarker(
      latLng: deliveryAuthAuthController.currentLocation?.toLatLng(),
      //  customImgHttpUrl:
    );
    // Restaurant Marker
    mapController.addOrUpdatePackageMarkerMarker(
      latLng: _order.value?.pickupLocation?.toLatLng(),
    );
    //   if (_order.value != null) handleRestaurantOrder(_order.value!);

    waitForOrderIfNotLoaded().then((void value) {
      if (_order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          MezRouter.back();
          MezSnackbar("Error", "Order does not exist");
        });
      } else {
        mezDbgPrint("InitiiiiiiiiiInitiiiiiiiiiInitiiiiiiiiiInitiiiiiiiii");
        initilizeMap(mapController, _order, _order.value!.serviceProvider);
      }
    });
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (_order.value != null) {
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
      // case DeliveryOrderStatus.PackageReady:
      //   // only update once upon Ready
      //   if (_statusSnapshot != order.status) {
      //     // ignoring customer's marker (destination)
      //     mapController.addOrUpdatePurpleDestinationMarker(
      //       latLng: order.dropoffLocation.toLatLng(),
      //       // fitWithinBounds: false,
      //     );
      //   }
      //   // update position of our delivery Guy
      //   mapController.addOrUpdateUserMarker(
      //       latLng: order.driverLocation,
      //       fitWithinBounds: true,
      //       customImgHttpUrl:
      //           Get.find<DeliveryAuthController>().driver!.driverInfo.image);
      //   mapController.animateAndUpdateBounds();
      //   _statusSnapshot = order.status;
      //   break;

      case cModels.DeliveryOrderStatus.OnTheWayToDropoff:
        // only update once.
        if (_statusSnapshot != order.status) {
          // ignoring Restaurant's marker
          mapController.addOrUpdateUserMarker(
            latLng: order.dropOffLocation.toLatLng(),
            markerId: order.serviceProvider.hasuraId.toString(),
            customImgHttpUrl: order.serviceProvider.image,
            fitWithinBounds: false,
          );

          mapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.dropOffLocation.toLatLng(),
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
// Order status change methods

  Future<void> startPickup() async {
    return _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus.OnTheWayToPickup,
    );
  }

  Future<void> startDropoff() async {
    return _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus.OnTheWayToDropoff,
    );
  }

  Future<void> finishDelivery() async {
    return _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus.Delivered,
    );
  }

  Future<void> atPickup() async {
    return _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus.AtPickup,
    );
  }

  Future<void> atDropoff() async {
    return _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus.AtDropoff,
    );
  }

  Future<void> _callRestaurantCloudFunction(
      cModels.DeliveryOrderStatus status) async {
    mezDbgPrint("😇 Status called ==========>$status");
    try {
      cModels.ChangeDeliveryStatusResponse res =
          await CloudFunctions.delivery2_changeStatus(
        deliveryId: order.orderId,
        newStatus: status,
      );
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      showErrorSnackBar(errorText: e.message.toString());
    }
  }

// dispose
  void dispose() {
    mezDbgPrint("Called dispose 😔😔😔😔");

    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    _order.close();
  }

  Future<void> setDropoffTime(DateTime newTime) async {
    isSettingDropoffTime.value = true;
    mezDbgPrint("Setting dropOff time ======>>> ⏰⏰⏰⏰⏰⏰  ");
    try {
      await dv_update_est_dropoff_time(orderId: order.orderId, time: newTime);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isSettingDropoffTime.value = false;
    }
  }

  Future<void> setPickupTime(DateTime newTime) async {
    isSettingPickUpTime.value = true;
    mezDbgPrint("Setting pickup time ======>>> ⏰⏰⏰⏰⏰⏰  ");
    try {
      await dv_update_est_pickup_time(orderId: order.orderId, time: newTime);
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isSettingPickUpTime.value = false;
    }
  }

  Future<void> acceptOpenOrder() async {
    try {
      cModels.AssignDriverResponse res =
          await CloudFunctions.delivery2_assignDriver(
              deliveryOrderId: order.orderId,
              deliveryDriverId:
                  deliveryAuthAuthController.driver!.deliveryDriverId);
      if (res.success == false) {
        mezDbgPrint(res.error);
        showErrorSnackBar(errorText: res.error.toString());
      }
    } on FirebaseFunctionsException catch (e, stk) {
      showErrorSnackBar(errorText: e.message.toString());
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
