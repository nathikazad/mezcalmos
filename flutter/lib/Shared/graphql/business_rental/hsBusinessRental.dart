import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<RentalCard>> get_rental_by_category(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    List<RentalCategory2>? categories2,
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
                      ?.map((e) => e.toFirebaseFormatString())
                      .toList() ??
                  [],
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
              image: data.details.image?.entries.map((e) => e.value).toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
              tags:
                  data.details.tags?.entries.map((e) => e.value).toList() ?? [],
            ),
            bathrooms: data.home_rental?.bathrooms,
            bedrooms: data.home_rental?.bedrooms,
            homeType: data.home_rental?.home_type,
            gpsLocation: (data.home_rental != null)
                ? Location(
                    lat: data.home_rental!.gps_location.latitude,
                    lng: data.home_rental!.gps_location.longitude)
                : null),
      ));
    });
    return _rentals;
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
                  name: toLanguageMap(
                      translations: data.details.name.translations),
                  position: data.details.position,
                  businessId: data.business.id,
                  available: data.details.available,
                  cost: constructBusinessServiceCost(data.details.cost),
                  image: data.details.image?.entries
                          .map((e) => e.value)
                          .toList() ??
                      [],
                  additionalParameters: data.details.additional_parameters,
                  description: toLanguageMap(
                      translations:
                          data.details.description?.translations ?? []),
                  tags:
                      data.details.tags?.entries.map((e) => e.value).toList() ??
                          []),
              bathrooms: data.home_rental?.bathrooms,
              bedrooms: data.home_rental?.bedrooms,
              homeType: data.home_rental?.home_type,
              gpsLocation: (data.home_rental != null)
                  ? Location(
                      lat: data.home_rental!.gps_location.latitude,
                      lng: data.home_rental!.gps_location.longitude)
                  : null),
          business: BusinessCard(
            id: data.business.id,
            detailsId: data.business.details.id,
            name: data.business.details.name,
            image: data.business.details.image,
            acceptedPayments: data.business.details.accepted_payments,
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
              image: data.rental.details.image?.entries
                      .map((e) => e.value)
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.rental.details.cost),
              additionalParameters: data.rental.details.additional_parameters,
              tags: data.rental.details.tags?.entries
                      .map((e) => e.value)
                      .toList() ??
                  [],
            ),
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude),
            homeType: data.home_type,
            rental: Rental(
                category1: data.rental.service.category1.toRentalCategory1(),
                details: BusinessService(
                  id: data.rental.id,
                  name: toLanguageMap(
                      translations: data.rental.service.name.translations),
                  position: data.rental.service.position,
                  businessId: data.rental.business.id,
                  available: data.rental.service.available,
                  image: data.rental.service.image?.entries
                          .map((e) => e.value)
                          .toList() ??
                      [],
                  cost: constructBusinessServiceCost(data.rental.service.cost),
                  additionalParameters:
                      data.rental.service.additional_parameters,
                )),
          )));
    });
    return _homes;
  } else {
    return [];
  }
}
