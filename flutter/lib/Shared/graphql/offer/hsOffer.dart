import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/offer/__generated/offer.graphql.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelper/InfEarningHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<cModels.Offer>> get_service_provider_offers(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  final QueryResult<Query$get_service_provider_offers> res =
      await _db.graphQLClient.query$get_service_provider_offers(
    Options$Query$get_service_provider_offers(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$get_service_provider_offers(
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called get service provider offers ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<cModels.Offer> offers = <cModels.Offer>[];
  res.parsedData?.service_provider_offer
      .forEach((Query$get_service_provider_offers$service_provider_offer data) {
    offers.add(cModels.Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        serviceProviderId: serviceProviderId,
        serviceProviderType: serviceProviderType,
        offerType: data.offer_type.toOfferType(),
        influencerDetails: (data.influencer_details != null)
            ? cModels.InfluencerOfferDetails(
                rewardType: data.influencer_details["rewardType"]
                    .toString()
                    .toDiscountType(),
                rewardValue: double.parse(
                    data.influencer_details["rewardValue"].toString()))
            : null,
        details: cModels.OfferDetails(
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
              ? <cModels.OfferingType>[]
              : data.details["offeringTypes"]
                  .map<cModels.OfferingType>(
                      (e) => e.toString().toOfferingType())
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

Future<cModels.Offer?> check_coupon(
    {required String couponCode,
    required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  final QueryResult<Query$check_coupon> res =
      await _db.graphQLClient.query$check_coupon(
    Options$Query$check_coupon(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$check_coupon(
          coupon_code: couponCode,
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called check coupon ===========>${res.data}");
  if (res.parsedData?.service_provider_offer.length == 0) {
    return null;
  }
  final Query$check_coupon$service_provider_offer data =
      res.parsedData!.service_provider_offer[0];
  return cModels.Offer(
      id: data.id,
      // name: toLanguageMap(translations: data.name.translations),
      serviceProviderId: serviceProviderId,
      serviceProviderType: serviceProviderType,
      offerType: cModels.OfferType.Coupon,
      details: cModels.OfferDetails(
        offerForOrder: data.details["offerForOrder"],
        discountType: data.details["discountType"].toString().toDiscountType(),
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
            ? <cModels.OfferingType>[]
            : data.details["offeringTypes"]
                .map<cModels.OfferingType>((e) => e.toString().toOfferingType())
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
      status: cModels.OfferStatus.Active,
      couponCode: couponCode);
}

Future<bool> check_offer_applied(
    {required int customerId,
    required int offerId,
    required cModels.OrderType orderType,
    bool withCache = true}) async {
  final QueryResult<Query$check_offer_applied> res =
      await _db.graphQLClient.query$check_offer_applied(
    Options$Query$check_offer_applied(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$check_offer_applied(
          customer_id: customerId,
          offer_id: offerId,
          order_type: orderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called check offer applied ===========>${res.data}");
  if (res.parsedData == null ||
      res.parsedData!.service_provider_offer_applied.length == 0) {
    return false;
  }
  return true;
}

Future<List<cModels.Offer>> fetch_promotions(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  final QueryResult<Query$fetchPromotions> res =
      await _db.graphQLClient.query$fetchPromotions(
    Options$Query$fetchPromotions(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$fetchPromotions(
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called fetch promotions ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<cModels.Offer> offers = <cModels.Offer>[];
  res.parsedData?.service_provider_offer
      .forEach((Query$fetchPromotions$service_provider_offer data) {
    offers.add(cModels.Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        serviceProviderId: serviceProviderId,
        serviceProviderType: serviceProviderType,
        offerType: cModels.OfferType.Promotion,
        details: cModels.OfferDetails(
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
              ? <cModels.OfferingType>[]
              : data.details["offeringTypes"]
                  .map<cModels.OfferingType>(
                      (e) => e.toString().toOfferingType())
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
        status: cModels.OfferStatus.Active,
        nameId: data.name_id));
  });
  return offers;
}

Future<List<cModels.Offer>> fetch_subscribed_promotions(
    {required int customerId,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  final QueryResult<Query$fetch_subscribed_promotions> res =
      await _db.graphQLClient.query$fetch_subscribed_promotions(
    Options$Query$fetch_subscribed_promotions(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_subscribed_promotions(
          customer_id: customerId, limit: limit, offset: offset),
    ),
  );
  mezDbgPrint("👋 called fetch_subscribed_promotions ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<List<Map<cModels.Language, String>>> alltranslations =
      <List<Map<cModels.Language, String>>>[];
  if (res.parsedData?.service_provider_offer != null) {
    for (int i = 0; i < res.parsedData!.service_provider_offer.length; i++) {
      alltranslations.add(await fetch_translations(
          nameIds: res.parsedData?.service_provider_offer[i].details["nameIds"]
              ?.map<int>((e) => int.parse(e.toString()))
              .toList()));
    }
  }
  int index = 0;

  final List<cModels.Offer> offers = <cModels.Offer>[];
  res.parsedData?.service_provider_offer
      .forEach((Query$fetch_subscribed_promotions$service_provider_offer data) {
    final cModels.ServiceProviderType serviceProviderType =
        data.service_provider_type.toServiceProviderType();
    String? serviceProviderName;
    String? serviceProviderImage;
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        serviceProviderName = data.restaurant?.details?.name;
        serviceProviderImage = data.restaurant?.details?.image;
        break;
      case cModels.ServiceProviderType.Laundry:
        serviceProviderName = data.laundry?.details?.name;
        serviceProviderImage = data.laundry?.details?.image;
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        serviceProviderName = data.delivery_company?.details?.name;
        serviceProviderImage = data.delivery_company?.details?.image;
        break;
      case cModels.ServiceProviderType.Business:
        serviceProviderName = data.business?.details.name;
        serviceProviderImage = data.business?.details.image;
        break;
    }

    offers.add(cModels.Offer(
      id: data.id,
      name: toLanguageMap(translations: data.name.translations),
      serviceProviderId: data.service_provider_id,
      serviceProviderType: data.service_provider_type.toServiceProviderType(),
      offerType: cModels.OfferType.Promotion,
      nameTranslations: alltranslations[index],
      details: cModels.OfferDetails(
        offerForOrder: data.details["offerForOrder"],
        discountType: data.details["discountType"].toString().toDiscountType(),
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
            ? <cModels.OfferingType>[]
            : data.details["offeringTypes"]
                .map<cModels.OfferingType>((e) => e.toString().toOfferingType())
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
      status: cModels.OfferStatus.Active,
      nameId: data.name.id,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
    ));
    index++;
  });
  return offers;
}

Future<List<cModels.Offer>> fetch_all_promotions_within_distance(
    {required cModels.Location fromLocation,
    double distance = 10000,
    int? limit,
    int? offset,
    bool withCache = true}) async {
  final QueryResult<Query$fetch_all_promotions_within_distance> res =
      await _db.graphQLClient.query$fetch_all_promotions_within_distance(
    Options$Query$fetch_all_promotions_within_distance(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$fetch_all_promotions_within_distance(
          from: Geography(
              fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
          distance: distance,
          limit: limit,
          offset: offset),
    ),
  );
  mezDbgPrint(
      "👋 called fetch_all_promotions_within_distance ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<List<Map<cModels.Language, String>>> alltranslations =
      <List<Map<cModels.Language, String>>>[];
  if (res.parsedData?.service_provider_offer != null) {
    for (int i = 0; i < res.parsedData!.service_provider_offer.length; i++) {
      if (res.parsedData?.service_provider_offer[i].details["nameIds"] !=
          null) {
        alltranslations.add(await fetch_translations(
            nameIds: res
                .parsedData?.service_provider_offer[i].details["nameIds"]
                ?.map<int>((e) => int.parse(e.toString()))
                .toList()));
      }
    }
  }
  int index = 0;

  final List<cModels.Offer> offers = <cModels.Offer>[];
  res.parsedData?.service_provider_offer.forEach(
      (Query$fetch_all_promotions_within_distance$service_provider_offer data) {
    final cModels.ServiceProviderType serviceProviderType =
        data.service_provider_type.toServiceProviderType();
    String? serviceProviderName;
    String? serviceProviderImage;
    switch (serviceProviderType) {
      case cModels.ServiceProviderType.Restaurant:
        serviceProviderName = data.restaurant?.details?.name;
        serviceProviderImage = data.restaurant?.details?.image;
        break;
      case cModels.ServiceProviderType.Laundry:
        serviceProviderName = data.laundry?.details?.name;
        serviceProviderImage = data.laundry?.details?.image;
        break;
      case cModels.ServiceProviderType.DeliveryCompany:
        serviceProviderName = data.delivery_company?.details?.name;
        serviceProviderImage = data.delivery_company?.details?.image;
        break;
      case cModels.ServiceProviderType.Business:
        serviceProviderName = data.business?.details.name;
        serviceProviderImage = data.business?.details.image;
        break;
    }

    offers.add(cModels.Offer(
      id: data.id,
      name: toLanguageMap(translations: data.name.translations),
      serviceProviderId: data.service_provider_id,
      serviceProviderType: data.service_provider_type.toServiceProviderType(),
      offerType: cModels.OfferType.Promotion,
      nameTranslations: alltranslations[index],
      details: cModels.OfferDetails(
        offerForOrder: data.details["offerForOrder"],
        discountType: data.details["discountType"].toString().toDiscountType(),
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
            ? <cModels.OfferingType>[]
            : data.details["offeringTypes"]
                .map<cModels.OfferingType>((e) => e.toString().toOfferingType())
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
      status: cModels.OfferStatus.Active,
      nameId: data.name.id,
      serviceProviderName: serviceProviderName,
      serviceProviderImage: serviceProviderImage,
    ));
    index++;
  });
  return offers;
}

Future<bool> insert_offer_applied({
  required num orderTotal,
  required num infComission,
  required int influencerId,
  required int offerId,
}) async {
  final QueryResult<Mutation$insertOfferApplied> res = await _db.graphQLClient
      .mutate$insertOfferApplied(Options$Mutation$insertOfferApplied(
          variables: Variables$Mutation$insertOfferApplied(
              object: Input$service_provider_offer_applied_insert_input(
    order_total: orderTotal.toDouble(),
    influencer_id: influencerId,
    offer_id: offerId,
    comission: infComission.toDouble(),
  ))));

  if (res.hasException) {
    throwError(res.exception);
  }

  return res.parsedData?.insert_service_provider_offer_applied_one?.id != null;
}

Future<int?> get_inf_id_by_tag({required String tag}) async {
  final QueryResult<Query$getInfluencerIdByTag> res = await _db.graphQLClient
      .query$getInfluencerIdByTag(Options$Query$getInfluencerIdByTag(
          variables: Variables$Query$getInfluencerIdByTag(tag: tag)));
  if (res.hasException) {
    throwError(res.exception);
  }
  final List<Query$getInfluencerIdByTag$service_provider_influencer>? data =
      res.parsedData?.service_provider_influencer;
  if (data?.isNotEmpty == true)
    return res.parsedData?.service_provider_influencer.first.id;
  return null;
}

Future<num?> get_offer_total_revenue({required int offerId}) async {
  final QueryResult<Query$getOfferTotalRevenue> res = await _db.graphQLClient
      .query$getOfferTotalRevenue(Options$Query$getOfferTotalRevenue(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$getOfferTotalRevenue(offer_id: offerId)));

  if (res.hasException) {
    throw (res.exception!);
  }
  mezDbgPrint("Total revenue ========>${res.data}");
  return res.parsedData?.service_provider_offer_applied_aggregate.aggregate?.sum
      ?.order_total;
}

Future<num?> get_offer_total_loss({required int offerId}) async {
  final QueryResult<Query$getOfferTotalLoss> res = await _db.graphQLClient
      .query$getOfferTotalLoss(Options$Query$getOfferTotalLoss(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$getOfferTotalLoss(offer_id: offerId)));

  if (res.hasException) {
    throw res.exception!;
  }
  mezDbgPrint("Total Loss ========>${res.data}");

  return res.parsedData?.service_provider_offer_applied_aggregate.aggregate?.sum
      ?.loss;
}

Future<List<InfEarning>?> get_offer_applied_by_offer(
    {required int offerId}) async {
  final QueryResult<Query$getOfferAppliedByOffer> res = await _db.graphQLClient
      .query$getOfferAppliedByOffer(Options$Query$getOfferAppliedByOffer(
          fetchPolicy: FetchPolicy.networkOnly,
          variables:
              Variables$Query$getOfferAppliedByOffer(offer_id: offerId)));

  if (res.hasException) {
    throwError(res.exception);
  } else if (res.parsedData?.service_provider_offer_applied != null) {
    return res.parsedData!.service_provider_offer_applied
        .map<InfEarning>(
            (Query$getOfferAppliedByOffer$service_provider_offer_applied e) =>
                InfEarning(
                  influencerOfferDetails: cModels.InfluencerOfferDetails(
                      rewardType: e.offer.influencer_details["rewardType"]
                          .toString()
                          .toDiscountType(),
                      rewardValue: double.parse(e
                          .offer.influencer_details["rewardValue"]
                          .toString())),
                  customerInfo: cModels.UserInfo(
                      id: e.restaurant_order!.customer.user.id,
                      name: e.restaurant_order!.customer.user.name,
                      phoneNumber: e.restaurant_order!.customer.user.phone,
                      image: e.restaurant_order!.customer.user.image,
                      firebaseId: "",
                      language: cModels.Language.EN),
                  influencerInfo: cModels.UserInfo(
                      id: e.influencer!.user!.id,
                      name: e.influencer!.user!.name,
                      phoneNumber: e.influencer!.user!.phone,
                      image: e.influencer!.user!.image,
                      firebaseId: "",
                      language: cModels.Language.EN),
                  serviceInfo: ServiceInfo(
                      hasuraId: e.restaurant_order!.restaurant.id,
                      name: e.restaurant_order!.restaurant.details!.name,
                      phoneNumber:
                          e.restaurant_order!.restaurant.details!.phone_number,
                      image: e.restaurant_order!.restaurant.details!.image,
                      firebaseId: "",
                      location: MezLocation.fromHasura(
                          e.restaurant_order!.restaurant.details!.location.gps,
                          e.restaurant_order!.restaurant.details!.location
                              .address)),
                  orderTotal: e.order_total!,
                  comission: e.comission!,
                  discount: e.discount,
                ))
        .toList();
  }
  return null;
}
