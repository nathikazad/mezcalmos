import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/influencer/__generated/influencer.graphql.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart' as user;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

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
    {required int influencerId,
    bool withCache = true,
    required int limit,
    required int offset}) async {
  final QueryResult<Query$getInfOffers> res = await _db.graphQLClient
      .query$getInfOffers(Options$Query$getInfOffers(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getInfOffers(
              inf_id: influencerId, limit: limit, offset: offset)));
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

Future<num?> get_influencer_discount_sum({required int influencerId}) async {
  final QueryResult<Query$getInfluencerTotalDiscounts> res =
      await _db.graphQLClient.query$getInfluencerTotalDiscounts(
          Options$Query$getInfluencerTotalDiscounts(
              fetchPolicy: FetchPolicy.networkOnly,
              variables: Variables$Query$getInfluencerTotalDiscounts(
                  influencer_id: influencerId)));

  if (res.hasException) {
    throwError(res.exception);
  }

  return res.parsedData?.service_provider_offer_applied_aggregate.aggregate?.sum
      ?.discount;
}

Future<List<InfEarning>?> get_inf_earnings({required int influencerId}) async {
  final QueryResult<Query$getInfluencerEarnings> res = await _db.graphQLClient
      .query$getInfluencerEarnings(Options$Query$getInfluencerEarnings(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$getInfluencerEarnings(
              influencer_id: influencerId)));

  if (res.hasException) {
    throwError(res.exception);
  } else if (res.parsedData?.service_provider_offer_applied != null) {
    return res.parsedData!.service_provider_offer_applied
        .map<InfEarning>(
            (Query$getInfluencerEarnings$service_provider_offer_applied e) =>
                InfEarning(
                  influencerOfferDetails: InfluencerOfferDetails(
                      rewardType: e.offer.influencer_details["rewardType"]
                          .toString()
                          .toDiscountType(),
                      rewardValue: double.parse(e
                          .offer.influencer_details["rewardValue"]
                          .toString())),
                  customerInfo: UserInfo(
                      id: e.restaurant_order!.customer.user.id,
                      name: e.restaurant_order!.customer.user.name,
                      phoneNumber: e.restaurant_order!.customer.user.phone,
                      image: e.restaurant_order!.customer.user.image,
                      firebaseId: "",
                      language: Language.EN),
                  influencerInfo: user.UserInfo(
                      hasuraId: e.influencer!.user!.id,
                      name: e.influencer!.user!.name,
                      phoneNumber: e.influencer!.user!.phone,
                      image: e.influencer!.user!.image,
                      firebaseId: "",
                      language: Language.EN),
                  serviceInfo: e.restaurant_order != null
                      ? user.ServiceInfo(
                          hasuraId: e.restaurant_order!.restaurant.id,
                          name: e.restaurant_order!.restaurant.details!.name,
                          phoneNumber: e.restaurant_order!.restaurant.details!
                              .phone_number,
                          image: e.restaurant_order!.restaurant.details!.image,
                          firebaseId: "",
                          location: MezLocation.fromHasura(
                              e.restaurant_order!.restaurant.details!.location
                                  .gps,
                              e.restaurant_order!.restaurant.details!.location
                                  .address))
                      : user.ServiceInfo(
                          hasuraId: e.restaurant!.id,
                          name: e.restaurant!.details!.name,
                          phoneNumber: e.restaurant!.details!.phone_number,
                          image: e.restaurant!.details!.image,
                          firebaseId: "",
                          location: MezLocation.fromHasura(
                              e.restaurant!.details!.location.gps,
                              e.restaurant!.details!.location.address)),
                  orderTotal: e.order_total!,
                  comission: e.comission!,
                  discount: e.discount,
                ))
        .toList();
  }
  return null;
}

Future<String?> update_influencer_tag(
    {required int infId, required String tag}) async {
  final QueryResult<Mutation$updateInfluencerTag> res = await _db.graphQLClient
      .mutate$updateInfluencerTag(Options$Mutation$updateInfluencerTag(
          variables:
              Variables$Mutation$updateInfluencerTag(tag: tag, id: infId)));
  if (res.hasException) {
    throw res.exception!;
  }
  if (res.parsedData?.update_service_provider_influencer_by_pk?.tag != null) {
    return res.parsedData?.update_service_provider_influencer_by_pk?.tag;
  }

  return null;
}
