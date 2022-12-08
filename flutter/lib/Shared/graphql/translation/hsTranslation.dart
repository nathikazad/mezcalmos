import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/translation/__generated/translation.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<void> update_translation(
    {required LanguageType langType,
    required String value,
    // required ServiceType serviceType,
    // required int serviceId,
    required int translationId}) async {
  mezDbgPrint("Updating translation id = $translationId");
  final QueryResult<Mutation$updateTranslationValue> response = await _db
      .graphQLClient
      .mutate$updateTranslationValue(Options$Mutation$updateTranslationValue(
          variables: Variables$Mutation$updateTranslationValue(
              arguments: Input$translation_value_pk_columns_input(
                  language_id: langType.toFirebaseFormatString(),
                  translation_id: translationId),
              data: Input$translation_value_set_input(
                  language_id: langType.toFirebaseFormatString(),
                  value: value))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura translation mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura translation mutation success ");
  }
}
