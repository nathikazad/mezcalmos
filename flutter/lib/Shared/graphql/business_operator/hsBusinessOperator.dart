import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_operator/__generated/business_operator.graphql.dart';

final HasuraDb _db = Get.find<HasuraDb>();

Future<Operator?> get_business_operator({required int userId}) async {
  QueryResult<Query$getBusinessOperatorByUserId> res = await _db.graphQLClient
      .query$getBusinessOperatorByUserId(
          Options$Query$getBusinessOperatorByUserId(
              fetchPolicy: FetchPolicy.noCache,
              variables:
                  Variables$Query$getBusinessOperatorByUserId(userId: userId)));

  if (res.parsedData?.business_operator == null) {
    throw Exception("🟥 Get business operator exceptions =>${res.exception}");
  }
  if (res.parsedData!.business_operator.isNotEmpty) {
    Query$getBusinessOperatorByUserId$business_operator data =
        res.parsedData!.business_operator.first;
    return Operator(
        detailsId: data.details_id,
        id: data.id,
        online: data.operator_details.online,
        serviceProviderId: data.business_id,
        status: data.operator_details.status.toAuthorizationStatus(),
        userId: data.user_id);
  }
  return null;
}
