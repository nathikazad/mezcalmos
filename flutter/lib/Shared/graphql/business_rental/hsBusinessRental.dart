import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<Rental>> get_rental_by_category(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<Rental> _rentals = <Rental>[];

  final QueryResult<Query$get_rental_by_category> response = await _db
      .graphQLClient
      .query$get_rental_by_category(Options$Query$get_rental_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_rental_by_category(
              category1: category1.toFirebaseFormatString(),
              distance: distance,
              from: Geography(
                  fromLocation.lat as double, fromLocation.lng as double),
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_rental != null) {
    response.parsedData?.business_rental
        .forEach((Query$get_rental_by_category$business_rental data) async {
      _rentals.add(Rental(
        category1: category1,
        details: BusinessService(
          id: data.id,
          name: toLanguageMap(translations: data.service.name.translations),
          position: data.service.position,
          businessId: data.business.id,
          available: data.service.available,
          image: data.service.image?.entries.map((e) => e.value).toList() ?? [],
          cost: constructBusinessServiceCost(data.service.cost),
          description: toLanguageMap(
              translations: data.service.description?.translations ?? []),
          additionalParameters: data.service.additional_parameters,
        ),
      ));
    });
    return _rentals;
  } else {
    return [];
  }
}
