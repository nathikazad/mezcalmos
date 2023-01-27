// import 'package:get/get.dart';
// import 'package:graphql/src/core/query_result.dart';
// import 'package:mezcalmos/Shared/database/HasuraDb.dart';
// import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
// import 'package:mezcalmos/Shared/graphql/service_provider/location/__generated/service_provider_location.graphql.dart';
// import 'package:mezcalmos/Shared/helpers/ErrorHandlingHelpers.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

// HasuraDb _hasuraDb = Get.find<HasuraDb>();

// Future<bool> update_service_location(
//     {required int serviceProviderId,
//     required ServiceProviderType providerType,
//     required Location location}) async {
//   final QueryResult<Mutation$updateServiceLocation> res = await _hasuraDb
//       .graphQLClient
//       .mutate$updateServiceLocation(Options$Mutation$updateServiceLocation(
//           variables: Variables$Mutation$updateServiceLocation(
//               serviceId: serviceProviderId,
//               serviceType: providerType.toFirebaseFormatString(),
//               data: Input$service_provider_location_set_input(
//                   address: location.address, gps: location.toGeography()))));
//   if (res.parsedData?.update_service_provider_location == null) {
//     throwError(res.exception);
//   }
//   return true;
// }
