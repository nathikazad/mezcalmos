import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

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
          category1: data.service.category1.toRentalCategory1(),
          details: BusinessService(
            id: data.id,
            name: toLanguageMap(translations: data.service.name.translations),
            position: data.service.position,
            businessId: data.business.id,
            available: data.service.available,
            image:
                data.service.image?.entries.map((e) => e.value).toList() ?? [],
            cost: constructBusinessServiceCost(data.service.cost),
            additionalParameters: data.service.additional_parameters,
          ),
        ),
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
      rental:
      RentalWithBusinessCard(
          rental: Rental(
              category1: data.service.category1.toRentalCategory1(),
              details: BusinessService(
                  id: id,
                  name: toLanguageMap(
                      translations: data.service.name.translations),
                  position: data.service.position,
                  businessId: data.business.id,
                  available: data.service.available,
                  cost: constructBusinessServiceCost(data.service.cost),
                  image: data.service.image?.entries
                          .map((e) => e.value)
                          .toList() ??
                      [],
                  additionalParameters: data.service.additional_parameters,
                  description: toLanguageMap(
                      translations:
                          data.service.description?.translations ?? []))),
          business: BusinessCardView(
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
              additionalParameters: data.rental.service.additional_parameters,
            ),
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude),
            homeType: data.homeType,
          )));
    });
    return _homes;
  } else {
    return [];
  }
}

Future<RentalWithBusinessCard?> get_home_rental_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_home_rental_by_id> response = await _db
      .graphQLClient
      .query$get_home_rental_by_id(Options$Query$get_home_rental_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_home_rental_by_id(rental_id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_home_rental_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_home_rental_by_id$business_home_rental_by_pk? data =
        response.parsedData?.business_home_rental_by_pk!;

    if (data != null) {
      return RentalWithBusinessCard(
          rental: Rental(
              category1: data.rental.service.category1.toRentalCategory1(),
              details: BusinessService(
                  id: id,
                  name: toLanguageMap(
                      translations: data.rental.service.name.translations),
                  position: data.rental.service.position,
                  businessId: data.rental.business.id,
                  available: data.rental.service.available,
                  cost: constructBusinessServiceCost(data.rental.service.cost),
                  image: data.rental.service.image?.entries
                          .map((e) => e.value)
                          .toList() ??
                      [],
                  additionalParameters:
                      data.rental.service.additional_parameters,
                  description: toLanguageMap(
                      translations:
                          data.rental.service.description?.translations ?? [])),
              bathrooms: data.bathrooms,
              bedrooms: data.bedrooms,
              gpsLocation: Location(
                  lat: data.gps_location.latitude,
                  lng: data.gps_location.longitude),
              homeType: data.homeType),
          business: BusinessCardView(
            id: data.rental.business.id,
            detailsId: data.rental.business.details.id,
            name: data.rental.business.details.name,
            image: data.rental.business.details.image,
            acceptedPayments: data.rental.business.details.accepted_payments,
            avgRating: double.tryParse(data
                    .rental.business.reviews_aggregate.aggregate?.avg
                    .toString() ??
                '0.0'),
            reviewCount:
                data.rental.business.reviews_aggregate.aggregate?.count,
          ));
    }
  } else
    return null;
  return null;
}
