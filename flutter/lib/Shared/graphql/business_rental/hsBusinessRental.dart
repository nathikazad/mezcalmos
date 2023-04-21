import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<RentalCard>> get_rental_by_category(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    List<RentalCategory2>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _rentals = <RentalCard>[];

  final QueryResult<Query$get_rental_by_category> response = await _db
      .graphQLClient
      .query$get_rental_by_category(Options$Query$get_rental_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_rental_by_category(
              category1: category1.toFirebaseFormatString(),
              categories2: categories2
                      ?.map((RentalCategory2 e) => e.toFirebaseFormatString())
                      .toList() ??
                  ["uncategorized"],
              tags: tags ?? [],
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_rental != null) {
    response.parsedData?.business_rental
        .forEach((Query$get_rental_by_category$business_rental data) async {
      _rentals.add(RentalCard(
        businessName: data.business.details.name,
        rental: Rental(
            category1: data.details.category1.toRentalCategory1(),
            category2: data.details.category2.toRentalCategory2(),
            category3: data.category3,
            details: BusinessItemDetails(
              id: data.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
            ),
            bathrooms: data.home_rental?.bathrooms,
            bedrooms: data.home_rental?.bedrooms,
            homeType: data.home_rental?.home_type,
            gpsLocation: (data.home_rental != null)
                ? Location(
                    lat: data.home_rental!.gps_location.latitude,
                    lng: data.home_rental!.gps_location.longitude,
                    address: data.home_rental!.address)
                : null),
      ));
    });
    return _rentals;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return [];
  }
}

Future<RentalWithBusinessCard?> get_rental_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_rental_by_id> response = await _db.graphQLClient
      .query$get_rental_by_id(Options$Query$get_rental_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_rental_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_rental_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_rental_by_id$business_rental_by_pk? data =
        response.parsedData?.business_rental_by_pk!;

    if (data != null) {
      return RentalWithBusinessCard(
          rental: Rental(
              category1: data.details.category1.toRentalCategory1(),
              category2: data.details.category2.toRentalCategory2(),
              category3: data.category3,
              details: BusinessItemDetails(
                id: id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                position: data.details.position,
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                image: data.details.image
                        ?.map<String>((e) => e.toString())
                        .toList() ??
                    [],
                additionalParameters: data.details.additional_parameters,
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
              ),
              bathrooms: data.home_rental?.bathrooms,
              bedrooms: data.home_rental?.bedrooms,
              homeType: data.home_rental?.home_type,
              gpsLocation: (data.home_rental != null)
                  ? Location(
                      lat: data.home_rental!.gps_location.latitude,
                      lng: data.home_rental!.gps_location.longitude,
                      address: data.home_rental!.address)
                  : null),
          business: BusinessCard(
            id: data.business.id,
            detailsId: data.business.details.id,
            name: data.business.details.name,
            image: data.business.details.image,
            acceptedPayments: PaymentInfo.fromData(
                    stripeInfo: {},
                    acceptedPayments: data.business.details.accepted_payments)
                .acceptedPayments,
            avgRating: double.tryParse(
                data.business.reviews_aggregate.aggregate?.avg.toString() ??
                    '0.0'),
            reviewCount: data.business.reviews_aggregate.aggregate?.count,
          ));
    }
  } else
    return null;
  return null;
}

Future<int?> get_number_of_rental(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_rentals> response = await _db.graphQLClient
      .query$number_of_rentals(Options$Query$number_of_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_rentals(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_rental_aggregate.aggregate != null) {
    return response.parsedData!.business_rental_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<List<RentalCard>> get_home_rentals(
    {required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _homes = <RentalCard>[];

  final QueryResult<Query$get_home_rentals> response = await _db.graphQLClient
      .query$get_home_rentals(Options$Query$get_home_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_home_rentals(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              offset: offset,
              limit: limit)));

  mezDbgPrint("get_home_rentals $response");

  if (response.parsedData?.business_home_rental != null) {
    response.parsedData?.business_home_rental
        .forEach((Query$get_home_rentals$business_home_rental data) async {
      _homes.add(RentalCard(
          businessName: data.rental.business.details.name,
          rental: Rental(
            category1: data.rental.details.category1.toRentalCategory1(),
            details: BusinessItemDetails(
              id: data.rental.id,
              name: toLanguageMap(
                  translations: data.rental.details.name.translations),
              position: data.rental.details.position,
              businessId: data.rental.business.id,
              available: data.rental.details.available,
              image: data.rental.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.rental.details.cost),
              additionalParameters: data.rental.details.additional_parameters,
            ),
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude,
                address: data.address),
            homeType: data.home_type,
          )));
    });
    return _homes;
  } else {
    return [];
  }
}

Future<int?> add_one_rental({required Rental rental}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");

  final QueryResult<Mutation$create_rental> response = await _db.graphQLClient
      .mutate$create_rental(Options$Mutation$create_rental(
          variables: Variables$Mutation$create_rental(
              object: Input$business_rental_insert_input(
                  business_id: rental.details.businessId.toInt(),
                  category3: rental.category3,
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: rental.details.available,
                          category1: rental.category1.toFirebaseFormatString(),
                          category2: rental.category2?.toFirebaseFormatString() ??
                              RentalCategory2.Uncategorized
                                  .toFirebaseFormatString(),
                          cost: rental.details.cost,
                          image: rental.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                                  service_provider_id:
                                      rental.details.businessId.toInt(),
                                  service_provider_type: ServiceProviderType
                                      .Business.toFirebaseFormatString(),
                                  translations:
                                      Input$translation_value_arr_rel_insert_input(data: <
                                          Input$translation_value_insert_input>[
                                    Input$translation_value_insert_input(
                                        language_id: Language.EN
                                            .toFirebaseFormatString(),
                                        value:
                                            rental.details.name[Language.EN]),
                                    Input$translation_value_insert_input(
                                        language_id: Language.ES
                                            .toFirebaseFormatString(),
                                        value: rental.details.name[Language.ES])
                                  ]))),
                          position: rental.details.position?.toInt(),
                          additional_parameters:
                              rental.details.additionalParameters,
                          description: (rental.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                      service_provider_id:
                                          rental.details.businessId.toInt(),
                                      service_provider_type: ServiceProviderType
                                          .Business.toFirebaseFormatString(),
                                      translations:
                                          Input$translation_value_arr_rel_insert_input(
                                              data: <Input$translation_value_insert_input>[
                                            Input$translation_value_insert_input(
                                                language_id: Language.EN
                                                    .toFirebaseFormatString(),
                                                value: rental.details
                                                    .description?[Language.EN]),
                                            Input$translation_value_insert_input(
                                                language_id: Language.ES
                                                    .toFirebaseFormatString(),
                                                value: rental.details
                                                    .description?[Language.ES])
                                          ])))
                              : null))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add rental mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add rental mutation success => ${response.data}");
    return response.parsedData?.insert_business_rental_one?.id;
  }
  return null;
}

Future<int?> add_one_home_rental({required Rental rental}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");

  final QueryResult<Mutation$add_home_rental> response = await _db.graphQLClient
      .mutate$add_home_rental(Options$Mutation$add_home_rental(
          variables: Variables$Mutation$add_home_rental(
              object: Input$business_home_rental_insert_input(
    bathrooms: rental.bathrooms?.toInt(),
    bedrooms: rental.bedrooms?.toInt(),
    gps_location: (rental.gpsLocation != null)
        ? Geography(rental.gpsLocation!.lat.toDouble(),
            rental.gpsLocation!.lng.toDouble())
        : null,
    home_type: rental.homeType,
    rental: Input$business_rental_obj_rel_insert_input(
        data: Input$business_rental_insert_input(
            business_id: rental.details.businessId.toInt(),
            category3: rental.category3,
            details: Input$business_item_details_obj_rel_insert_input(
                data: Input$business_item_details_insert_input(
                    available: rental.details.available,
                    category1: rental.category1.toFirebaseFormatString(),
                    category2: rental.category2?.toFirebaseFormatString() ??
                        RentalCategory2.Uncategorized.toFirebaseFormatString(),
                    cost: rental.details.cost,
                    image: rental.details.image,
                    name: Input$translation_obj_rel_insert_input(
                        data: Input$translation_insert_input(
                            service_provider_id:
                                rental.details.businessId.toInt(),
                            service_provider_type: ServiceProviderType.Business
                                .toFirebaseFormatString(),
                            translations:
                                Input$translation_value_arr_rel_insert_input(
                                    data: <
                                        Input$translation_value_insert_input>[
                                  Input$translation_value_insert_input(
                                      language_id:
                                          Language.EN.toFirebaseFormatString(),
                                      value: rental.details.name[Language.EN]),
                                  Input$translation_value_insert_input(
                                      language_id:
                                          Language.ES.toFirebaseFormatString(),
                                      value: rental.details.name[Language.ES])
                                ]))),
                    position: rental.details.position?.toInt(),
                    additional_parameters: rental.details.additionalParameters,
                    description: (rental.details.description != null)
                        ? Input$translation_obj_rel_insert_input(
                            data: Input$translation_insert_input(
                                service_provider_id:
                                    rental.details.businessId.toInt(),
                                service_provider_type: ServiceProviderType
                                    .Business.toFirebaseFormatString(),
                                translations:
                                    Input$translation_value_arr_rel_insert_input(
                                        data: <
                                            Input$translation_value_insert_input>[
                                      Input$translation_value_insert_input(
                                          language_id: Language.EN
                                              .toFirebaseFormatString(),
                                          value: rental.details
                                              .description?[Language.EN]),
                                      Input$translation_value_insert_input(
                                          language_id: Language.ES
                                              .toFirebaseFormatString(),
                                          value: rental.details
                                              .description?[Language.ES])
                                    ])))
                        : null)))),
  ))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add rental mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add rental mutation success => ${response.data}");
    return response.parsedData?.insert_business_home_rental_one?.rental_id;
  }
  return null;
}
