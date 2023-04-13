import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<RentalWithBusiness>> get_rental_by_category(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    List<RentalCategory2>? categories2,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalWithBusiness> _rentals = <RentalWithBusiness>[];

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
      _rentals.add(RentalWithBusiness(
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

Future<RentalWithBusiness?> get_rental_by_id(
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
      return RentalWithBusiness(
          businessName: data.business.details.name,
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
                  image: data.service.image
                          ?.map<String>((e) => e.toString())
                          .toList() ??
                      [],
                  additionalParameters: data.service.additional_parameters,
                  description: toLanguageMap(
                      translations:
                          data.service.description?.translations ?? []))));
    }
  } else
    return null;
  return null;
}

Future<List<HomeRentalWithBusiness>> get_home_rentals(
    {required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<HomeRentalWithBusiness> _homes = <HomeRentalWithBusiness>[];

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
      _homes.add(HomeRentalWithBusiness(
          businessName: data.rental.business.details.name,
          home: HomeRental(
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude),
            homeType: data.homeType,
            rental: Rental(
                category1: data.rental.service.category1.toRentalCategory1(),
                details: BusinessService(
                  id: data.rental.id,
                  name: toLanguageMap(
                      translations: data.rental.service.name.translations),
                  position: data.rental.service.position,
                  businessId: data.rental.business.id,
                  available: data.rental.service.available,
                  image: data.rental.service.image
                          ?.map<String>((e) => e.toString())
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

Future<HomeRentalWithBusiness?> get_home_rental_by_id(
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
      return HomeRentalWithBusiness(
        businessName: data.rental.business.details.name,
        home: HomeRental(
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude),
            homeType: data.homeType,
            rental: Rental(
                category1: data.rental.service.category1.toRentalCategory1(),
                details: BusinessService(
                    id: id,
                    name: toLanguageMap(
                        translations: data.rental.service.name.translations),
                    position: data.rental.service.position,
                    businessId: data.rental.business.id,
                    available: data.rental.service.available,
                    cost:
                        constructBusinessServiceCost(data.rental.service.cost),
                    image: data.rental.service.image?.entries
                            .map((e) => e.value)
                            .toList() ??
                        [],
                    additionalParameters:
                        data.rental.service.additional_parameters,
                    description: toLanguageMap(
                        translations:
                            data.rental.service.description?.translations ??
                                [])))),
      );
    }
  } else
    return null;
  return null;
}

class RentalWithBusiness extends Rental {
  final String businessName;
  RentalWithBusiness({
    required Rental rental,
    required this.businessName,
  }) : super(
          category1: rental.category1,
          details: rental.details,
        );
}

class HomeRentalWithBusiness extends HomeRental {
  final String businessName;
  HomeRentalWithBusiness({
    required HomeRental home,
    required this.businessName,
  }) : super(
          bathrooms: home.bathrooms,
          bedrooms: home.bedrooms,
          gpsLocation: home.gpsLocation,
          homeType: home.homeType,
          rental: home.rental,
        );
}
