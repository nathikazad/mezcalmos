import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business/__generated/business.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<BusinessCardView>> get_business_by_rental_category1(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    bool withCache = true}) async {
  final List<BusinessCardView> _businesses = <BusinessCardView>[];

  final QueryResult<Query$get_business_by_rental_category1> response =
      await _db.graphQLClient.query$get_business_by_rental_category1(
          Options$Query$get_business_by_rental_category1(
              fetchPolicy: withCache
                  ? FetchPolicy.cacheAndNetwork
                  : FetchPolicy.networkOnly,
              variables: Variables$Query$get_business_by_rental_category1(
                  category1: category1.toFirebaseFormatString(),
                  distance: distance,
                  from: Geography(fromLocation.lat as double,
                      fromLocation.lng as double))));

  if (response.parsedData?.business_business != null) {
    response.parsedData?.business_business.forEach(
        (Query$get_business_by_rental_category1$business_business data) async {
      _businesses.add(BusinessCardView(
        id: data.id,
        detailsId: data.details.id,
        name: data.details.name,
        image: data.details.image,
        acceptedPayments: data.details.accepted_payments,
        avgRating: data.reviews_aggregate.aggregate?.avg?.rating,
        reviewCount: data.reviews_aggregate.aggregate?.count,
      ));
    });
    return _businesses;
  } else {
    return [];
  }
}
