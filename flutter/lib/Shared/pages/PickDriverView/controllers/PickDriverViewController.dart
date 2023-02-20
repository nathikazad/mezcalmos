import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;

class PickDriverViewController {
  final MGoogleMapController mapController = MGoogleMapController();

  RxList<DeliveryDriver> drivers = RxList.empty();
  RxBool screenLoading = RxBool(false);
  int? serviceProviderId;
  late int orderId;
  Rxn<DeliveryOrder> order = Rxn();
  // init //
  Future<void> init({
    required int orderId,
  }) async {
    this.orderId = orderId;

    // assigning restaurant data and start the stream subscription //
    try {
      order.value = await get_pick_driver_order_by_id(orderId: orderId);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    if (order.value != null) {
      serviceProviderId = order.value?.deliveryCompany.hasuraId;
      await _getDrivers();
      await _initMap();
    }
  }

  // assign driver //
  Future<void> assignDriver({
    required DeliveryDriver driver,
  }) async {
    screenLoading.value = true;

    try {
      mezDbgPrint("calling assign driver....");
      await CloudFunctions.delivery2_assignDriver(
        deliveryOrderId: orderId,
        deliveryDriverId: driver.deliveryDriverId,
        changeDriver: order.value!.isDriverAssigned,
      );
      MezRouter.back();
      screenLoading.value = false;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      screenLoading.value = false;
      showErrorSnackBar(
        errorText: e.toString(),
      );
    }

    // final HttpsCallable cloudFunction =
    //     FirebaseFunctions.instance.httpsCallable('delivery2-assignDriver');
    // try {
    //   final HttpsCallableResult response = await cloudFunction.call({
    //     "orderType": order.value!.orderType.toFirebaseFormatString(),
    //     "deliveryOrderId": order.value!.id,
    //     "deliveryDriverId": driver.deliveryDriverId,
    //     "deliveryCompanyId": driver.deliveryDriverState.deliveryCompanyId,
    //     "deliveryDriverType":
    //         DeliveryDriverType.Delivery_driver.toFirebaseFormatString(),
    //     "changeDriver": order.value!.driverAssigned
    //   });
    //   mezDbgPrint("Response : ${response.data}");
    //   screenLoading.value = false;
    //   return ServerResponse.fromJson(response.data);
    // } catch (e) {
    //   mezDbgPrint("Errrooooooooor =======> $e");
    //   screenLoading.value = false;
    //   return ServerResponse(ResponseStatus.Error,
    //       errorMessage: "Server Error", errorCode: "serverError");
    // }
  }

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
    await mapController.addOrUpdatePackageMarkerMarker(
      latLng: order.value?.pickupLocation.toLatLng(),
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
    drivers.forEach((DeliveryDriver _driver) {
      mezDbgPrint("driver loc =========>" + _driver.driverLocation.toString());
      if (_driver.driverLocation != null) {
        mapController.addOrUpdateUserMarker(
          latLng: _driver.driverLocation,
          customImgHttpUrl: _driver.driverInfo.image,
          markerId: _driver.driverInfo.hasuraId.toString(),
        );
      }
    });
  }
  // await mapController.animateAndUpdateBounds(
  //     shouldFitPolylineInBound: order.value?.routeInformation != null);

  // dispose //
  void dispose() {
    drivers.clear();
  }

  Future<void> _getDrivers() async {
    mezDbgPrint(
        "ORDER DELIVERCOMPANY 👋===> ${order.value!.deliveryCompany.hasuraId}");
    mezDbgPrint(order.value!.deliveryCompany.hasuraId);
    drivers.clear();
    drivers.value = await get_drivers_by_service_provider_id(
            withCache: false,
            serviceProviderId: order.value!.deliveryCompany.hasuraId) ??
        [];
  }
}
