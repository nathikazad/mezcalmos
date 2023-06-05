import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/__generated/business_order.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<void> update_bs_order_item(
    {required int id, required BusinessOrderItem item}) async {
  QueryResult<Mutation$updateBsOrderItem> res =
      await _db.graphQLClient.mutate$updateBsOrderItem(
    Options$Mutation$updateBsOrderItem(
      variables: Variables$Mutation$updateBsOrderItem(
        id: id,
        data: Input$business_order_request_item_set_input(
            time: item.time,
            parameters: item.parameters.toFirebaseFormattedJson(),
            cost: item.cost.toDouble(),
            available: item.available),
      ),
    ),
  );
  if (res.hasException) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
}
