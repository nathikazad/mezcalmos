import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_partner/__generated/delivery_partner.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<int?> get_service_delivery_partner(
    {required int serviceId, required ServiceProviderType providerType}) async {
  final QueryResult<Query$getDeliveryPartner> res = await _db.graphQLClient
      .query$getDeliveryPartner(Options$Query$getDeliveryPartner(
          variables: Variables$Query$getDeliveryPartner(
              serviceId: serviceId,
              serviceType: providerType.toFirebaseFormatString())));
  if (res.parsedData?.service_provider_delivery_partner == null) {
    throwError(res.exception);
  }
  if (res.parsedData!.service_provider_delivery_partner.isNotEmpty) {
    return res.parsedData!.service_provider_delivery_partner.first
        .delivery_company_id;
  }
  return null;
}

Future<int?> update_service_delivery_partner(
    {required int serviceId,
    required ServiceProviderType providerType,
    required int newCompanyId}) async {
  final QueryResult<Mutation$updateDeliveryPartner> res = await _db
      .graphQLClient
      .mutate$updateDeliveryPartner(Options$Mutation$updateDeliveryPartner(
          variables: Variables$Mutation$updateDeliveryPartner(
              data: Input$service_provider_delivery_partner_insert_input(
    delivery_company_id: newCompanyId,
    service_provider_id: serviceId,
    service_provider_type: providerType.toFirebaseFormatString(),
  ))));
  mezDbgPrint(res.data);
  if (res.parsedData?.insert_service_provider_delivery_partner_one == null) {
    throwError(res.exception);
  }
  return res.parsedData!.insert_service_provider_delivery_partner_one!
      .delivery_company_id;
}
