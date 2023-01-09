import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

abstract class OperatorsListViewController {
  // instances and streams subscriptions

  RxList<Operator> operators = RxList.empty();

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

  late int serviceProviderId;
  Future<void> init({required int serviceProviderId}) async {
    this.serviceProviderId = serviceProviderId;
    await fetchOperators();
    await fetchServiceLinks();

    mezDbgPrint("Init operators of restaurant id  ====>$serviceProviderId");
  }

  Future<void> fetchServiceLinks() async {
    try {
      serviceLink.value = await get_service_link_by_id(
          serviceProviderId: serviceProviderId, withCache: false);
    } on Exception {
      mezDbgPrint("Service dont have links");
    }
  }

  Future<void> fetchOperators() async {
    // try {
    //   operators.value = await get_drivers_by_service_provider_id(
    //           serviceProviderId: serviceProviderId, withCache: false) ??
    //       [];
    // } on Exception catch (e, stk) {
    //   mezDbgPrint("Service dont have drivers yet");
    //   mezDbgPrint(e);
    //   mezDbgPrint(stk);
    // }
  }

  Future<ServerResponse> approveOperator(
      {required bool approved, required int opId}) async {
    final HttpsCallable cloudFunction = FirebaseFunctions.instance
        .httpsCallable('restaurant2-authorizeRestaurantOperator');
    try {
      final HttpsCallableResult response = await cloudFunction
          .call({"newOperatorId": opId, "approved": approved});
      mezDbgPrint("Response : ${response.data}");
      await fetchOperators();
      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e");
      mezDbgPrint("Errrooooooooor =======> $stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}

class DeliveryOperatorsListViewController extends OperatorsListViewController {
  // todo change to auhtorize from company
  @override
  Future<void> fetchOperators() async {
    operators.clear();
    operators.value = await get_restaurant_operators(
            restaurantId: serviceProviderId, withCache: false) ??
        [];
  }

  @override
  Future<ServerResponse> approveOperator(
      {required bool approved, required int opId}) async {
    final HttpsCallable cloudFunction = FirebaseFunctions.instance
        .httpsCallable('restaurant2-authorizeRestaurantOperator');
    try {
      final HttpsCallableResult response = await cloudFunction
          .call({"newOperatorId": opId, "approved": approved});
      mezDbgPrint("Response : ${response.data}");
      await fetchOperators();
      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e");
      mezDbgPrint("Errrooooooooor =======> $stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
  // todo delete //
}

class RestaurantOperatorsListViewController
    extends OperatorsListViewController {
  @override
  Future<void> fetchOperators() async {
    operators.clear();
    operators.value = await get_restaurant_operators(
            restaurantId: serviceProviderId, withCache: false) ??
        [];
  }

  @override
  Future<ServerResponse> approveOperator(
      {required bool approved, required int opId}) async {
    final HttpsCallable cloudFunction = FirebaseFunctions.instance
        .httpsCallable('restaurant2-authorizeRestaurantOperator');
    try {
      final HttpsCallableResult response = await cloudFunction
          .call({"newOperatorId": opId, "approved": approved});
      mezDbgPrint("Response : ${response.data}");
      await fetchOperators();
      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e");
      mezDbgPrint("Errrooooooooor =======> $stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
  // todo delete //
}
