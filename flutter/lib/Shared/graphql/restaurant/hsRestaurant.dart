import 'package:get/get.dart';
import 'package:graphql/client.dart';
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

// Get single restuarant //
// ignore: non_constant_identifier_names

Future<List<Restaurant>> fetch_restaurants({required bool withCache}) async {
  final List<Restaurant> _restaurants = <Restaurant>[];

  final QueryResult<Query$getRestaurants> response = await _db.graphQLClient
      .query$getRestaurants(Options$Query$getRestaurants(
          fetchPolicy: withCache
              ? FetchPolicy.cacheAndNetwork
              : FetchPolicy.networkOnly));
  mezDbgPrint(
      "get restuarnts called =======< ${response.parsedData?.toJson()}");

  if (response.parsedData?.restaurant_restaurant != null) {
    response.parsedData?.restaurant_restaurant
        .forEach((Query$getRestaurants$restaurant_restaurant data) async {
      _restaurants.add(Restaurant(
        languages: convertToLanguages(data.details!.language),
        serviceDetailsId: data.details!.id,
        userInfo: ServiceInfo(
            hasuraId: data.id,
            image: data.details!.image,
            description: (data.details!.description?.translations != null &&
                    data.details!.description?.translations.isNotEmpty == true)
                ? {
                    data.details!.description!.translations.first.language_id
                            .toLanguageType():
                        data.details!.description!.translations.first.value,
                    data.details!.description!.translations[1].language_id
                            .toLanguageType():
                        data.details!.description!.translations[1].value,
                  }
                : null,
            firebaseId: data.details!.firebase_id,
            name: data.details!.name,
            descriptionId: data.details!.description_id,
            location: MezLocation.fromHasura(
                data.details!.location.gps, data.details!.location.address)),
        deliveryCost: (data.delivery_details_of_deliverer == null)
            ? null
            : DeliveryCost(
                id: data.delivery_details_of_deliverer!.first.id,
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
            ? Schedule.fromData(data.details!.schedule)
            : null,
        paymentInfo: PaymentInfo(),
        rate: data.reviews_aggregate.aggregate?.avg?.rating,
        restaurantState: ServiceState(
            data.details!.open_status.toServiceStatus(),
            data.details!.approved),

        // primaryLanguage: data.language_id.toString().toLanguageType(),
        // secondaryLanguage:
        //     data.language_id.toString().toLanguageType().toOpLang()
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
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura querry success, data : ${response.parsedData?.restaurant_restaurant_by_pk?.toJson()} ");
    final Query$getOneRestaurant$restaurant_restaurant_by_pk? data =
        response.parsedData?.restaurant_restaurant_by_pk!;
    // final PaymentInfo paymentInfo = PaymentInfo.fromData(
    //     acceptedPayments: data?.details?.accepted_payments,
    //     stripeInfo: data?.details?.stripe_info);

    if (data != null) {
      return Restaurant(
        languages: convertToLanguages(data.details!.language),
        serviceDetailsId: data.details!.id,
        deliveryDetailsId: data.delivery_details_id,
        deliveryCost: (data.delivery_details_of_deliverer == null)
            ? null
            : DeliveryCost(
                id: data.delivery_details_of_deliverer!.first.id,
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
            description: (data.details!.description?.translations != null)
                ? {
                    data.details!.description!.translations.first.language_id
                            .toLanguageType():
                        data.details!.description!.translations.first.value,
                    data.details!.description!.translations[1].language_id
                            .toLanguageType():
                        data.details!.description!.translations[1].value,
                  }
                : null,
            firebaseId: data.details!.firebase_id,
            name: data.details!.name,
            descriptionId: data.details!.description_id,
            location: MezLocation.fromHasura(
                data.details!.location.gps, data.details!.location.address)),
        schedule: data.details!.schedule != null
            ? Schedule.fromData(data.details!.schedule)
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

Future<LanguageType?> get_restaurant_priamry_lang(int restaurantId) async {
  final QueryResult<Query$getRestaurantLang> response = await _db.graphQLClient
      .query$getRestaurantLang(Options$Query$getRestaurantLang(
          variables: Variables$Query$getRestaurantLang(id: restaurantId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 restuarnt primay lang query errors : ${response.exception}");
  } else if (response.parsedData?.restaurant_restaurant_by_pk != null) {
    mezDbgPrint("✅✅✅ restuarnt primay lang query success");
    return LanguageType.EN;
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
  if (response.parsedData?.restaurant_restaurant_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 restuarnt schedule  query errors : ${response.exception}");
  } else if (response
          .parsedData?.restaurant_restaurant_by_pk?.details?.schedule !=
      null) {
    mezDbgPrint("✅✅✅ restuarnt schedule lang query success");
    return Schedule.fromData(
        response.parsedData!.restaurant_restaurant_by_pk!.details?.schedule);
  }
  return null;
}

// Mutations //

// Future<Restaurant> update_restaurant_info({
//   required int id,
//   required Restaurant restaurant,
//   bool? approved,
// }) async {
//   mezDbgPrint(
//       "Location before saving 📍 ${restaurant.info.location.toFirebaseFormattedJson()}");
//   final QueryResult<Mutation$updateRestaurantInfo> response = await _db
//       .graphQLClient
//       .mutate$updateRestaurantInfo(Options$Mutation$updateRestaurantInfo(
//           fetchPolicy: FetchPolicy.networkOnly,
//           variables: Variables$Mutation$updateRestaurantInfo(
//               id: id,
//               data: Input$restaurant_restaurant_set_input(
//                   approved: approved,
//                   name: restaurant.info.name,
//                   image: restaurant.info.image,
//                   delivery_details_id: restaurant.deliveryDetailsId,
//                   self_delivery: restaurant.selfDelivery,
//                   schedule: restaurant.schedule?.toFirebaseFormattedJson(),
//                   language_id:
//                       restaurant.primaryLanguage.toFirebaseFormatString(),

//                   //   location_gps: restaurant.info.location.toGeography(),
//                   description_id: restaurant.info.descriptionId,
//                   // location_text: restaurant.info.location.address,
//                   open_status:
//                       restaurant.state.status.toFirebaseFormatString()))));
//   if (response.hasException) {
//     mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
//   } else {
//     mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
//   }
//   final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk data =
//       response.parsedData!.update_restaurant_restaurant_by_pk!;
//   final PaymentInfo _paymentInfo = PaymentInfo();
//   if (data.accepted_payments != null) {
//     _paymentInfo.acceptedPayments =
//         parseAcceptedPayments(data.accepted_payments);
//   }
//   if (data.stripe_info != null) {
//     _paymentInfo.stripe = parseServiceStripeInfo(data.stripe_info);
//   }

//   return Restaurant(
//       deliveryDetailsId: data.delivery_details_of_deliverer?.first.id,
//       userInfo: ServiceInfo(
//           hasuraId: data.id,
//           image: data.image,
//           firebaseId: data.firebase_id,
//           description: (data.description?.translations != null)
//               ? {
//                   data.description!.translations.first.language_id
//                           .toLanguageType():
//                       data.description!.translations.first.value,
//                   data.description!.translations[1].language_id
//                           .toLanguageType():
//                       data.description!.translations[1].value,
//                 }
//               : null,
//           name: data.name,
//           location:
//               MezLocation.fromHasura(data.location.gps, data.location.address)),
//       schedule: data.schedule != null ? Schedule.fromData(data.schedule) : null,
//       paymentInfo: _paymentInfo,
//       restaurantState:
//           ServiceState(data.open_status.toServiceStatus(), data.approved),
//       primaryLanguage: data.language_id.toString().toLanguageType(),
//       secondaryLanguage:
//           data.language_id.toString().toLanguageType().toOpLang());
// }

// Future<bool?> switch_restaurant_self_delivery(
//     {required int id, required bool value}) async {
//   final QueryResult<Mutation$switchRestaurantSelfDelivery> response =
//       await _db.graphQLClient.mutate$switchRestaurantSelfDelivery(
//     Options$Mutation$switchRestaurantSelfDelivery(
//       variables: Variables$Mutation$switchRestaurantSelfDelivery(
//           restauarntId: id, value: value),
//     ),
//   );
//   if (response.parsedData?.update_restaurant_restaurant_by_pk == null) {
//     throw Exception("🚨🚨🚨 Hasura mut exception =>${response.exception}");
//   } else {
//     return true;
//   }
// }

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

// Future<ServiceStatus> update_restaurant_status(
//     {required int id, required ServiceStatus status}) async {
//   final QueryResult<Mutation$updateRestaurantInfo> response =
//       await _db.graphQLClient.mutate$updateRestaurantInfo(
//     Options$Mutation$updateRestaurantInfo(
//       fetchPolicy: FetchPolicy.networkOnly,
//       variables: Variables$Mutation$updateRestaurantInfo(
//         id: id,
//         data: Input$restaurant_restaurant_set_input(
//           open_status: status.toFirebaseFormatString(),
//         ),
//       ),
//     ),
//   );
//   if (response.parsedData?.update_restaurant_restaurant_by_pk == null) {
//     throw Exception(
//         "🚨🚨🚨 Hasura status mutation exception =>${response.exception}");
//   } else {
//     mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
//     final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk
//         data = response.parsedData!.update_restaurant_restaurant_by_pk!;
//     return data.details!.open_status.toServiceStatus();
//   }
// }

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

// Future<PaymentInfo> update_restaurant_payment_info(
//     {required int id, required PaymentInfo paymentInfo}) async {
//   final QueryResult<Mutation$updateRestaurantInfo> response =
//       await _db.graphQLClient.mutate$updateRestaurantInfo(
//     Options$Mutation$updateRestaurantInfo(
//       fetchPolicy: FetchPolicy.networkOnly,
//       variables: Variables$Mutation$updateRestaurantInfo(
//         id: id,
//         data: Input$restaurant_restaurant_set_input(
//           accepted_payments: paymentInfo.getAcceptedPaymentsJson(),
//           stripe_info: paymentInfo.stripe?.toJson(),
//         ),
//       ),
//     ),
//   );
//   if (response.parsedData?.update_restaurant_restaurant_by_pk == null) {
//     throw Exception("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
//   } else {
//     mezDbgPrint(
//         "✅✅✅ Hasura mutation success => ${response.parsedData?.update_restaurant_restaurant_by_pk?.accepted_payments}");
//   }
//   final Mutation$updateRestaurantInfo$update_restaurant_restaurant_by_pk data =
//       response.parsedData!.update_restaurant_restaurant_by_pk!;
//   return PaymentInfo(
//     acceptedPayments: parseAcceptedPayments(data.details!.accepted_payments),
//     stripe: parseServiceStripeInfo(data.details!.stripe_info),
//   );
// }
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
