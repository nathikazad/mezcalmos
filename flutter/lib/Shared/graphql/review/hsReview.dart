import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/review/__generated/review.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<int?> insert_review({required Review review}) async {
  final QueryResult<Mutation$insertReview> res =
      await _db.graphQLClient.mutate$insertReview(
    Options$Mutation$insertReview(
      variables: Variables$Mutation$insertReview(
        review: Input$review_insert_input(
          from_entity_id: review.fromEntityId,
          from_entity_type: review.fromEntityType.toFirebaseFormatString(),
          to_entity_id: review.toEntityId,
          to_entity_type: review.toEntityType.toFirebaseFormatString(),
          note: review.comment,
          rating: review.rating.toInt(),
        ),
      ),
    ),
  );
  if (res.parsedData?.insert_review_one == null) {
    throw Exception("🚨 insert review exception 🚨 \n ${res.exception}");
  }
  return res.parsedData!.insert_review_one?.id;
}

Future<double?> get_service_review_average(
    {required int serviceId, bool withCache = true}) async {
  final QueryResult<Query$get_service_review_average> response =
      await _db.graphQLClient.query$get_service_review_average(
    Options$Query$get_service_review_average(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables:
          Variables$Query$get_service_review_average(serviceId: serviceId),
    ),
  );
  Query$get_service_review_average$review_aggregate? data =
      response.parsedData?.review_aggregate;

  if (data == null) {
    throw Exception(
        "🚨🚨🚨 get_restaurant_review_average Hasura querry exception =>${response.exception}");
  } else {
    mezDbgPrint(" 😍😍😍😍 Getting avg rating =======>>>>>>>>>>>>$data");
    return data.aggregate?.avg?.rating;
  }
}

Future<List<Review>?> get_service_reviews(
    {required int serviceId, bool withCache = true}) async {
  final QueryResult<Query$get_service_reviews> response =
      await _db.graphQLClient.query$get_service_reviews(
    Options$Query$get_service_reviews(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
      variables: Variables$Query$get_service_reviews(serviceId: serviceId),
    ),
  );
  List<Query$get_service_reviews$review>? data = response.parsedData?.review;

  if (data == null) {
    throw Exception("🚨🚨🚨 Hasura query  exception =>${response.exception}");
  } else {
    mezDbgPrint(" 😍😍😍😍 Getting avg rating =======>>>>>>>>>>>>$data");
    return data.map<Review>((Query$get_service_reviews$review reviewData) {
      return Review(
          id: reviewData.id,
          rating: reviewData.rating,
          comment: reviewData.note,
          customer: (reviewData.customer != null)
              ? UserInfo(
                  hasuraId: reviewData.customer!.user.id,
                  name: reviewData.customer!.user.name,
                  image: reviewData.customer!.user.image)
              : null,
          reviewTime: DateTime.parse(reviewData.created_at),
          toEntityId: reviewData.to_entity_id,
          toEntityType: reviewData.to_entity_type.toServiceProviderType(),
          fromEntityId: reviewData.from_entity_id,
          fromEntityType: reviewData.from_entity_type.toServiceProviderType());
    }).toList();
  }
}
