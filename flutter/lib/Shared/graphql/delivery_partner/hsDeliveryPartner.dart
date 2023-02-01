import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_partner/__generated/delivery_partner.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
              serviceId: serviceId,
              newCompanyId: newCompanyId,
              serviceType: providerType.toFirebaseFormatString())));
  if (res.parsedData?.update_service_provider_delivery_partner?.returning ==
      null) {
    throwError(res.exception);
  }
  return res.parsedData!.update_service_provider_delivery_partner!.returning
      .first.delivery_company_id;
}
