import 'package:get/instance_manager.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/review/__generated/review.graphql.dart';
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
