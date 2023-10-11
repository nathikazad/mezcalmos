import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/influencer/__generated/influencer.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<Influencer?> get_influencer({required int userId}) async {
  final QueryResult<Query$GetInfluencerByUserId> res = await _db.graphQLClient
      .query$GetInfluencerByUserId(Options$Query$GetInfluencerByUserId(
          fetchPolicy: FetchPolicy.cacheAndNetwork,
          variables: Variables$Query$GetInfluencerByUserId(userId: userId)));
  if (res.hasException) {
    throw Exception(res.exception);
  }
  if (res.parsedData!.service_provider_influencer.isNotEmpty) {
    final Query$GetInfluencerByUserId$service_provider_influencer data =
        res.parsedData!.service_provider_influencer.first;
    return Influencer(
        tag: data.tag,
        id: data.id,
        user_id: data.user_id,
        info: UserInfo(
            id: data.user!.id,
            firebaseId: "",
            language: Language.EN,
            name: data.user!.name,
            image: data.user!.image));
  }
  return null;
}

Future<List<Offer>> get_inf_open_offers({bool withCache = true}) async {
  final QueryResult<Query$GetInfOpenOffers> res = await _db.graphQLClient
      .query$GetInfOpenOffers(Options$Query$GetInfOpenOffers(
    fetchPolicy: withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
  ));
  mezDbgPrint("👋 called get service provider offers ===========>${res.data}");
  if (res.hasException) {
    throwError(res.exception);
  }
  final List<Offer> offers = <Offer>[];
  res.parsedData?.service_provider_offer
      .forEach((Query$GetInfOpenOffers$service_provider_offer data) {
    offers.add(Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        influencerDetails: (data.influencer_details != null)
            ? InfluencerOfferDetails(
                rewardType: data.influencer_details["rewardType"]
                    .toString()
                    .toDiscountType(),
                rewardValue: double.parse(
                    data.influencer_details["rewardValue"].toString()))
            : null,
        serviceProviderImage: data.restaurant?.details?.image,
        serviceProviderName: data.restaurant?.details?.name,
        serviceProviderId: data.service_provider_id,
        serviceProviderType: data.service_provider_type.toServiceProviderType(),
        offerType: data.offer_type.toOfferType(),
        details: OfferDetails(
          offerForOrder: data.details["offerForOrder"],
          discountType:
              data.details["discountType"].toString().toDiscountType(),
          discountValue: data.details["discountValue"],
          weeklyRepeat: data.details["weeklyRepeat"],
          categories: data.details["categories"] == null
              ? <num>[]
              : data.details["categories"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          nameIds: data.details["nameIds"] == null
              ? <num>[]
              : data.details["nameIds"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          // couponReusable: data.details["couponReusable"],
          offeringTypes: data.details["offeringTypes"] == null
              ? <OfferingType>[]
              : data.details["offeringTypes"]
                  .map<OfferingType>((e) => e.toString().toOfferingType())
                  .toList(),
          items: data.details["items"] == null
              ? <num>[]
              : data.details["items"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          minimumOrderAmount: data.details["minimumOrderAmount"],
          offerForItems: data.details["offerForItems"],
          validityRangeEnd: data.details["validityRangeEnd"],
          validityRangeStart: data.details["validityRangeStart"],
        ),
        status: data.status.toOfferStatus(),
        couponCode: data.coupon_code));
  });
  return offers;
}

Future<List<Offer>> get_inf_current_offers(
    {required int influencerId, bool withCache = true}) async {
  final QueryResult<Query$getInfOffers> res = await _db.graphQLClient
      .query$getInfOffers(Options$Query$getInfOffers(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getInfOffers(
            inf_id: influencerId,
          )));
  mezDbgPrint("👋 called get service provider offers ===========>${res.data}");
  if (res.hasException) {
    throwError(res.exception);
  }
  final List<Offer> offers = <Offer>[];
  res.parsedData?.service_provider_influencer_offer
      .forEach((Query$getInfOffers$service_provider_influencer_offer entry) {
    final Query$getInfOffers$service_provider_influencer_offer$offer data =
        entry.offer!;
    offers.add(Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        influencerDetails: (data.influencer_details != null)
            ? InfluencerOfferDetails(
                rewardType: data.influencer_details["rewardType"]
                    .toString()
                    .toDiscountType(),
                rewardValue: double.parse(
                    data.influencer_details["rewardValue"].toString()))
            : null,
        serviceProviderImage: data.restaurant?.details?.image,
        serviceProviderName: data.restaurant?.details?.name,
        serviceProviderId: data.service_provider_id,
        serviceProviderType: data.service_provider_type.toServiceProviderType(),
        offerType: data.offer_type.toOfferType(),
        details: OfferDetails(
          offerForOrder: data.details["offerForOrder"],
          discountType:
              data.details["discountType"].toString().toDiscountType(),
          discountValue: data.details["discountValue"],
          weeklyRepeat: data.details["weeklyRepeat"],
          categories: data.details["categories"] == null
              ? <num>[]
              : data.details["categories"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          nameIds: data.details["nameIds"] == null
              ? <num>[]
              : data.details["nameIds"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          // couponReusable: data.details["couponReusable"],
          offeringTypes: data.details["offeringTypes"] == null
              ? <OfferingType>[]
              : data.details["offeringTypes"]
                  .map<OfferingType>((e) => e.toString().toOfferingType())
                  .toList(),
          items: data.details["items"] == null
              ? <num>[]
              : data.details["items"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          minimumOrderAmount: data.details["minimumOrderAmount"],
          offerForItems: data.details["offerForItems"],
          validityRangeEnd: data.details["validityRangeEnd"],
          validityRangeStart: data.details["validityRangeStart"],
        ),
        status: data.status.toOfferStatus(),
        couponCode: data.coupon_code));
  });
  return offers;
}

Future<bool> assign_influencer_offer(
    {required int influencerId, required int offerId}) async {
  final QueryResult<Mutation$InsertInfluencerOffer> res = await _db
      .graphQLClient
      .mutate$InsertInfluencerOffer(Options$Mutation$InsertInfluencerOffer(
          variables: Variables$Mutation$InsertInfluencerOffer(
              influencer_id: influencerId, offer_id: offerId)));
  if (res.hasException) {
    throwError(res.exception);
  }
  return res.parsedData?.insert_service_provider_influencer_offer
          ?.affected_rows ==
      1;
}

Future<bool> unassign_influencer_offer(
    {required int influencerId, required int offerId}) async {
  final QueryResult<Mutation$DeleteInfluencerOffer> res = await _db
      .graphQLClient
      .mutate$DeleteInfluencerOffer(Options$Mutation$DeleteInfluencerOffer(
          variables: Variables$Mutation$DeleteInfluencerOffer(
              influencer_id: influencerId, offer_id: offerId)));
  if (res.hasException) {
    throwError(res.exception);
  }
  return res.parsedData?.delete_service_provider_influencer_offer
          ?.affected_rows ==
      1;
}

Future<num?> get_influencer_earnings_sum({required int influencerId}) async {
  final QueryResult<Query$getInfluencerTotalComissions> res =
      await _db.graphQLClient.query$getInfluencerTotalComissions(
          Options$Query$getInfluencerTotalComissions(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Query$getInfluencerTotalComissions(
                  influencer_id: influencerId)));

  if (res.hasException) {
    throwError(res.exception);
  }

  return res.parsedData?.service_provider_offer_applied_aggregate.aggregate?.sum
      ?.comission;
}
