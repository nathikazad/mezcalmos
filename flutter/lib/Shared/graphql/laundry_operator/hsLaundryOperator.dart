import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry_operator/__generated/laundry_operator.graphql.dart';
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
                    serviceProviderDetailsId: data.store.details_id,

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
