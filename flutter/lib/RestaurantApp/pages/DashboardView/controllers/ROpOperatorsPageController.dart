import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

class ROpOperatorsViewController {
  // Variables //
  RxList<RestaurantOperator> operators = RxList([]);
  RxnString opDeepLink = RxnString();
  RxnString qrImageLink = RxnString();

  Rxn<ServiceLink> serviceLink = Rxn();

  // getters //
  /// Restaurant already has deep links generated
  bool get hasLinks {
    return serviceLink.value != null &&
        serviceLink.value!.operatorDeepLink != null &&
        serviceLink.value!.operatorQrImageLink != null;
  }

  // late variables //

  late int restaurantId;
  Future<void> init({required int restaurantID}) async {
    restaurantId = restaurantID;
    await fetchServiceLinks();

    mezDbgPrint("Init operators of restaurant id  ====>$restaurantId");
    await fetchOperators();
  }

  Future<void> fetchServiceLinks() async {
    try {
      serviceLink.value = await get_service_link_by_id(
          serviceProviderId: restaurantId, withCache: false);
    } on Exception {
      mezDbgPrint("Service dont have links");
    }
  }

  Future<void> fetchOperators() async {
    operators.clear();
    operators.value = await get_restaurant_operators(
            restaurantId: restaurantId, withCache: false) ??
        [];
  }

  Future<ServerResponse> generateLinks() async {
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-genOperatorLink');
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

  Future<ServerResponse> approveOperator(
      {required bool approved, required int opId}) async {
    final HttpsCallable cloudFunction = FirebaseFunctions.instance
        .httpsCallable('restaurant2-authorizeRestaurantOperator');
    try {
      final HttpsCallableResult response = await cloudFunction
          .call({"newOperatorId": opId, "approved": approved});
      mezDbgPrint("Response : ${response.data}");

      return ServerResponse(ResponseStatus.Success);
    } catch (e, stk) {
      mezDbgPrint("Errrooooooooor =======> $e");
      mezDbgPrint("Errrooooooooor =======> $stk");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
}
