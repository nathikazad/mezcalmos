import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_event/__generated/business_event.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_product/__generated/business_product.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_service/__generated/business_service.graphql.dart';
import 'package:mezcalmos/Shared/graphql/common/__generated/common.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<ServiceTree> get_service_tree(
    {required double distance,
    required double lat,
    required double lng,
    required bool withCache}) async {
  //create tree root node
  final ServiceTree root = ServiceTree(MezService.Root, 0, null);

  final QueryResult<Query$number_of_delivery> deliveryResponse = await _db
      .graphQLClient
      .query$number_of_delivery(Options$Query$number_of_delivery(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_delivery(
              distance: distance, from: Geography(lat, lng))));

  final ServiceTree deliveries = ServiceTree(
      MezService.Deliveries,
      deliveryResponse.parsedData?.laundry_store_aggregate.aggregate?.count ??
          0 +
              (deliveryResponse.parsedData?.delivery_company_aggregate.aggregate
                      ?.count ??
                  0),
      root);
  if ((deliveryResponse
              .parsedData?.delivery_company_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree courier = ServiceTree(
        MezService.Courier,
        (deliveryResponse
                .parsedData?.delivery_company_aggregate.aggregate?.count ??
            0),
        deliveries);
    // deliveries.children.add(courier);
    root.children.add(courier);
  }
  ServiceTree? laundry = null;
  if ((deliveryResponse.parsedData?.laundry_store_aggregate.aggregate?.count ??
          0) >
      0) {
    laundry = ServiceTree(
        MezService.Laundry,
        (deliveryResponse
                .parsedData?.laundry_store_aggregate.aggregate?.count ??
            0),
        deliveries);
    // deliveries.children.add(laundry);
  }
  // if (deliveries.count > 0) {
  //   root.children.add(deliveries);
  // }

  final QueryResult<Query$number_of_food_by_category> foodResponse =
      await _db.graphQLClient.query$number_of_food_by_category(
          Options$Query$number_of_food_by_category(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$number_of_food_by_category(
                  distance: distance, from: Geography(lat, lng))));

  final ServiceTree food = ServiceTree(
      MezService.Food,
      (foodResponse.parsedData?.restaurant_restaurant_aggregate.aggregate
                  ?.count ??
              0) +
          (foodResponse
                  .parsedData?.business_product_aggregate.aggregate?.count ??
              0) +
          (foodResponse
                  .parsedData?.business_service_aggregate.aggregate?.count ??
              0),
      root);
  if ((foodResponse
              .parsedData?.restaurant_restaurant_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree restaurant = ServiceTree(
        MezService.Restaurants,
        (foodResponse
                .parsedData?.restaurant_restaurant_aggregate.aggregate?.count ??
            0),
        food);
    food.children.add(restaurant);
  }
  if ((foodResponse.parsedData?.business_product_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree product = ServiceTree(
        MezService.LocallyMade,
        foodResponse.parsedData?.business_product_aggregate.aggregate?.count ??
            0,
        food);
    food.children.add(product);
  }
  if ((foodResponse.parsedData?.business_service_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree service = ServiceTree(
        MezService.MealPlanning,
        foodResponse.parsedData?.business_service_aggregate.aggregate?.count ??
            0,
        food);
    food.children.add(service);
  }
  if (food.count > 0) {
    root.children.add(food);
  }

  final ServiceTree rentals = ServiceTree(MezService.Rentals, 0, root);
  List<Future<void>> futures = [];
  RentalCategory1.values.forEach((RentalCategory1 element) async {
    if (element == RentalCategory1.Uncategorized) return;

    futures.add(rentalsQuery(withCache, distance, lat, lng, element, rentals));
  });
  final QueryResult<Query$number_of_home> homeResponse = await _db.graphQLClient
      .query$number_of_home(Options$Query$number_of_home(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_home(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree home = ServiceTree(
      MezService.Home,
      homeResponse.parsedData?.business_home_aggregate.aggregate?.count ?? 0,
      root);
  await Future.wait(futures);
  if (rentals.count > 0) {
    if (home.count > 0) {
      rentals.children.add(home);
    }
    root.children.add(rentals);
  }

  final QueryResult<Query$number_of_classes> classResponse = await _db
      .graphQLClient
      .query$number_of_classes(Options$Query$number_of_classes(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_classes(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree classes = ServiceTree(
      MezService.Classes,
      classResponse.parsedData?.business_event_aggregate.aggregate?.count ?? 0,
      root);
  if (classes.count > 0) {
    root.children.add(classes);
  }

  final QueryResult<Query$number_of_therapy> therapyResponse = await _db
      .graphQLClient
      .query$number_of_therapy(Options$Query$number_of_therapy(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_therapy(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree therapy = ServiceTree(
      MezService.Therapy,
      therapyResponse.parsedData?.business_event_aggregate.aggregate?.count ??
          0,
      root);
  if (therapy.count > 0) {
    root.children.add(therapy);
  }

  final QueryResult<Query$number_of_events> eventsResponse = await _db
      .graphQLClient
      .query$number_of_events(Options$Query$number_of_events(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_events(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree events = ServiceTree(
      MezService.Events,
      eventsResponse.parsedData?.business_event_aggregate.aggregate?.count ?? 0,
      root);
  if (events.count > 0) {
    root.children.add(events);
  }

  final QueryResult<Query$number_of_volunteer> volunteerResponse = await _db
      .graphQLClient
      .query$number_of_volunteer(Options$Query$number_of_volunteer(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_volunteer(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree volunteer = ServiceTree(
      MezService.Volunteer,
      volunteerResponse.parsedData?.business_event_aggregate.aggregate?.count ??
          0,
      root);
  if (volunteer.count > 0) {
    root.children.add(volunteer);
  }

  final QueryResult<Query$number_of_adventure> adventureResponse = await _db
      .graphQLClient
      .query$number_of_adventure(Options$Query$number_of_adventure(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_adventure(
              distance: distance, from: Geography(lat, lng))));

  final ServiceTree adventure = ServiceTree(
      MezService.Adventure,
      adventureResponse.parsedData?.business_event_aggregate.aggregate?.count ??
          0,
      root);
  if (adventure.count > 0) {
    root.children.add(adventure);
  }
  final ServiceTree services = ServiceTree(MezService.Services, 0, root);
  List<Future<void>> futuresServices = [];
  ServiceCategory1.values.forEach((ServiceCategory1 element) async {
    if (element == ServiceCategory1.Uncategorized) return;

    futuresServices
        .add(servicesQuery(withCache, distance, lat, lng, element, services));
  });
  await Future.wait(futuresServices);
  if (services.count > 0) {
    if (laundry != null) {
      services.children.add(laundry);
    }
    root.children.add(services);
  }

  final QueryResult<Query$number_of_real_estate> realEstateResponse = await _db
      .graphQLClient
      .query$number_of_real_estate(Options$Query$number_of_real_estate(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_real_estate(
              distance: distance, from: Geography(lat, lng))));
  final ServiceTree realEstate = ServiceTree(
      MezService.RealEstate,
      realEstateResponse.parsedData?.business_home_aggregate.aggregate?.count ??
          0,
      root);
  if (realEstate.count > 0) {
    root.children.add(realEstate);
  }

  final ServiceTree products = ServiceTree(MezService.LocallyMade, 0, root);
  List<Future<void>> futuresProducts = [];
  ProductCategory1.values.forEach((ProductCategory1 element) async {
    if (element == ProductCategory1.Uncategorized) return;

    futuresProducts
        .add(productsQuery(withCache, distance, lat, lng, element, products));
  });
  await Future.wait(futuresProducts);
  if (products.count > 0) {
    root.children.add(products);
  }

  return root;
}

Future<void> productsQuery(bool withCache, double distance, double lat,
    double lng, ProductCategory1 element, ServiceTree products) async {
  final QueryResult<Query$number_of_products_by_category> productResponse =
      await _db.graphQLClient.query$number_of_products_by_category(
          Options$Query$number_of_products_by_category(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$number_of_products_by_category(
                  distance: distance,
                  from: Geography(lat, lng),
                  category1: element.toFirebaseFormatString())));
  if ((productResponse
              .parsedData?.business_product_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree product = ServiceTree(
        element.toFirebaseFormatString().toMezService(),
        productResponse
                .parsedData?.business_product_aggregate.aggregate?.count ??
            0,
        products);
    products.children.add(product);
    products.count += product.count;
  }
}

Future<void> servicesQuery(bool withCache, double distance, double lat,
    double lng, ServiceCategory1 element, ServiceTree services) async {
  final QueryResult<Query$number_of_services_by_category> serviceResponse =
      await _db.graphQLClient.query$number_of_services_by_category(
          Options$Query$number_of_services_by_category(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$number_of_services_by_category(
                  distance: distance,
                  from: Geography(lat, lng),
                  category1: element.toFirebaseFormatString())));
  if ((serviceResponse
              .parsedData?.business_service_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree service = ServiceTree(
        element.toFirebaseFormatString().toMezService(),
        serviceResponse
                .parsedData?.business_service_aggregate.aggregate?.count ??
            0,
        services);
    services.children.add(service);
    services.count += service.count;
  }
}

Future<void> rentalsQuery(bool withCache, double distance, double lat,
    double lng, RentalCategory1 element, ServiceTree rentals) async {
  final QueryResult<Query$number_of_rentals_by_category> rentalResponse =
      await _db.graphQLClient.query$number_of_rentals_by_category(
          Options$Query$number_of_rentals_by_category(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$number_of_rentals_by_category(
                  distance: distance,
                  from: Geography(lat, lng),
                  category1: element.toFirebaseFormatString())));

  if ((rentalResponse.parsedData?.business_rental_aggregate.aggregate?.count ??
          0) >
      0) {
    final ServiceTree rental = ServiceTree(
        element.toFirebaseFormatString().toMezService(),
        rentalResponse.parsedData?.business_rental_aggregate.aggregate?.count ??
            0,
        rentals);
    rentals.children.add(rental);
    rentals.count += rental.count;
  }
}

//construct a tree class
class ServiceTree {
  MezService name;
  int count;
  ServiceTree? parent;
  List<ServiceTree> children = [];
  ServiceTree(this.name, this.count, this.parent);

  @override
  String toString() =>
      'ServiceTree(name: $name, count: $count, children: $children)';
}

enum MezService {
  Root,
  Deliveries,
  Food,
  Rentals,
  Classes,
  Therapy,
  Events,
  Volunteer,
  Adventure,
  Services,
  LocallyMade,
  Laundry,
  Courier,
  Restaurants,
  Farmers,
  MealPlanning,
  Surf,
  Vehicle,
  Home,
  CoWorking,
  Cleaning,
  PetSitting,
  Consumable,
  PersonalCare,
  Art,
  Beauty,
  Tattoo,
  Photography,
  RealEstate,
  Uncategorized
}

extension ParseMezServiceToString on MezService {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }

  OrderType toOrderType() {
    switch (this) {
      case MezService.Restaurants:
        return OrderType.Restaurant;
      case MezService.Laundry:
        return OrderType.Laundry;
      case MezService.Courier:
        return OrderType.Courier;
      default:
        throw Exception("Invalid service");
    }
  }
}

extension ParseStringToMezService on String {
  MezService toMezService() {
    mezDbgPrint2("toMezService ${toLowerCase()}");
    return MezService.values.firstWhere((MezService mezService) =>
        mezService.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
