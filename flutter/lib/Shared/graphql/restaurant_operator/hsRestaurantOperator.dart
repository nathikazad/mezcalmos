import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/__generated/restaurantOperator.graphql.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<Operator?> get_restaurant_operator({required int userId}) async {
  final QueryResult<Query$getOperatorByUserId> res = await _db.graphQLClient
      .query$getOperatorByUserId(Options$Query$getOperatorByUserId(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getOperatorByUserId(userId: userId)));

  if (res.parsedData?.restaurant_operator == null) {
    throw Exception("Get restaurant operator exceptions =>${res.exception}");
  }
  if (res.parsedData!.restaurant_operator.isNotEmpty) {
    final Query$getOperatorByUserId$restaurant_operator data =
        res.parsedData!.restaurant_operator.first;
    return Operator(
        state: OperatorState(
            operatorState: data.status.toAgentStatus(),
            owner: data.owner,
            serviceProviderId: data.restaurant_id),
        info: UserInfo(
            hasuraId: data.user_id,
            firebaseId: data.user.firebase_id,
            image: data.user.image,
            name: data.user.name),
        operatorId: data.id);
  }
  return null;
}

Stream<AgentStatus> listen_operator_status({required int operatorId}) {
  return _db.graphQLClient
      .subscribe$restaurantOperatorStatusStream(
          Options$Subscription$restaurantOperatorStatusStream(
              variables: Variables$Subscription$restaurantOperatorStatusStream(
                  userId: operatorId)))
      .map((QueryResult<Subscription$restaurantOperatorStatusStream> event) {
    if (event.parsedData?.restaurant_operator == null ||
        event.parsedData!.restaurant_operator.isEmpty) {
      throw Exception(
          "🚨🚨 Stream on operator status exceptions =>${event.exception}");
    } else {
      return event.parsedData!.restaurant_operator.first.status.toAgentStatus();
    }
  });
}
