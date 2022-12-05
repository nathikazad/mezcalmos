import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

class ROpDriversViewController {
  // instances and streams subscriptions

  RxList<DeliveryDriver> drivers = RxList.empty();

  RxnString opDeepLink = RxnString();
  RxnString qrImageLink = RxnString();

  Rxn<ServiceLink> serviceLink = Rxn();

  // getters //
  /// Restaurant already has deep links generated
  bool get hasLinks {
    return serviceLink.value != null &&
        serviceLink.value!.driverDeepLink != null &&
        serviceLink.value!.driverQrImageLink != null;
  }

  // late variables //

  late int restaurantId;
  Future<void> init({required int restaurantID}) async {
    restaurantId = restaurantID;
    await fetchServiceLinks();

    mezDbgPrint("Init operators of restaurant id  ====>$restaurantId");
  }

  Future<void> fetchServiceLinks() async {
    try {
      serviceLink.value = await get_service_link_by_id(
          serviceProviderId: restaurantId, withCache: false);
    } on Exception {
      mezDbgPrint("Service dont have links");
    }
  }

  Future<ServerResponse> generateLinks() async {
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-genDriverLink');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "providerId": restaurantId,
        "providerType": OrderType.Restaurant.toFirebaseFormatString()
      });
      mezDbgPrint("Response : ${response.data}");

      return ServerResponse.fromJson(response.data);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e");
      mezDbgPrint("Errrooooooooor =======> $stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
