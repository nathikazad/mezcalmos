import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/__generated/delivery_driver.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
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
              deliveryCompanyId: driverData.delivery_company_id,
              deliveryCompanyType:
                  driverData.delivery_company_type.toDeliveryCompanyType()),
          deliveryDriverId: driverData.id,
          driverLocation: (driverData.current_location != null)
              ? LatLng(driverData.current_location!.latitude,
                  driverData.current_location!.longitude)
              : null,
          driverInfo: DeliveryDriverUserInfo(
            hasuraId: driverData.user.id,
            image: driverData.user.image,
            language: driverData.user.language_id.toString().toLanguageType(),
            name: driverData.user.name,
          ),
          type: DeliveryDriverType.Delivery_driver);
    }).toList();
    return drivers;
  }
}

Future<DeliveryDriver?> get_driver_by_user_id(
    {required int userId, bool withCache = true}) async {
  final QueryResult<Query$getDriversByUserId> response = await _db.graphQLClient
      .query$getDriversByUserId(Options$Query$getDriversByUserId(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getDriversByUserId(userId: userId)));

  if (response.parsedData?.delivery_driver == null) {
    throw Exception(
        " 🚨🚨 Getting driver by user id $userId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Getting driver query ✅✅ ===>${response.parsedData?.delivery_driver}");
    final List<Query$getDriversByUserId$delivery_driver> data =
        response.parsedData!.delivery_driver;
    if (data.isNotEmpty) {
      return DeliveryDriver(
          deliveryDriverState: DeliveryDriverState(
              status: data.first.status.toAgentStatus(),
              online: data.first.online,
              deliveryCompanyId: data.first.delivery_company_id,
              deliveryCompanyType:
                  data.first.delivery_company_type.toDeliveryCompanyType()),
          deliveryDriverId: data.first.id,
          driverInfo: DeliveryDriverUserInfo(
              hasuraId: data.first.user.id,
              image: data.first.user.image,
              language: data.first.user.language_id.toString().toLanguageType(),
              name: data.first.user.name),
          type: DeliveryDriverType.Delivery_driver);
    }
  }
  return null;
}

// Future<int?> insert_driver(
//     {required DeliveryDriver driver, required int userId}) async {
//   final QueryResult<Mutation$insertDriver> response =
//       await _db.graphQLClient.mutate$insertDriver(
//     Options$Mutation$insertDriver(
//       variables: Variables$Mutation$insertDriver(
//         driver: Input$delivery_driver_insert_input(
//           user_id: userId,
//         ),
//       ),
//     ),
//   );
//   return null;
// }

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

Future<bool?> switch_driver_online_status_by_id(
    {required int driverId,
    required bool online,
    bool withCache = true}) async {
  final QueryResult<Mutation$updateDeliveryDriverById> response =
      await _db.graphQLClient.mutate$updateDeliveryDriverById(
          Options$Mutation$updateDeliveryDriverById(
    fetchPolicy: FetchPolicy.networkOnly,
    variables: Variables$Mutation$updateDeliveryDriverById(
        driverId: driverId,
        driverData: Input$delivery_driver_set_input(online: online)),
  ));

  if (response.parsedData?.update_delivery_driver_by_pk == null) {
    throw Exception(
        " 🚨🚨 Updating driver  $driverId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Updating driver mutation ✅✅ ===>${response.parsedData?.update_delivery_driver_by_pk}");
    final bool data = response.parsedData!.update_delivery_driver_by_pk!.online;
    return data;
  }
}

Future<Geography?> update_driver_location_by_id(
    {required int driverId,
    required double lat,
    required double long,
    bool withCache = true}) async {
  final QueryResult<Mutation$updateDriverLocation> response = await _db
      .graphQLClient
      .mutate$updateDriverLocation(Options$Mutation$updateDriverLocation(
    variables: Variables$Mutation$updateDriverLocation(
        driverId: driverId,
        data: Input$delivery_driver_set_input(
            current_location: Geography(lat, long))),
  ));

  if (response.parsedData?.update_delivery_driver_by_pk?.current_location ==
      null) {
    throw Exception(
        " 🚨🚨 Updating driver  $driverId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    final Mutation$updateDriverLocation$update_delivery_driver_by_pk data =
        response.parsedData!.update_delivery_driver_by_pk!;
    return data.current_location;
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

Stream<AgentStatus?> listen_driver_status({required int driverId}) {
  return _db.graphQLClient
      .subscribe$driverStatusStream(Options$Subscription$driverStatusStream(
          variables:
              Variables$Subscription$driverStatusStream(userId: driverId)))
      .map((QueryResult<Subscription$driverStatusStream> event) {
    if (event.hasException) {
      throw Exception(event.exception);
    } else if (event.parsedData?.delivery_driver == null ||
        event.parsedData!.delivery_driver.isEmpty) {
      return null;
    } else {
      return event.parsedData!.delivery_driver.first.status.toAgentStatus();
    }
  });
}
