import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/__generated/restaurantOperator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<Operator>?> get_restaurant_operators(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$getRestaurantOperators> response =
      await _db.graphQLClient.query$getRestaurantOperators(
    Options$Query$getRestaurantOperators(
      fetchPolicy: FetchPolicy.noCache,
      // fetchPolicy:
      //     withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getRestaurantOperators(restaurantId: restaurantId),
    ),
  );
  if (!response.hasException &&
      response.parsedData?.restaurant_restaurant_by_pk?.restaurant_operators !=
          null) {
    final List<
            Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators>
        data =
        response.parsedData!.restaurant_restaurant_by_pk!.restaurant_operators;
    mezDbgPrint(
        "✅✅ Hasura get operators querry ${response.parsedData?.toJson()} ");
    final List<Operator> ops = data.map(
        (Query$getRestaurantOperators$restaurant_restaurant_by_pk$restaurant_operators
            opData) {
      return Operator(
          state: OperatorState(
              owner: opData.operator_details.owner,
              operatorState: opData.operator_details.status.toAgentStatus(),
              serviceProviderId: restaurantId,
              serviceProviderDetailsId: opData.restaurant?.details_id),
          info: UserInfo(
              hasuraId: opData.user.id,
              firebaseId: opData.user.firebase_id,
              name: opData.user.name,
              image: opData.user.image),
          operatorId: opData.id);
    }).toList();
    return ops;
  } else {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get restaurant operators exceptions ${response.exception}");
  }

  return null;
}

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
            serviceProviderDetailsId: data.restaurant?.details_id,
            operatorState: data.operator_details.status.toAgentStatus(),
            owner: data.operator_details.owner,
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
      return event.parsedData!.restaurant_operator.first.operator_details.status
          .toAgentStatus();
    }
  });
}
