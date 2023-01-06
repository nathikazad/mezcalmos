import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class PickDriverController {
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
    order.value = await get_driver_order_by_id(orderId: orderId);
    if (order.value != null) {
      serviceProviderId = order.value?.serviceInfo.hasuraId;
      await _getDrivers();
    }
  }

  // assign driver //
  Future<ServerResponse> assignDriver({
    required DeliveryDriver driver,
  }) async {
    screenLoading.value = true;

    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('delivery2-assignDriver');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderType": order.value!.serviceProviderType!.toFirebaseFormatString(),
        "deliveryOrderId": order.value!.id,
        "deliveryDriverId": driver.deliveryDriverId,
        "deliveryCompanyId": driver.deliveryDriverState.deliveryCompanyId,
        "deliveryDriverType":
            DeliveryDriverType.Delivery_driver.toFirebaseFormatString(),
        "changeDriver": order.value!.driverAssigned
      });
      mezDbgPrint("Response : ${response.data}");
      screenLoading.value = false;
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      screenLoading.value = false;
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  // dispose //
  void dispose() {
    drivers.clear();
  }

  Future<void> _getDrivers() async {
    drivers.clear();
    drivers.value = await get_drivers_by_service_provider_id(
            withCache: false, serviceProviderId: serviceProviderId!) ??
        [];
  }
}
