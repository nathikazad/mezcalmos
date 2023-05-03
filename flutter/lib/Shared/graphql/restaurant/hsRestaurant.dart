import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<Restaurant>> fetch_restaurants({required bool withCache}) async {
  final List<Restaurant> _restaurants = <Restaurant>[];

  final QueryResult<Query$getRestaurants> response = await _db.graphQLClient
      .query$getRestaurants(Options$Query$getRestaurants(
          fetchPolicy: withCache
              ? FetchPolicy.cacheAndNetwork
              : FetchPolicy.networkOnly));

  if (response.parsedData?.restaurant_restaurant != null) {
    response.parsedData?.restaurant_restaurant
        .forEach((Query$getRestaurants$restaurant_restaurant data) async {
      mezDbgPrint(
          " desc=============>>>🥹=======>${data.details?.description?.toJson()}");
      _restaurants.add(Restaurant(
        languages: convertToLanguages(data.details!.language),
        serviceDetailsId: data.details!.id,
        userInfo: ServiceInfo(
            hasuraId: data.id,
            image: data.details!.image,
            description: toLanguageMap(
                translations: data.details?.description?.translations ?? []),
            firebaseId: data.details!.firebase_id,
            name: data.details!.name,
            descriptionId: data.details!.description_id,
            location: MezLocation.fromHasura(
                data.details!.location.gps, data.details!.location.address)),
        deliveryCost: (data.delivery_details_of_deliverer == null)
            ? null
            : DeliveryCost(
                id: data.delivery_details_of_deliverer!.first.id,
                selfDelivery:
                    data.delivery_details_of_deliverer!.first.self_delivery,
                freeDeliveryMinimumCost: data.delivery_details_of_deliverer!
                    .first.free_delivery_minimum_cost,
                costPerKm:
                    data.delivery_details_of_deliverer!.first.cost_per_km,
                minimumCost:
                    data.delivery_details_of_deliverer!.first.minimum_cost,
                freeDeliveryKmRange: data.delivery_details_of_deliverer!.first
                    .free_delivery_km_range,
              ),
        schedule: data.details!.schedule != null
            ? scheduleFromData(data.details!.schedule)
            : null,
        paymentInfo: PaymentInfo(),
        rate: data.reviews_aggregate.aggregate?.avg?.rating,
        restaurantState: ServiceState(
            data.details!.open_status.toServiceStatus(),
            data.details!.approved),
      ));
    });
    return _restaurants;
  } else {
    throw Exception(
        "🛑🛑🛑 Get restaurants exceptions 🛑🛑🛑 \n ${response.exception} ");
  }
}

Future<List<Item>> fetch_restaurant_items({required int restaurant_id}) async {
  mezDbgPrint("[66] fetch_restaurant_items called !");

  final List<Item> _items = [];
  final QueryResult<Query$getRestaurantItems> response =
      await _db.graphQLClient.query$getRestaurantItems(
    Options$Query$getRestaurantItems(
      variables: Variables$Query$getRestaurantItems(
        restaurant_id: restaurant_id,
      ),
    ),
  );

  if (response.hasException) {
    mezDbgPrint(
        "[66] fetch_restaurant_items :: exception ::  ${response.exception}");
  }

  response.parsedData?.restaurant_item
      .forEach((Query$getRestaurantItems$restaurant_item element) {
    mezDbgPrint("[66] Adding item ${element.id}");
    _items.add(
      Item(
        name: {
          element.name.translations.first.language_id.toLanguage():
              element.name.translations.first.value,
          element.name.translations[1].language_id.toLanguage():
              element.name.translations[1].value,
        },
        available: element.available,
        categoryId: element.category_id,
        description: toLanguageMap(
            translations: element.description?.translations ?? []),
        cost: element.cost,
        itemType: element.item_type.toItemType(),
      ),
    );
  });

  return _items;
}

Future<Restaurant?> get_restaurant_by_id(
    {required int id, bool withCache = true}) async {
  final QueryResult<Query$getOneRestaurant> response =
      await _db.graphQLClient.query$getOneRestaurant(
    Options$Query$getOneRestaurant(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getOneRestaurant(id: id),
    ),
  );

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura querry success, data : ${response.parsedData?.restaurant_restaurant_by_pk?.details?.description?.toJson()} ");
    final Query$getOneRestaurant$restaurant_restaurant_by_pk? data =
        response.parsedData?.restaurant_restaurant_by_pk!;

    if (data != null) {
      return Restaurant(
        languages: convertToLanguages(data.details!.language),
        serviceDetailsId: data.details!.id,
        deliveryDetailsId: data.delivery_details_id,
        deliveryCost: (data.delivery_details_of_deliverer == null)
            ? null
            : DeliveryCost(
                id: data.delivery_details_of_deliverer!.first.id,
                selfDelivery:
                    data.delivery_details_of_deliverer!.first.self_delivery,
                freeDeliveryMinimumCost: data.delivery_details_of_deliverer!
                    .first.free_delivery_minimum_cost,
                costPerKm:
                    data.delivery_details_of_deliverer!.first.cost_per_km,
                minimumCost:
                    data.delivery_details_of_deliverer!.first.minimum_cost,
                freeDeliveryKmRange: data.delivery_details_of_deliverer!.first
                    .free_delivery_km_range,
              ),
        userInfo: ServiceInfo(
            locationId: data.details!.location_id,
            hasuraId: data.id,
            image: data.details!.image,
            description: toLanguageMap(
                translations: data.details?.description?.translations ?? []),
            firebaseId: data.details!.firebase_id,
            name: data.details!.name,
            descriptionId: data.details!.description_id,
            location: MezLocation.fromHasura(
                data.details!.location.gps, data.details!.location.address)),
        currency: data.details!.currency.toCurrency(),
        schedule: data.details!.schedule != null
            ? scheduleFromData(data.details!.schedule)
            : null,
        paymentInfo: null,
        selfDelivery: data.delivery_details_of_deliverer!.first.self_delivery,
        restaurantState: ServiceState(
            data.details!.open_status.toServiceStatus(),
            data.details!.approved),
      );
    }
  } else
    return null;
  return null;
}

Future<cModels.Language?> get_restaurant_priamry_lang(int restaurantId) async {
  final QueryResult<Query$getRestaurantLang> response = await _db.graphQLClient
      .query$getRestaurantLang(Options$Query$getRestaurantLang(
          variables: Variables$Query$getRestaurantLang(id: restaurantId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 restuarnt primay lang query errors : ${response.exception}");
  } else if (response.parsedData?.restaurant_restaurant_by_pk != null) {
    mezDbgPrint("✅✅✅ restuarnt primay lang query success");
    return cModels.Language.EN;
  }
  return null;
}

Future<cModels.Schedule?> get_restaurant_schedule(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$getRestaurantSchedule> response = await _db
      .graphQLClient
      .query$getRestaurantSchedule(Options$Query$getRestaurantSchedule(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getRestaurantSchedule(id: restaurantId)));
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 restuarnt schedule  query errors : ${response.exception}");
  } else if (response
          .parsedData?.restaurant_restaurant_by_pk?.details?.schedule !=
      null) {
    mezDbgPrint("✅✅✅ restuarnt schedule lang query success");
    return scheduleFromData(
        response.parsedData!.restaurant_restaurant_by_pk!.details?.schedule);
  }
  return null;
}

Future<ServiceStatus?> get_restaurant_status(
    {required int restaurantId}) async {
  final QueryResult<Query$getRestaurantStatus> response =
      await _db.graphQLClient.query$getRestaurantStatus(
    Options$Query$getRestaurantStatus(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$getRestaurantStatus(id: restaurantId),
    ),
  );
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $restaurantId status exception \n ${response.exception}");
  } else {
    return response
        .parsedData!.restaurant_restaurant_by_pk!.details!.open_status
        .toServiceStatus();
  }
}

Future<bool?> get_restaurant_approved({required int restaurantId}) async {
  final QueryResult<Query$getRestaurantAprroved> response =
      await _db.graphQLClient.query$getRestaurantAprroved(
    Options$Query$getRestaurantAprroved(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$getRestaurantAprroved(id: restaurantId),
    ),
  );
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $restaurantId status exception \n ${response.exception}");
  } else {
    return response.parsedData!.restaurant_restaurant_by_pk!.details!.approved;
  }
}

Future<PaymentInfo?> get_restaurant_payment_info(
    {required int serviceProviderId, bool withCache = true}) async {
  final QueryResult<Query$getRestaurantPaymentInfo> res = await _db
      .graphQLClient
      .query$getRestaurantPaymentInfo(Options$Query$getRestaurantPaymentInfo(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables:
              Variables$Query$getRestaurantPaymentInfo(id: serviceProviderId)));
  if (res.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception(
        "🛑 Exception 🛑 Getting payment info for $serviceProviderId ===>${res.exception}");
  }
  mezDbgPrint(
      "✅  payment data ====================> ${res.parsedData?.toJson()}");
  final Query$getRestaurantPaymentInfo$restaurant_restaurant_by_pk data =
      res.parsedData!.restaurant_restaurant_by_pk!;
  final PaymentInfo paymentInfo = PaymentInfo.fromData(
      acceptedPayments: data.details?.accepted_payments,
      stripeInfo: data.details?.stripe_info);
  return paymentInfo;
}

Future<int> get_restaurant_details_id({required int restaurantId}) async {
  QueryResult<Query$getRestaurantDetailsId> res = await _db.graphQLClient
      .query$getRestaurantDetailsId(Options$Query$getRestaurantDetailsId(
          variables: Variables$Query$getRestaurantDetailsId(
              restauarntId: restaurantId)));
  if (res.parsedData?.restaurant_restaurant_by_pk == null) {
    throwError(res.exception);
  }
  return res.parsedData!.restaurant_restaurant_by_pk!.details_id;
}
