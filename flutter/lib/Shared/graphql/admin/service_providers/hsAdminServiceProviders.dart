import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/service_providers/__generated/service_providers.graphql.dart';
import 'package:mezcalmos/Shared/helpers/ErrorHandlingHelpers.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<ServiceInfo>> admin_get_restaurants() async {
  final QueryResult<Query$admin_get_restaurants> result = await _hasuraDb
      .graphQLClient
      .query$admin_get_restaurants(Options$Query$admin_get_restaurants());
  if (result.parsedData?.restaurant_restaurant == null) {
    throwError(result.exception);
  }
  final List<Query$admin_get_restaurants$restaurant_restaurant> data =
      result.parsedData!.restaurant_restaurant;
  return data
      .map((Query$admin_get_restaurants$restaurant_restaurant data) =>
          ServiceInfo(
              location: Location.fromHasura(
                  data.location!.gps, data.location!.address),
              hasuraId: data.id,
              image: data.image,
              name: data.name))
      .toList();
}

Future<List<UserInfo>> admin_get_dv_companies() async {
  final QueryResult<Query$admin_get_dv_companies> result = await _hasuraDb
      .graphQLClient
      .query$admin_get_dv_companies(Options$Query$admin_get_dv_companies());
  if (result.parsedData?.delivery_company == null) {
    throwError(result.exception);
  }
  final List<Query$admin_get_dv_companies$delivery_company> data =
      result.parsedData!.delivery_company;
  return data
      .map((Query$admin_get_dv_companies$delivery_company data) =>
          UserInfo(hasuraId: data.id, image: data.image, name: data.name))
      .toList();
}
