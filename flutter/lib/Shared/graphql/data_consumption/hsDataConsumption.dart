import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/data_consumption/__generated/data_consumption.graphql.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

// Mutations
Future<void> updateSubscriptionDataConsumption({
  required String nameOfSubscription,
  required int totalSize,
  required int numberOfEvents,
  required int userId,
  required AppType appType,
}) async {
  final QueryResult<Mutation$updateSubscriptionDataConsumption> res =
      await _hasuraDb.graphQLClient.mutate$updateSubscriptionDataConsumption(
          Options$Mutation$updateSubscriptionDataConsumption(
              variables: Variables$Mutation$updateSubscriptionDataConsumption(
                  name_of_subscription: nameOfSubscription,
                  total_size: totalSize,
                  number_of_events: numberOfEvents,
                  user_id: userId,
                  app_type_id: appType.toFirebaseFormatString())));

  if (res.parsedData?.update_data_consumption!.affected_rows == 0) {
    // final QueryResult<Mutation$insertSubscriptionDataConsumption> insertRes =
    await _hasuraDb.graphQLClient.mutate$insertSubscriptionDataConsumption(
        Options$Mutation$insertSubscriptionDataConsumption(
            variables: Variables$Mutation$insertSubscriptionDataConsumption(
                name_of_subscription: nameOfSubscription,
                total_size: totalSize,
                user_id: userId,
                app_type_id: appType.toFirebaseFormatString())));
  }
}
