import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();

// Get single restuarant //
// ignore: non_constant_identifier_names

Future<List<Restaurant>> fetch_restaurants() async {
  mezDbgPrint("[77] fetch_restaurants !");

  final List<Restaurant> _restaus = <Restaurant>[];

  final QueryResult<Query$getRestaurants> response =
      await _db.graphQLClient.query$getRestaurants();
  if (response.hasException) {
    mezDbgPrint(
        "[777] fetch_restaurants :: exception :: ${response.exception}!");
  } else
    mezDbgPrint("rESTAUS ===> ${response.data}");
  response.parsedData?.restaurant
      .forEach((Query$getRestaurants$restaurant data) async {
    _restaus.add(Restaurant(
        userInfo: ServiceInfo(
            hasuraId: data.id,
            image: data.image,
            firebaseId: data.firebase_id,
            name: data.name,
            descriptionId: data.description_id,
            //   descriptionId: data.d,
            location:
                Location.fromHasura(data.location_gps, data.location_text)),
        description: null,
        // {
        //   data.description!.translations.first.language_id.toLanguageType():
        //       data.description!.translations.first.value,
        //   data.description!.translations[1].language_id.toLanguageType():
        //       data.description!.translations[1].value,
        // },
        schedule: Schedule(openHours: {}),
        paymentInfo: PaymentInfo(),
        restaurantState:
            ServiceState(data.open_status.toServiceStatus(), data.approved),
        primaryLanguage: data.language_id.toString().toLanguageType(),
        secondaryLanguage:
            data.language_id.toString().toLanguageType().toOpLang()));
  });
  return _restaus;
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

  response.parsedData?.restaurant_item.forEach((element) {
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

  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
    return null;
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura querry success, data : ${response.parsedData?.restaurant_by_pk?.toJson()} ");
    final Query$getOneRestaurant$restaurant_by_pk? data =
        response.parsedData?.restaurant_by_pk!;

    if (data != null) {
      mezDbgPrint(
          "response data ====> ${response.data} 🍔🍔🍔 Restaurant data ${data.toJson()}");
      return Restaurant(
          userInfo: ServiceInfo(
              hasuraId: data.id,
              image: data.image,
              firebaseId: data.firebase_id ?? "",
              name: data.name,
              descriptionId: data.description_id,
              location:
                  Location.fromHasura(data.location_gps, data.location_text)),
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
          schedule: Schedule(openHours: {}),
          paymentInfo: PaymentInfo(),
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

// Mutations //

Future<Restaurant> editRestaurant(
    {required int id, required Restaurant restaurant}) async {
  final QueryResult<Mutation$updateRestaurantInfo> response = await _db
      .graphQLClient
      .mutate$updateRestaurantInfo(Options$Mutation$updateRestaurantInfo(
          variables: Variables$Mutation$updateRestaurantInfo(
              id: id,
              data: Input$restaurant_set_input(
                  name: restaurant.info.name,
                  image: restaurant.info.image,
                  language_id:
                      restaurant.primaryLanguage.toFirebaseFormatString(),
                  location_gps: Geography(
                    restaurant.info.location.position.latitude!,
                    restaurant.info.location.position.longitude!,
                  ),
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
  return Restaurant(
      userInfo: ServiceInfo(
          hasuraId: data.id,
          image: data.image,
          firebaseId: data.firebase_id!,
          name: data.name,
          location: Location.fromHasura(data.location_gps, data.location_text)),
      description: {
        data.description!.translations.first.language_id.toLanguageType():
            data.description!.translations.first.value,
        data.description!.translations[1].language_id.toLanguageType():
            data.description!.translations[1].value,
      },
      schedule: Schedule(openHours: {}),
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
    throw Exception("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
  } else {
    return true;
  }

  // final Mutation$updateRestaurantInfo$update_restaurant_by_pk data =
  //     response.parsedData!.update_restaurant_by_pk!;
  // return Restaurant(
  //     userInfo: ServiceInfo(
  //         hasuraId: data.id,
  //         image: data.image,
  //         firebaseId: data.firebase_id!,
  //         name: data.name,
  //         location: Location.fromHasura(data.location_gps, data.location_text)),
  //     description: {
  //       data.description!.translations.first.language_id.toLanguageType():
  //           data.description!.translations.first.value,
  //       data.description!.translations[1].language_id.toLanguageType():
  //           data.description!.translations[1].value,
  //     },
  //     schedule: Schedule(openHours: {}),
  //     paymentInfo: PaymentInfo(),
  //     restaurantState:
  //         ServiceState(data.open_status.toServiceStatus(), data.approved),
  //     primaryLanguage: data.language_id.toString().toLanguageType(),
  //     secondaryLanguage:
  //         data.language_id.toString().toLanguageType().toOpLang());
}

Future<List<RestaurantOperator>?> get_restaurant_operators(
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
    final List<RestaurantOperator> ops = data.map(
        (Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators
            opData) {
      return RestaurantOperator(
          state: RestaurantOperatorState(
              owner: opData.owner,
              operatorState: opData.status.toAgentStatus(),
              restaurantId: restaurantId.toString()),
          info: UserInfo(
              hasuraId: opData.user.id,
              firebaseId: opData.user.firebase_id,
              name: opData.user.name,
              image: opData.user.image),
          operatorId: opData.user.id.toString());
    }).toList();
    return ops;
  } else {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get restaurant operators exceptions ${response.exception}");
  }

  return null;
}
