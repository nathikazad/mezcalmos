import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurantOperator/__generated/restaurantOperator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<RestaurantOperatorState?> get_operator_state(
    {required int operatorId, bool withCache = true}) async {
  final QueryResult<Query$getOperatorRestaurantInfo> response =
      await _db.graphQLClient.query$getOperatorRestaurantInfo(
    Options$Query$getOperatorRestaurantInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables:
          Variables$Query$getOperatorRestaurantInfo(operatorId: operatorId),
    ),
  );
  if (response.hasException) {
    throw Exception("get opertor restaurant id error ${response.exception}");
  } else {
    final List<Query$getOperatorRestaurantInfo$restaurant_operator>? data =
        response.parsedData?.restaurant_operator;
    if (data?.isNotEmpty ?? false) {
      mezDbgPrint("👊👊👊 ${data?.first.status}");
      final RestaurantOperatorState state = RestaurantOperatorState(
          restaurantId: data!.first.restaurant_id,
          owner: data.first.owner,
          operatorState: data.first.status.toAgentStatus());
      return state;
    }
  }
  return null;
}
