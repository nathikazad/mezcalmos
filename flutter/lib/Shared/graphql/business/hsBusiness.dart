import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business/__generated/business.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<BusinessCard>> get_business_by_rental_category1(
    {required List<RentalCategory1> categories1,
    required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<BusinessCard> _businesses = <BusinessCard>[];

  final QueryResult<Query$get_business_by_rental_category1> response =
      await _db.graphQLClient.query$get_business_by_rental_category1(
          Options$Query$get_business_by_rental_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_rental_category1(
                  categories1: categories1
                      .map((RentalCategory1 e) => e.toFirebaseFormatString())
                      .toList(),
                  distance: distance,
                  from: Geography(
                      fromLocation.lat as double, fromLocation.lng as double),
                  offset: offset,
                  limit: limit)));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_rental_category1$business_business data) async {
      final PaymentInfo _paymentInfo = PaymentInfo.fromData(
          stripeInfo: {}, acceptedPayments: data.details.accepted_payments);
      _businesses.add(BusinessCard(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        currency: data.details.currency.toCurrency(),
        acceptedPayments: _paymentInfo.acceptedPayments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}

Future<Business?> get_business_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_business_by_id> response =
      await _db.graphQLClient.query$get_business_by_id(
    Options$Query$get_business_by_id(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$get_business_by_id(id: id),
    ),
  );

  mezDbgPrint("[+] -> id : $id $response");
  if (response.parsedData?.business_business_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_business_by_id$business_business_by_pk? data =
        response.parsedData?.business_business_by_pk!;

    if (data != null) {
      final List<Rental> _rentals = <Rental>[];
      data.rentals.forEach(
          (Query$get_business_by_id$business_business_by_pk$rentals
              rental) async {
        _rentals.add(Rental(
          category1: rental.details.category1.toRentalCategory1(),
          details: BusinessItemDetails(
            id: rental.id,
            name: toLanguageMap(translations: rental.details.name.translations),
            position: rental.details.position,
            businessId: data.id,
            available: rental.details.available,
            cost: constructBusinessServiceCost(rental.details.cost),
            image: rental.details.image
                    ?.map<String>((e) => e.toString())
                    .toList() ??
                [],
          ),
          // bathrooms: rental.
        ));
      });
      final List<Event> _events = <Event>[];
      data.events.forEach(
          (Query$get_business_by_id$business_business_by_pk$events
              event) async {
        _events.add(Event(
            category1: event.details.category1.toEventCategory1(),
            scheduleType: event.schedule_type.toScheduleType(),
            details: BusinessItemDetails(
              id: event.id,
              name:
                  toLanguageMap(translations: event.details.name.translations),
              position: event.details.position,
              businessId: data.id,
              available: event.details.available,
              cost: constructBusinessServiceCost(event.details.cost),
              image: event.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
            )));
      });
      final List<Product> _products = <Product>[];
      data.products.forEach(
          (Query$get_business_by_id$business_business_by_pk$products
              product) async {
        _products.add(Product(
            id: product.id,
            category1: product.details.category1.toProductCategory1(),
            details: BusinessItemDetails(
              id: product.details.id,
              name: toLanguageMap(
                  translations: product.details.name.translations),
              businessId: data.id,
              description: toLanguageMap(
                  translations:
                      product.details.description?.translations ?? []),
              descriptionId: product.details.description_id,
              available: product.details.available,
              cost: constructBusinessServiceCost(product.details.cost),
              image: product.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
            )));
      });
      final List<Service> _service = <Service>[];
      data.services.forEach(
          (Query$get_business_by_id$business_business_by_pk$services
              service) async {
        _service.add(Service(
            id: service.id,
            category1: service.details.category1.toServiceCategory1(),
            details: BusinessItemDetails(
              id: service.details.id,
              name: toLanguageMap(
                  translations: service.details.name.translations),
              businessId: data.id,
              additionalParameters: service.details.additional_parameters,
              description: toLanguageMap(
                  translations:
                      service.details.description?.translations ?? []),
              descriptionId: service.details.description_id,
              available: service.details.available,
              cost: constructBusinessServiceCost(service.details.cost),
              image: service.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
            )));
      });
      return Business(
        profile: data.profile.toBusinessProfile(),
        details: ServiceProvider(
            id: data.id,
            serviceProviderDetailsId: data.details.id,
            name: data.details.name,
            image: data.details.image,
            location: constructLocation(
                data.details.location.gps, data.details.location.address),
            language: ServiceProviderLanguage(
                primary:
                    data.details.language["primary"].toString().toLanguage(),
                secondary:
                    data.details.language["secondary"].toString().toLanguage()),
            currency: data.details.currency.toCurrency(),
            deliveryDetails: DeliveryDetails(
                deliveryAvailable: false,
                customerPickup: false,
                selfDelivery: false),
            serviceProviderType: ServiceProviderType.Business),
        rentals: _rentals,
        events: _events,
        products: _products,
        services: _service,
      );
    }
  } else
    return null;
  return null;
}

Future<List<BusinessCard>> get_business_by_event_category1(
    {required List<EventCategory1> categories1,
    required double distance,
    required Location fromLocation,
    required List<ScheduleType> scheduleType,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<BusinessCard> _businesses = <BusinessCard>[];

  final QueryResult<Query$get_business_by_event_category1> response =
      await _db.graphQLClient.query$get_business_by_event_category1(
          Options$Query$get_business_by_event_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_event_category1(
                  categories1: categories1
                      .map((EventCategory1 e) => e.toFirebaseFormatString())
                      .toList(),
                  schedule_type: scheduleType
                      .map((ScheduleType e) => e.toFirebaseFormatString())
                      .toList(),
                  distance: distance,
                  from: Geography(
                      fromLocation.lat as double, fromLocation.lng as double),
                  offset: offset,
                  limit: limit)));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_event_category1$business_business data) async {
      final PaymentInfo _paymentInfo = PaymentInfo.fromData(
          stripeInfo: {}, acceptedPayments: data.details.accepted_payments);
      _businesses.add(BusinessCard(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        currency: data.details.currency.toCurrency(),
        acceptedPayments: _paymentInfo.acceptedPayments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}

Future<List<BusinessCard>> get_business_by_service_category1(
    {required List<ServiceCategory1> categories1,
    required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<BusinessCard> _businesses = <BusinessCard>[];

  final QueryResult<Query$get_business_by_service_category1> response =
      await _db.graphQLClient.query$get_business_by_service_category1(
          Options$Query$get_business_by_service_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_service_category1(
                  categories1: categories1
                      .map<String>(
                          (ServiceCategory1 e) => e.toFirebaseFormatString())
                      .toList(),
                  distance: distance,
                  from: Geography(
                      fromLocation.lat as double, fromLocation.lng as double),
                  offset: offset,
                  limit: limit)));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_service_category1$business_business data) async {
      final PaymentInfo _paymentInfo = PaymentInfo.fromData(
          stripeInfo: {}, acceptedPayments: data.details.accepted_payments);
      _businesses.add(BusinessCard(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        currency: data.details.currency.toCurrency(),
        acceptedPayments: _paymentInfo.acceptedPayments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}

Future<List<BusinessCard>> get_business_by_product_category1(
    {required List<ProductCategory1> categories1,
    required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<BusinessCard> _businesses = <BusinessCard>[];

  final QueryResult<Query$get_business_by_product_category1> response =
      await _db.graphQLClient.query$get_business_by_product_category1(
          Options$Query$get_business_by_product_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_product_category1(
                  categories1: categories1
                      .map((ProductCategory1 e) => e.toFirebaseFormatString())
                      .toList(),
                  distance: distance,
                  from: Geography(
                      fromLocation.lat as double, fromLocation.lng as double),
                  offset: offset,
                  limit: limit)));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_product_category1$business_business data) async {
      final PaymentInfo _paymentInfo = PaymentInfo.fromData(
          stripeInfo: {}, acceptedPayments: data.details.accepted_payments);
      _businesses.add(BusinessCard(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        currency: data.details.currency.toCurrency(),
        acceptedPayments: _paymentInfo.acceptedPayments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}

Future<int?> update_business_item_details(
    {required int id, required BusinessItemDetails details}) async {
  QueryResult<Mutation$update_business_item_details_by_id> res =
      await _db.graphQLClient.mutate$update_business_item_details_by_id(
          Options$Mutation$update_business_item_details_by_id(
              variables: Variables$Mutation$update_business_item_details_by_id(
                  id: id,
                  object: Input$business_item_details_set_input(
                    available: details.available,
                    image: details.image,
                    cost: details.cost.map((TimeUnit key, num value) =>
                        MapEntry(
                            key.toFirebaseFormatString(), value.toDouble())),
                  ))));
  if (res.hasException) {
    mezDbgPrint("ERROR UPDATING BUSINESS ITEM DETAILS => $res");
    throw Exception("🛑 Error updating business item details ${res.exception}");
  }
  return res.parsedData?.update_business_item_details_by_pk?.id;
}

Future<BusinessItemDetails?> get_business_item_details_by_id(
    {required int detailsId, required int businessId}) async {
  final QueryResult<Query$getBusinessItemDetailsById> res =
      await _db.graphQLClient.query$getBusinessItemDetailsById(
          Options$Query$getBusinessItemDetailsById(
              variables:
                  Variables$Query$getBusinessItemDetailsById(id: detailsId)));
  if (res.hasException) {
    throw Exception("🛑 Error getting business item details ${res.exception}");
  } else if (res.parsedData?.business_item_details_by_pk != null) {
    Query$getBusinessItemDetailsById$business_item_details_by_pk data =
        res.parsedData!.business_item_details_by_pk!;
    return BusinessItemDetails(
      nameId: data.name_id,
      descriptionId: data.description_id,
      id: data.id,
      name: toLanguageMap(translations: data.name.translations),
      position: data.position,
      businessId: businessId,
      available: data.available,
      cost: constructBusinessServiceCost(data.cost),
      image: data.image?.map<String>((e) => e.toString()).toList() ?? [],
      additionalParameters: data.additional_parameters,
      description:
          toLanguageMap(translations: data.description?.translations ?? []),
    );
  }
  return null;
}

Future<int?> update_item_additional_params({
  required int id,
  required Map<String, dynamic> additionalParams,
}) async {
  final QueryResult<Mutation$update_business_item_additional_params> response =
      await _db.graphQLClient.mutate$update_business_item_additional_params(
    Options$Mutation$update_business_item_additional_params(
      variables: Variables$Mutation$update_business_item_additional_params(
        $_eq: id,
        additional_parameters: additionalParams,
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura update rental category3 mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura update rental category3 mutation success => ${response.data}");
    return response.parsedData?.update_business_item_details!.affected_rows;
  }
  return null;
}

Future<ServiceProviderLanguage?> get_business_lang(
    {required int businessId}) async {
  final QueryResult<Query$get_business_lang> res = await _db.graphQLClient
      .query$get_business_lang(Options$Query$get_business_lang(
          variables: Variables$Query$get_business_lang(id: businessId)));
  if (res.hasException) {
    throw Exception("🛑 Error getting business lang ${res.exception}");
  } else if (res.parsedData?.business_business_by_pk != null) {
    Query$get_business_lang$business_business_by_pk data =
        res.parsedData!.business_business_by_pk!;
    return ServiceProviderLanguage(
        primary: data.details.language["primary"].toString().toLanguage(),
        secondary: data.details.language["secondary"].toString().toLanguage());
  }
  return null;
}
