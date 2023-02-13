import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/__generated/service_provider.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

HasuraDb _db = Get.find<HasuraDb>();

// querries //
Future<ServiceLink?> get_service_link_by_id(
    {required int serviceProviderId, bool withCache = true}) async {
  final QueryResult<Query$getServiceProviderLinks> response =
      await _db.graphQLClient.query$getServiceProviderLinks(
    Options$Query$getServiceProviderLinks(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceProviderLinks(
          serviceProviderId: serviceProviderId),
    ),
  );

  if (response.parsedData?.service_provider_service_link == null) {
    mezDbgPrint(
        "🚨🚨🚨 hasura query service links faild \n  Data from response \n ${response.data} \n Exceptions from hasura \n ${response.exception}");
  } else if (response.parsedData!.service_provider_service_link.isEmpty) {
    throw Exception("No service links found for this service provider");
  } else {
    final Query$getServiceProviderLinks$service_provider_service_link data =
        response.parsedData!.service_provider_service_link.first;
    mezDbgPrint("✅ Getting service links done ✅ \n ${data.toJson()}");
    return ServiceLink(
        id: data.id,
        driverDeepLink: data.driver_deep_link,
        driverQrImageLink: data.driver_qr_image_link,
        operatorDeepLink: data.operator_deep_link,
        operatorQrImageLink: data.operator_qr_image_link);
  }

  return null;
}
