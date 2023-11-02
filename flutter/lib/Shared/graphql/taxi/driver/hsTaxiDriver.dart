import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/taxi/driver/__generated/taxi_driver.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCompanyType.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<DeliveryDriver?> get_taxi_driver_by_user_id(
    {required int userId, bool withCache = true}) async {
  final QueryResult<Query$getTaxiDriversByUserId> response = await _db
      .graphQLClient
      .query$getTaxiDriversByUserId(Options$Query$getTaxiDriversByUserId(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getTaxiDriversByUserId(userId: userId)));

  if (response.parsedData?.taxi_driver == null) {
    throw Exception(
        " 🚨🚨 Getting driver by user id $userId exceptions 🚨🚨 \n ${response.exception}");
  } else {
    mezDbgPrint(
        "Getting driver query ✅✅ ===>${response.parsedData?.taxi_driver}");
    final List<Query$getTaxiDriversByUserId$taxi_driver> data =
        response.parsedData!.taxi_driver;
    if (data.isNotEmpty) {
      return DeliveryDriver(
          deliveryDriverState: DeliveryDriverState(
              status: data.first.status!.toAgentStatus(),
              online: data.first.online!,
              deliveryCompanyId: data.first.delivery_company_id,
              deliveryCompanyType:
                  data.first.delivery_company_type!.toDeliveryCompanyType()),
          deliveryDriverId: data.first.id!,
          driverInfo: DeliveryDriverUserInfo(
              hasuraId: data.first.user!.id,
              image: data.first.user!.image,
              language: data.first.user!.language_id.toString().toLanguage(),
              name: data.first.user!.name),
          type: DeliveryDriverType.Delivery_driver);
    }
  }
  return null;
}
