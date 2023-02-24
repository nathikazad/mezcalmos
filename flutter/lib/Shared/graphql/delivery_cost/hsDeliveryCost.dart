import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/__generated/delivery_cost.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<DeliveryCost?> get_delivery_cost(
    {required int deliveryDetailsId, bool withCache = true}) async {
  mezDbgPrint("Getting dv cost =====🥹");
  final QueryResult<Query$getDeliveryCostById> response =
      await _db.graphQLClient.query$getDeliveryCostById(
    Options$Query$getDeliveryCostById(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables: Variables$Query$getDeliveryCostById(
          deliveryDetailsId: deliveryDetailsId),
    ),
  );
  if (response.parsedData?.delivery_details_by_pk == null) {
    throw Exception("🚨🚨 get_delivery_cost exceptions ${response.exception}");
  }
  mezDbgPrint(
      "Getting dv cost =====🥹==>${response.parsedData?.delivery_details_by_pk}");

  final Query$getDeliveryCostById$delivery_details_by_pk data =
      response.parsedData!.delivery_details_by_pk!;
  return DeliveryCost(
      id: data.id,
      selfDelivery: data.self_delivery,
      // serviceProviderType: providerType,
      // serviceProviderId: serviceProviderId,
      minimumCost: data.minimum_cost,
      costPerKm: data.cost_per_km,
      freeDeliveryMinimumCost: data.free_delivery_minimum_cost,
      freeDeliveryKmRange: data.free_delivery_km_range);
}

Future<bool?> update_delivery_cost(
    {required int deliveryCostId, required DeliveryCost deliveryCost}) async {
  final QueryResult<Mutation$updateDeliveryCost> response = await _db
      .graphQLClient
      .mutate$updateDeliveryCost(Options$Mutation$updateDeliveryCost(
          variables: Variables$Mutation$updateDeliveryCost(
              id: deliveryCostId,
              data: Input$delivery_details_set_input(
                  cost_per_km: deliveryCost.costPerKm,
                  minimum_cost: deliveryCost.minimumCost,
                  free_delivery_km_range: deliveryCost.freeDeliveryKmRange,
                  free_delivery_minimum_cost:
                      deliveryCost.freeDeliveryMinimumCost))));
  if (response.parsedData?.update_delivery_details_by_pk == null) {
    mezDbgPrint("Response ===> $response");
    throw Exception(
        "🚨🚨 update_delivery_cost exceptions ${response.exception}");
  }

  return true;
}

Future<int?> add_delivery_cost({required DeliveryCost deliveryCost}) async {
  final QueryResult<Mutation$addDeliveryCost> response = await _db.graphQLClient
      .mutate$addDeliveryCost(Options$Mutation$addDeliveryCost(
          variables: Variables$Mutation$addDeliveryCost(
              deliveryCost: Input$delivery_details_insert_input(
    free_delivery_km_range: deliveryCost.freeDeliveryKmRange,
    free_delivery_minimum_cost: deliveryCost.freeDeliveryMinimumCost,
    minimum_cost: deliveryCost.minimumCost,
    cost_per_km: deliveryCost.costPerKm,
  ))));

  if (response.parsedData?.insert_delivery_details_one == null) {
    throw Exception("🚨🚨 add_delivery_cost exceptions ${response.exception}");
  }
  return response.parsedData!.insert_delivery_details_one!.id;

  // final Query$getDeliveryCostByServiceProviderId$delivery_cost data =
  //     response.parsedData!.delivery_cost.first;
  // return DeliveryCost(
  //     serviceProviderType: data.service_provider_type.toString().toOrderType(),
  //     serviceProviderId: serviceProviderId,
  //     minimumCost: data.minimum_cost,
  //     costPerKm: data.cost_per_km,
  //     freeDeliveryMinimumCost: data.free_delivery_minimum_cost,
  //     freeDeliveryKmRange: data.free_delivery_km_range);
}
