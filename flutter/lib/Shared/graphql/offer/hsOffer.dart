import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/offer/__generated/offer.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<cModels.Offer>> get_service_provider_offers(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  QueryResult<Query$get_service_provider_offers> res =
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
  final List<cModels.Offer> offers = [];
  res.parsedData?.service_provider_offer.forEach((data) {
    offers.add(cModels.Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        serviceProviderId: serviceProviderId,
        serviceProviderType: serviceProviderType,
        offerType: data.offer_type.toOfferType(),
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
          couponReusable: data.details["couponReusable"],
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
  QueryResult<Query$check_coupon> res =
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
        couponReusable: data.details["couponReusable"],
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
  QueryResult<Query$check_offer_applied> res =
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
  if (res.parsedData?.service_provider_offer_applied.length == 0) {
    return false;
  }
  return true;
}

Future<List<cModels.Offer>> fetch_promotions(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  QueryResult<Query$fetchPromotions> res =
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
  final List<cModels.Offer> offers = [];
  res.parsedData?.service_provider_offer.forEach((data) {
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
          couponReusable: data.details["couponReusable"],
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
  QueryResult<Query$fetch_subscribed_promotions> res =
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
  List<List<Map<cModels.Language, String>>> alltranslations = [];
  if (res.parsedData?.service_provider_offer != null) {
    for (int i = 0; i < res.parsedData!.service_provider_offer.length; i++) {
      alltranslations.add(await fetch_translations(
          nameIds: res.parsedData?.service_provider_offer[i].details["nameIds"]
              .map<int>((e) => int.parse(e.toString()))
              .toList()));
    }
  }
  int index = 0;

  final List<cModels.Offer> offers = [];
  res.parsedData?.service_provider_offer.forEach((data) {
    cModels.ServiceProviderType serviceProviderType =
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
        couponReusable: data.details["couponReusable"],
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
  QueryResult<Query$fetch_all_promotions_within_distance> res =
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
  List<List<Map<cModels.Language, String>>> alltranslations = [];
  if (res.parsedData?.service_provider_offer != null) {
    for (int i = 0; i < res.parsedData!.service_provider_offer.length; i++) {
      alltranslations.add(await fetch_translations(
          nameIds: res.parsedData?.service_provider_offer[i].details["nameIds"]
              .map<int>((e) => int.parse(e.toString()))
              .toList()));
    }
  }
  int index = 0;

  final List<cModels.Offer> offers = [];
  res.parsedData?.service_provider_offer.forEach((data) {
    cModels.ServiceProviderType serviceProviderType =
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
        couponReusable: data.details["couponReusable"],
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
