import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _db = Get.find<HasuraDb>();

// Get single restuarant //
// ignore: non_constant_identifier_names

Future<List<Restaurant>> fetch_restaurants({required bool withCache}) async {
  final List<Restaurant> _restaurants = <Restaurant>[];

  final QueryResult<Query$getRestaurants> response = await _db.graphQLClient
      .query$getRestaurants(Options$Query$getRestaurants(
          fetchPolicy: withCache
              ? FetchPolicy.cacheAndNetwork
              : FetchPolicy.networkOnly));

  if (response.parsedData != null) {
    response.parsedData?.restaurant
        .forEach((Query$getRestaurants$restaurant data) async {
      _restaurants.add(Restaurant(
          userInfo: ServiceInfo(
              hasuraId: data.id,
              image: data.image,
              description: (data.description?.translations != null)
                  ? {
                      data.description!.translations.first.language_id
                              .toLanguageType():
                          data.description!.translations.first.value,
                      data.description!.translations[1].language_id
                              .toLanguageType():
                          data.description!.translations[1].value,
                    }
                  : null,
              firebaseId: data.firebase_id,
              name: data.name,
              descriptionId: data.description_id,
              location:
                  Location.fromHasura(data.location_gps, data.location_text)),
          schedule:
              data.schedule != null ? Schedule.fromData(data.schedule) : null,
          paymentInfo: PaymentInfo(),
          restaurantState:
              ServiceState(data.open_status.toServiceStatus(), data.approved),
          primaryLanguage: data.language_id.toString().toLanguageType(),
          secondaryLanguage:
              data.language_id.toString().toLanguageType().toOpLang()));
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
          element.name.translations.first.language_id.toLanguageType():
              element.name.translations.first.value,
          element.name.translations[1].language_id.toLanguageType():
              element.name.translations[1].value,
        },
        available: element.available,
        categoryId: element.category_id,
        description: element.description != null
            ? {
                element.description!.translations.first.language_id
                        .toLanguageType():
                    element.description!.translations.first.value,
                element.description!.translations[1].language_id
                        .toLanguageType():
                    element.description!.translations[1].value,
              }
            : null,
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
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
    return null;
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura querry success, data : ${response.parsedData?.restaurant_by_pk?.toJson()} ");
    final Query$getOneRestaurant$restaurant_by_pk? data =
        response.parsedData?.restaurant_by_pk!;
    final PaymentInfo paymentInfo = PaymentInfo();
    if (data?.accepted_payments != null) {
      paymentInfo.acceptedPayments =
          parseAcceptedPayments(data!.accepted_payments);
    }
    if (data?.stripe_info != null) {
      paymentInfo.stripe = parseServiceStripeInfo(data!.stripe_info);
    }
    if (data != null) {
      mezDbgPrint(
          "response data ====> ${response.data} 🍔🍔🍔 Restaurant data ${data.schedule}");
      return Restaurant(
          userInfo: ServiceInfo(
              hasuraId: data.id,
              image: data.image,
              description: (data.description?.translations != null)
                  ? {
                      data.description!.translations.first.language_id
                              .toLanguageType():
                          data.description!.translations.first.value,
                      data.description!.translations[1].language_id
                              .toLanguageType():
                          data.description!.translations[1].value,
                    }
                  : null,
              firebaseId: data.firebase_id ?? "",
              name: data.name,
              descriptionId: data.description_id,
              location:
                  Location.fromHasura(data.location_gps, data.location_text)),
          schedule:
              data.schedule != null ? Schedule.fromData(data.schedule) : null,
          paymentInfo: paymentInfo,
          selfDelivery: data.self_delivery,
          restaurantState:
              ServiceState(data.open_status.toServiceStatus(), data.approved),
          primaryLanguage: data.language_id.toString().toLanguageType(),
          secondaryLanguage:
              data.language_id.toString().toLanguageType().toOpLang());
    }
  } else
    return null;
  return null;
}

Future<LanguageType?> get_restaurant_priamry_lang(int restaurantId) async {
  final QueryResult<Query$getRestaurantLang> response = await _db.graphQLClient
      .query$getRestaurantLang(Options$Query$getRestaurantLang(
          variables: Variables$Query$getRestaurantLang(id: restaurantId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 restuarnt primay lang query errors : ${response.exception}");
  } else if (response.parsedData?.restaurant_by_pk != null) {
    mezDbgPrint("✅✅✅ restuarnt primay lang query success");
    return response.parsedData!.restaurant_by_pk!.language_id.toLanguageType();
  }
  return null;
}

Future<Schedule?> get_restaurant_schedule(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$getRestaurantSchedule> response = await _db
      .graphQLClient
      .query$getRestaurantSchedule(Options$Query$getRestaurantSchedule(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getRestaurantSchedule(id: restaurantId)));
  if (response.parsedData?.restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 restuarnt schedule  query errors : ${response.exception}");
  } else if (response.parsedData?.restaurant_by_pk?.schedule != null) {
    mezDbgPrint("✅✅✅ restuarnt schedule lang query success");
    return Schedule.fromData(response.parsedData!.restaurant_by_pk!.schedule!);
  }
  return null;
}

// Mutations //

Future<Restaurant> update_restaurant_info(
    {required int id, required Restaurant restaurant}) async {
  mezDbgPrint(
      "Location before saving 📍 ${restaurant.info.location.toFirebaseFormattedJson()}");
  final QueryResult<Mutation$updateRestaurantInfo> response = await _db
      .graphQLClient
      .mutate$updateRestaurantInfo(Options$Mutation$updateRestaurantInfo(
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Mutation$updateRestaurantInfo(
              id: id,
              data: Input$restaurant_set_input(
                  name: restaurant.info.name,
                  image: restaurant.info.image,
                  self_delivery: restaurant.selfDelivery,
                  schedule: restaurant.schedule?.toFirebaseFormattedJson(),
                  language_id:
                      restaurant.primaryLanguage.toFirebaseFormatString(),
                  location_gps: restaurant.info.location.toGeography(),
                  description_id: restaurant.info.descriptionId,
                  location_text: restaurant.info.location.address,
                  open_status:
                      restaurant.state.status.toFirebaseFormatString()))));
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
  }
  final Mutation$updateRestaurantInfo$update_restaurant_by_pk data =
      response.parsedData!.update_restaurant_by_pk!;
  mezDbgPrint(
      "Location after saving 📍 ${data.location_gps.latitude}  --  ${data.location_gps.longitude} ");
  return Restaurant(
      userInfo: ServiceInfo(
          hasuraId: data.id,
          image: data.image,
          firebaseId: data.firebase_id,
          description: (data.description?.translations != null)
              ? {
                  data.description!.translations.first.language_id
                          .toLanguageType():
                      data.description!.translations.first.value,
                  data.description!.translations[1].language_id
                          .toLanguageType():
                      data.description!.translations[1].value,
                }
              : null,
          name: data.name,
          location: Location.fromHasura(data.location_gps, data.location_text)),
      schedule: data.schedule != null ? Schedule.fromData(data.schedule) : null,
      paymentInfo: PaymentInfo(),
      restaurantState:
          ServiceState(data.open_status.toServiceStatus(), data.approved),
      primaryLanguage: data.language_id.toString().toLanguageType(),
      secondaryLanguage:
          data.language_id.toString().toLanguageType().toOpLang());
}

Future<bool?> switch_restaurant_self_delivery(
    {required int id, required bool value}) async {
  final QueryResult<Mutation$switchRestaurantSelfDelivery> response =
      await _db.graphQLClient.mutate$switchRestaurantSelfDelivery(
    Options$Mutation$switchRestaurantSelfDelivery(
      variables: Variables$Mutation$switchRestaurantSelfDelivery(
          restauarntId: id, value: value),
    ),
  );
  if (response.parsedData?.update_restaurant_by_pk == null) {
    throw Exception("🚨🚨🚨 Hasura mut exception =>${response.exception}");
  } else {
    return true;
  }
}

Future<double?> get_restaurant_review_average(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$get_restaurant_review_average> response =
      await _db.graphQLClient.query$get_restaurant_review_average(
    Options$Query$get_restaurant_review_average(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables: Variables$Query$get_restaurant_review_average(
          restaurantId: restaurantId),
    ),
  );
  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg?
      data =
      response.parsedData?.restaurant_by_pk!.reviews_aggregate.aggregate?.avg;

  if (data == null) {
    throw Exception(
        "🚨🚨🚨 get_restaurant_review_average Hasura querry exception =>${response.exception}");
  } else {
    return data.rating;
  }
}

Future<List<Review>?> get_restaurant_reviews(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$get_restaurant_reviews> response =
      await _db.graphQLClient.query$get_restaurant_reviews(
    Options$Query$get_restaurant_reviews(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_restaurant_reviews(restaurantId: restaurantId),
    ),
  );
  final List<Query$get_restaurant_reviews$restaurant_by_pk$reviews>? data =
      response.parsedData?.restaurant_by_pk?.reviews;

  if (data == null) {
    throw Exception("🚨🚨🚨 Hasura query  exception =>${response.exception}");
  } else {
    return data.map(
        (Query$get_restaurant_reviews$restaurant_by_pk$reviews reviewData) {
      return Review(
          id: reviewData.id,
          rating: reviewData.rating,
          comment: reviewData.note,
          reviewTime: DateTime.parse(reviewData.created_at),
          toEntityId: reviewData.to_entity_id,
          toEntityType: reviewData.to_entity_type.toServiceProviderType(),
          fromEntityId: reviewData.from_entity_id,
          fromEntityType: reviewData.from_entity_type.toServiceProviderType());
    }).toList();
  }
}

Future<List<Operator>?> get_restaurant_operators(
    {required int restaurantId, bool withCache = true}) async {
  final QueryResult<Query$getRestaurantOperators> response =
      await _db.graphQLClient.query$getRestaurantOperators(
    Options$Query$getRestaurantOperators(
      fetchPolicy: FetchPolicy.noCache,
      // fetchPolicy:
      //     withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getRestaurantOperators(restaurantId: restaurantId),
    ),
  );
  if (!response.hasException &&
      response.parsedData?.restaurant_by_pk?.restaurant_operators != null) {
    final List<
            Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>
        data = response.parsedData!.restaurant_by_pk!.restaurant_operators;
    mezDbgPrint(
        "✅✅ Hasura get operators querry ${response.parsedData?.toJson()} ");
    final List<Operator> ops = data.map(
        (Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators
            opData) {
      return Operator(
          state: OperatorState(
              owner: opData.owner,
              operatorState: opData.status.toAgentStatus(),
              restaurantId: restaurantId),
          info: UserInfo(
              hasuraId: opData.user.id,
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

// restaurant status //

Future<ServiceStatus?> get_restaurant_status(
    {required int restaurantId}) async {
  final QueryResult<Query$getRestaurantStatus> response =
      await _db.graphQLClient.query$getRestaurantStatus(
    Options$Query$getRestaurantStatus(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$getRestaurantStatus(id: restaurantId),
    ),
  );
  if (response.parsedData?.restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $restaurantId status exception \n ${response.exception}");
  } else {
    return response.parsedData!.restaurant_by_pk!.open_status.toServiceStatus();
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
  if (response.parsedData?.restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Getting restaurant $restaurantId status exception \n ${response.exception}");
  } else {
    return response.parsedData!.restaurant_by_pk!.approved;
  }
}

Future<ServiceStatus> update_restaurant_status(
    {required int id, required ServiceStatus status}) async {
  final QueryResult<Mutation$updateRestaurantInfo> response =
      await _db.graphQLClient.mutate$updateRestaurantInfo(
    Options$Mutation$updateRestaurantInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateRestaurantInfo(
        id: id,
        data: Input$restaurant_set_input(
          open_status: status.toFirebaseFormatString(),
        ),
      ),
    ),
  );
  if (response.parsedData?.update_restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Hasura status mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
    final Mutation$updateRestaurantInfo$update_restaurant_by_pk data =
        response.parsedData!.update_restaurant_by_pk!;
    return data.open_status.toServiceStatus();
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
  if (res.parsedData?.restaurant_by_pk == null) {
    throw Exception(
        "🛑 Exception 🛑 Getting payment info for $serviceProviderId ===>${res.exception}");
  }
  mezDbgPrint(
      "✅  payment data ====================> ${res.parsedData?.toJson()}");
  final Query$getRestaurantPaymentInfo$restaurant_by_pk data =
      res.parsedData!.restaurant_by_pk!;
  if (data.accepted_payments != null && data.accepted_payments != null) {
    return PaymentInfo(
        acceptedPayments: parseAcceptedPayments(data.accepted_payments),
        stripe: parseServiceStripeInfo(data.stripe_info));
  }
  return PaymentInfo();
}

// helpers //
Map<PaymentType, bool> parseAcceptedPayments(data) {
  final Map<PaymentType, bool> result = {};
  data.forEach((String key, data) {
    result[key.toPaymentType()] = data;
  });
  return result;
}

StripeInfo? parseServiceStripeInfo(data) {
  StripeInfo? stripe;

  if (data != null) {
    final List<String> requis = [];
    data["requirements"]?.forEach((req) {
      requis.add(req.toString());
    });
    stripe = StripeInfo(
        id: data["id"],
        status: data["status"].toString().toStripeStatus(),
        payoutsEnabled: data["payoutsEnabled"] ?? false,
        detailsSubmitted: data["detailsSubmitted"] ?? false,
        chargesEnabled: data["chargesEnabled"] ?? false,
        chargeFeesOnCustomer: data["chargeFeesOnCustomer"] ?? true,
        email: data["email"],
        requirements: requis);
    return stripe;
  }
  return null;
}

Future<PaymentInfo> update_restaurant_payment_info(
    {required int id, required PaymentInfo paymentInfo}) async {
  final QueryResult<Mutation$updateRestaurantInfo> response =
      await _db.graphQLClient.mutate$updateRestaurantInfo(
    Options$Mutation$updateRestaurantInfo(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Mutation$updateRestaurantInfo(
        id: id,
        data: Input$restaurant_set_input(
          accepted_payments: paymentInfo.getAcceptedPaymentsJson(),
          stripe_info: paymentInfo.stripe?.toJson(),
        ),
      ),
    ),
  );
  if (response.parsedData?.update_restaurant_by_pk == null) {
    throw Exception("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura mutation success => ${response.parsedData?.update_restaurant_by_pk?.accepted_payments}");
  }
  final Mutation$updateRestaurantInfo$update_restaurant_by_pk data =
      response.parsedData!.update_restaurant_by_pk!;
  return PaymentInfo(
    acceptedPayments: parseAcceptedPayments(data.accepted_payments),
    stripe: parseServiceStripeInfo(data.stripe_info),
  );
}
