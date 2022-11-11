import 'package:get/instance_manager.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

final HasuraDb hasuraDb = Get.find<HasuraDb>();
void writeCategoryToHasura(Category category) {
  hasuraDb.graphQLClient
      .mutate$addCategory(Options$Mutation$addCategory(
          variables: Variables$Mutation$addCategory(
              category: Input$restaurant_category_insert_input(
                  id: 3,
                  restaurant_id: 1,
                  position: category.position,
                  name: Input$translation_obj_rel_insert_input(
                      data: Input$translation_insert_input(
                          translations:
                              Input$translation_value_arr_rel_insert_input(
                                  data: <Input$translation_value_insert_input>[
                        Input$translation_value_insert_input(
                            language_id:
                                LanguageType.EN.toFirebaseFormatString(),
                            value: category.name?[LanguageType.EN]),
                        Input$translation_value_insert_input(
                            language_id:
                                LanguageType.ES.toFirebaseFormatString(),
                            value: category.name?[LanguageType.ES]),
                      ])))))))
      .then((value) => mezDbgPrint(value.exception.toString()));
}

Future<Category> getCategory(num category_id) async {
  Query$getCategory? category = await hasuraDb.graphQLClient
      .readQuery$getCategory(
          variables: Variables$Query$getCategory(id: category_id.toInt()));
  final Map<LanguageType, String>? descriptions = category
      ?.restaurant_category_by_pk?.description?.translations
      .fold<Map<LanguageType, String>>(<LanguageType, String>{},
          (Map<LanguageType, String> collection, value) {
    collection[value.language_id.toLanguageType()] = value.value;
    return collection;
  });
  return Category(dialog: descriptions);
}
