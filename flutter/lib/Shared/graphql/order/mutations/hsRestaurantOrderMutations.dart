import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/__generated/restaurant_order.graphql.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();
Future<void> set_food_est_ready_time(
    {required int orderId, required DateTime time}) async {
  final QueryResult<Mutation$setRestaurantOrderEstFoodReadyTime> response =
      await _hasuraDb.graphQLClient.mutate$setRestaurantOrderEstFoodReadyTime(
    Options$Mutation$setRestaurantOrderEstFoodReadyTime(
      variables: Variables$Mutation$setRestaurantOrderEstFoodReadyTime(
          orderId: orderId, time: time.toUtc().toString()),
    ),
  );
  if (response.parsedData?.update_restaurant_order_by_pk == null) {
    throw Exception(
        "🚨set fod est ready time exceptions => ${response.exception}");
  }
}

Future<int?> insertRestaurantOrderReview(
    {required int orderId, required int reviewId}) async {
  final QueryResult<Mutation$assignRestaurantOrderReview> response =
      await _hasuraDb.graphQLClient.mutate$assignRestaurantOrderReview(
    Options$Mutation$assignRestaurantOrderReview(
      variables: Variables$Mutation$assignRestaurantOrderReview(
          orderId: orderId, reviewId: reviewId),
    ),
  );
  if (response.parsedData?.update_restaurant_order_by_pk == null) {
    throw Exception(
        "🚨set restuarnt review exceptions => ${response.exception}");
  }
  return response.parsedData!.update_restaurant_order_by_pk?.review_id;
}
