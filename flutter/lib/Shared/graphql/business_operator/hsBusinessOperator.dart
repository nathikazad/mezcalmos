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
        serviceProviderDetailsId: data.business.details_id,
        
        online: data.operator_details.online,
        serviceProviderId: data.business_id,
        status: data.operator_details.status.toAuthorizationStatus(),
        userId: data.user_id);
  }
  return null;
}

Future<BusinessProfile?> get_operator_business_profile(
    {required int userId}) async {
  QueryResult<Query$getOperatorBusinessProfile> res = await _db.graphQLClient
      .query$getOperatorBusinessProfile(
          Options$Query$getOperatorBusinessProfile(
              fetchPolicy: FetchPolicy.noCache,
              variables:
                  Variables$Query$getOperatorBusinessProfile(userId: userId)));

  if (res.parsedData?.business_operator == null) {
    throw Exception("🟥 Get business operator exceptions =>${res.exception}");
  }
  mezDbgPrint2("🟩 Get business operator response =>${res.data}");
  if (res.parsedData!.business_operator.isNotEmpty) {
    Query$getOperatorBusinessProfile$business_operator data =
        res.parsedData!.business_operator.first;
    return data.business.profile.toBusinessProfile();
  }
  return null;
}
