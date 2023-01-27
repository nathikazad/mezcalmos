import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/translation/__generated/translation.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<bool> update_translation(
    {required LanguageType langType,
    required String value,
    // required ServiceType serviceType,
    // required int serviceId,
    required int translationId}) async {
  mezDbgPrint(" 📚📚📚 Updating translation id = $translationId 📚📚📚");
  final QueryResult<Mutation$updateTranslationValue> response = await _db
      .graphQLClient
      .mutate$updateTranslationValue(Options$Mutation$updateTranslationValue(
          variables: Variables$Mutation$updateTranslationValue(
              arguments: Input$translation_value_pk_columns_input(
                  language_id: langType.toFirebaseFormatString(),
                  translation_id: translationId),
              data: Input$translation_value_set_input(
                  //    language_id: langType.toFirebaseFormatString(),
                  value: value))));
  if (response.parsedData?.update_translation_value_by_pk == null) {
    throw Exception(
        "🚨🚨🚨 Hasura translation mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura translation mutation success ");
    return true;
  }
}

Future<int> insert_translation({
  required LanguageMap translation,
  required ServiceProviderType serviceType,
  required int serviceId,
}) async {
  mezDbgPrint(" 📚📚📚 inserting translation  📚📚📚");
  final QueryResult<Mutation$insertTranslationValue> response = await _db
      .graphQLClient
      .mutate$insertTranslationValue(Options$Mutation$insertTranslationValue(
    variables: Variables$Mutation$insertTranslationValue(
      data: Input$translation_insert_input(
        service_provider_id: serviceId,
        service_provider_type: serviceType.toFirebaseFormatString(),
        translations: Input$translation_value_arr_rel_insert_input(
          data: _convertTranslation(translation),
          // data: translation.entries.map<Input$translation_value_insert_input>(
          //     (LanguageType key, String value) {
          //   return Input$translation_value_insert_input();
          // }).toList(),
        ),
      ),
    ),
  ));
  if (response.parsedData?.insert_translation_one == null) {
    throw Exception(
        "🚨🚨🚨 Hasura translation insert exception =>${response.exception}");
  } else {
    return response.parsedData!.insert_translation_one!.id;
  }
}

List<Input$translation_value_insert_input> _convertTranslation(LanguageMap tr) {
  final List<Input$translation_value_insert_input> data = [];
  tr.forEach((LanguageType key, String value) {
    data.add(Input$translation_value_insert_input(
        language_id: key.toFirebaseFormatString(), value: value));
  });
  return data;
}
