import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/__generated/delivery_cost.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<DeliveryCost?> get_delivery_cost(
    {required int serviceProviderId, bool withCache = true}) async {
  final QueryResult<Query$getDeliveryCostByServiceProviderId> response =
      await _db.graphQLClient.query$getDeliveryCostByServiceProviderId(
    Options$Query$getDeliveryCostByServiceProviderId(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables: Variables$Query$getDeliveryCostByServiceProviderId(
          serviceProviderId: serviceProviderId),
    ),
  );
  if (response.parsedData?.delivery_cost == null) {
    throw Exception("🚨🚨 get_delivery_cost exceptions ${response.exception}");
  }

  if (response.parsedData!.delivery_cost.isNotEmpty) {
    final Query$getDeliveryCostByServiceProviderId$delivery_cost data =
        response.parsedData!.delivery_cost.first;
    return DeliveryCost(
        id: data.id,
        serviceProviderType:
            data.service_provider_type.toString().toOrderType(),
        serviceProviderId: serviceProviderId,
        minimumCost: data.minimum_cost,
        costPerKm: data.cost_per_km,
        freeDeliveryMinimumCost: data.free_delivery_minimum_cost,
        freeDeliveryKmRange: data.free_delivery_km_range);
  }
  return null;
}

Future<bool?> update_delivery_cost(
    {required int deliveryCostId, required DeliveryCost deliveryCost}) async {
  final QueryResult<Mutation$updateDeliveryCost> response = await _db
      .graphQLClient
      .mutate$updateDeliveryCost(Options$Mutation$updateDeliveryCost(
          variables: Variables$Mutation$updateDeliveryCost(
              id: deliveryCostId,
              data: Input$delivery_cost_set_input(
                  cost_per_km: deliveryCost.costPerKm,
                  minimum_cost: deliveryCost.minimumCost,
                  free_delivery_km_range: deliveryCost.freeDeliveryKmRange,
                  free_delivery_minimum_cost:
                      deliveryCost.freeDeliveryMinimumCost))));
  if (response.parsedData?.update_delivery_cost_by_pk == null) {
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
              deliveryCost: Input$delivery_cost_insert_input(
    service_provider_id: deliveryCost.serviceProviderId,
    service_provider_type:
        deliveryCost.serviceProviderType.toFirebaseFormatString(),
    free_delivery_km_range: deliveryCost.freeDeliveryKmRange,
    free_delivery_minimum_cost: deliveryCost.freeDeliveryMinimumCost,
    minimum_cost: deliveryCost.minimumCost,
    cost_per_km: deliveryCost.costPerKm,
  ))));

  if (response.parsedData?.insert_delivery_cost_one == null) {
    throw Exception("🚨🚨 add_delivery_cost exceptions ${response.exception}");
  }
  return response.parsedData!.insert_delivery_cost_one!.id;

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
