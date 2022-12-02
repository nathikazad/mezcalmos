import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurantOperator/__generated/restaurantOperator.graphql.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<RestaurantOperatorState?> get_operator_state(
    {required int operatorId}) async {
  final QueryResult<Query$getOperatorRestaurantInfo> response =
      await _db.graphQLClient.query$getOperatorRestaurantInfo(
    Options$Query$getOperatorRestaurantInfo(
      variables:
          Variables$Query$getOperatorRestaurantInfo(operatorId: operatorId),
    ),
  );
  if (response.hasException) {
    throw Exception("get opertor restaurant id error ${response.exception}");
  } else {
    final List<Query$getOperatorRestaurantInfo$restaurant_operator>? data =
        response.parsedData?.restaurant_operator;
    if (data != null && data.isNotEmpty) {
      final RestaurantOperatorState state = RestaurantOperatorState(
          restaurantId: data.first.restaurant_id.toString(),
          operatorState: data.first.status.toOperartorStatus());
      return state;
    }
  }
  return null;
}
