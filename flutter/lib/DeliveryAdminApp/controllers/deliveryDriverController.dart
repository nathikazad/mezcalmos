import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class DeliveryDriverController extends GetxController {
  Future<ServerResponse> assignDeliveryDriver(String deliveryDriverId,
      {DeliveryDriverType deliveryDriverType =
          DeliveryDriverType.Pickup}) async {
    HttpsCallable dropOrderFunction =
        FirebaseFunctions.instance.httpsCallable('delivery-assignDriver');
    try {
      HttpsCallableResult response = await dropOrderFunction.call({
        "deliveryDriverId": deliveryDriverId,
        "deliveryDriverType": deliveryDriverType.toFirebaseFormatString()
      });
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
