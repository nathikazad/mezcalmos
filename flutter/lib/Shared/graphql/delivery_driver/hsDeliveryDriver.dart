import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/__generated/delivery_driver.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCompanyType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

HasuraDb _db = Get.find<HasuraDb>();

/// fetch all drivers associtaed with specefic service provider
///
/// by using the service provider id
Future<List<DeliveryDriver>?> get_drivers_by_service_provider_id(
    {required int serviceProviderId, bool withCache = true}) async {
  final QueryResult<Query$getDriversByServiceId> response =
      await _db.graphQLClient.query$getDriversByServiceId(
    Options$Query$getDriversByServiceId(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables:
          Variables$Query$getDriversByServiceId(serviceId: serviceProviderId),
    ),
  );
  if (response.parsedData?.delivery_driver == null) {
    throw Exception(
        " 🚨🚨 Getting drivers of service $serviceProviderId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Getting drivers query ✅✅ ===>${response.parsedData?.delivery_driver}");
    final List<Query$getDriversByServiceId$delivery_driver> data =
        response.parsedData!.delivery_driver;
    final List<DeliveryDriver> drivers =
        data.map((Query$getDriversByServiceId$delivery_driver driverData) {
      return DeliveryDriver(
          deliveryDriverState: DeliveryDriverState(
              status: driverData.status.toAgentStatus(),
              online: driverData.online,
              deliveryCompanyId: driverData.delivery_company_id.toString(),
              deliveryCompanyType:
                  driverData.delivery_company_type.toDeliveryCompanyType()),
          deliveryDriverId: driverData.id.toString(),
          driverInfo: DeliveryDriverUserInfo(
              hasuraId: driverData.id,
              image: driverData.user.image,
              language: driverData.user.language_id.toString().toLanguageType(),
              name: driverData.user.name));
    }).toList();
    return drivers;
  }
}

/// fetch all drivers associtaed with specefic service provider
///
/// by using the service provider id
Future<bool?> update_driver_status_by_id(
    {required int driverId,
    required AgentStatus agentStatus,
    bool withCache = true}) async {
  final QueryResult<Mutation$updateDeliveryDriverById> response =
      await _db.graphQLClient.mutate$updateDeliveryDriverById(
          Options$Mutation$updateDeliveryDriverById(
    variables: Variables$Mutation$updateDeliveryDriverById(
        driverId: driverId,
        driverData: Input$delivery_driver_set_input(
            status: agentStatus.toFirebaseFormatString())),
  ));

  if (response.parsedData?.update_delivery_driver_by_pk == null) {
    throw Exception(
        " 🚨🚨 Updating driver  $driverId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Updating driver mutation ✅✅ ===>${response.parsedData?.update_delivery_driver_by_pk}");
    final Mutation$updateDeliveryDriverById$update_delivery_driver_by_pk data =
        response.parsedData!.update_delivery_driver_by_pk!;
    return true;
  }
}

Future<bool?> delete_delivery_driver_by_id(
    {required int driverId, bool withCache = true}) async {
  final QueryResult<Mutation$deleteDriverById> response =
      await _db.graphQLClient.mutate$deleteDriverById(
    Options$Mutation$deleteDriverById(
      variables: Variables$Mutation$deleteDriverById(driverId: driverId),
    ),
  );

  if (response.parsedData?.delete_delivery_driver_by_pk == null) {
    throw Exception(
        " 🚨🚨 Updating driver  $driverId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Deleting driver mutation ✅✅ ===>${response.parsedData?.delete_delivery_driver_by_pk}");
    return true;
  }
}
