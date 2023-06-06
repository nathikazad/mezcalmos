import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_operator/__generated/business_operator.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart' as dartModel;
import 'package:mezcalmos/Shared/models/User.dart' as userModel;
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';

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
    final Query$getBusinessOperatorByUserId$business_operator data =
        res.parsedData!.business_operator.first;
    mezDbgPrint(
        "🟩 Get business operator $userId business id =>${data.business_id}");
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

  if (res.parsedData!.business_operator.isNotEmpty) {
    final Query$getOperatorBusinessProfile$business_operator data =
        res.parsedData!.business_operator.first;
    return data.business.profile.toBusinessProfile();
  }
  return null;
}

Future<List<dartModel.Operator>> get_business_ops(
    {required int businessId}) async {
  QueryResult<Query$getBusinessOperators> res = await _db.graphQLClient
      .query$getBusinessOperators(Options$Query$getBusinessOperators(
          fetchPolicy: FetchPolicy.noCache,
          variables:
              Variables$Query$getBusinessOperators(businessId: businessId)));
  mezDbgPrint("🟩 Get business operator $businessId response =>${res.data}");
  if (res.parsedData?.business_business_by_pk == null) {
    throw Exception("🟥 Get business operator exceptions =>${res.exception}");
  }
  if (res.parsedData!.business_business_by_pk!.operators.isNotEmpty) {
    List<Query$getBusinessOperators$business_business_by_pk$operators> data =
        res.parsedData!.business_business_by_pk!.operators;
    return data
        .map((Query$getBusinessOperators$business_business_by_pk$operators e) =>
            dartModel.Operator(
                state: dartModel.OperatorState(
                    deliveryDetailsId: null,
                    serviceProviderDetailsId: e.business.details_id,
                    serviceLinkId: e.business.details.service_link_id,
                    operatorState: e.operator_details.status.toAgentStatus(),
                    owner: e.operator_details.owner,
                    serviceProviderId: e.business_id),
                info: userModel.UserInfo(
                    name: e.user.name,
                    image: e.user.image,
                    hasuraId: e.user_id,
                    firebaseId: null,
                    language: null),
                operatorId: e.id))
        .toList();
  }
  return [];
}
