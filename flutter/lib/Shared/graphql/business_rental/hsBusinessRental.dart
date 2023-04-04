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
            // description: (data.details!.description?.translations != null &&
            //         data.details!.description?.translations.isNotEmpty == true)
            //     ? {
            //         data.details!.description!.translations.first.language_id
            //                 .toLanguageType():
            //             data.details!.description!.translations.first.value,
            //         data.details!.description!.translations[1].language_id
            //                 .toLanguageType():
            //             data.details!.description!.translations[1].value,
            //       }
            //     : null,
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
