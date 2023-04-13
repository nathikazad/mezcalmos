import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry_operator/__generated/laundry_operator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<Operator?> get_laundry_operator({required int userId}) async {
  final QueryResult<Query$getLaundryOperatorByUserId> res =
      await _db.graphQLClient.query$getLaundryOperatorByUserId(
          Options$Query$getLaundryOperatorByUserId(
              fetchPolicy: FetchPolicy.noCache,
              variables:
                  Variables$Query$getLaundryOperatorByUserId(userId: userId)));

  if (res.parsedData?.laundry_operator == null) {
    throw Exception("Get restaurant operator exceptions =>${res.exception}");
  }
  if (res.parsedData!.laundry_operator.isNotEmpty) {
    Query$getLaundryOperatorByUserId$laundry_operator data =
        res.parsedData!.laundry_operator.first;
    return Operator(
        state: OperatorState(
            deliveryDetailsId: data.store.delivery_details_id,
            serviceProviderDetailsId: data.store.details_id,
             serviceLinkId: data.store.details!.service_link_id,
            operatorState: data.operator_details.status.toAgentStatus(),
            owner: data.operator_details.owner,
            serviceProviderId: data.store_id),
        info: UserInfo(
            hasuraId: data.user_id,
            firebaseId: data.user.firebase_id,
            image: data.user.image,
            name: data.user.name),
        operatorId: data.id);
  }
  return null;
}

Stream<AgentStatus> listen_laundry_operator_status({required int operatorId}) {
  return _db.graphQLClient
      .subscribe$laundryOperatorStatusStream(
          Options$Subscription$laundryOperatorStatusStream(
              variables: Variables$Subscription$laundryOperatorStatusStream(
                  userId: operatorId)))
      .map((QueryResult<Subscription$laundryOperatorStatusStream> event) {
    if (event.parsedData?.laundry_operator == null ||
        event.parsedData!.laundry_operator.isEmpty) {
      throw Exception(
          "🚨🚨 Stream on operator status exceptions =>${event.exception}");
    } else {
      return event.parsedData!.laundry_operator.first.operator_details.status
          .toAgentStatus();
    }
  });
}

Future<List<Operator>?> get_laundry_operators(
    {required int laundryId, bool withCache = true}) async {
  final QueryResult<Query$getLaundryOperators> response =
      await _db.graphQLClient.query$getLaundryOperators(
    Options$Query$getLaundryOperators(
      fetchPolicy: FetchPolicy.noCache,
      // fetchPolicy:
      //     withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getLaundryOperators(laundryId: laundryId),
    ),
  );
  if (!response.hasException &&
      response.parsedData?.laundry_store_by_pk?.operators != null) {
    List<Query$getLaundryOperators$laundry_store_by_pk$operators> data =
        response.parsedData!.laundry_store_by_pk!.operators;
    mezDbgPrint(
        "✅✅ Hasura get operators querry ${response.parsedData?.toJson()} ");
    final List<Operator> ops = data
        .map((Query$getLaundryOperators$laundry_store_by_pk$operators opData) {
      return Operator(
          state: OperatorState(
              deliveryDetailsId: opData.store.delivery_details_id,
              owner: opData.operator_details.owner,
               serviceLinkId: opData.store.details!.service_link_id,
              operatorState: opData.operator_details.status.toAgentStatus(),
              serviceProviderId: opData.store_id,
              serviceProviderDetailsId: opData.store.details_id),
          info: UserInfo(
              hasuraId: opData.user_id,
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
