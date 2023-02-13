import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/__generated/service_providers.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/DeliveryCompany/DeliveryCompany.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<Restaurant>> admin_get_restaurants(
    {bool withCache = true, required int limit}) async {
  final QueryResult<Query$admin_get_restaurants> result = await _hasuraDb
      .graphQLClient
      .query$admin_get_restaurants(Options$Query$admin_get_restaurants(
          variables: Variables$Query$admin_get_restaurants(limit: limit),
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache));
  if (result.parsedData?.restaurant_restaurant == null) {
    throwError(result.exception);
  }
  final List<Query$admin_get_restaurants$restaurant_restaurant> data =
      result.parsedData!.restaurant_restaurant;
  final List<Restaurant> returnedList = data
      .map((Query$admin_get_restaurants$restaurant_restaurant data) =>
          Restaurant(
              deliveryDetailsId: data.delivery_details_id,
              userInfo: ServiceInfo(
                  location: MezLocation.fromHasura(
                      data.location.gps, data.location.address),
                  hasuraId: data.id,
                  image: data.image,
                  name: data.name),
              paymentInfo: null,
              primaryLanguage: LanguageType.EN,
              restaurantState: ServiceState(
                  data.open_status.toServiceStatus(), data.approved),
              schedule: null))
      .toList();
  returnedList.sort((Restaurant a, Restaurant b) =>
      a.info.hasuraId.compareTo(b.info.hasuraId));
  return returnedList;
}

Future<List<DeliveryCompany>> admin_get_dv_companies(
    {required int limit, bool withCache = true}) async {
  final QueryResult<Query$admin_get_dv_companies> result = await _hasuraDb
      .graphQLClient
      .query$admin_get_dv_companies(Options$Query$admin_get_dv_companies(
          variables: Variables$Query$admin_get_dv_companies(limit: limit),
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache));
  if (result.parsedData?.delivery_company == null) {
    throwError(result.exception);
  }
  final List<Query$admin_get_dv_companies$delivery_company> data =
      result.parsedData!.delivery_company;
  mezDbgPrint("Getting companies ============>>>👋 ===>${result.data}");
  final List<DeliveryCompany> returnedList = data
      .map((Query$admin_get_dv_companies$delivery_company data) =>
          DeliveryCompany(
              deliveryDetailsId: data.delivery_details_id,
              info: ServiceInfo(
                  hasuraId: data.id,
                  image: data.image,
                  name: data.name,
                  location: MezLocation.fromHasura(
                      data.location.gps, data.location.address)),
              creationTime: DateTime.parse(data.creation_time),
              primaryLanguage: LanguageType.EN,
              state: ServiceState(
                  data.open_status.toServiceStatus(), data.approved)))
      .toList();
  returnedList.sort((DeliveryCompany a, DeliveryCompany b) =>
      a.info.hasuraId.compareTo(b.info.hasuraId));
  return returnedList;
}
