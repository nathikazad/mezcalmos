import 'package:get/instance_manager.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/category/__generated/category.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

final HasuraDb hasuraDb = Get.find<HasuraDb>();
Future<void> writeCategoryToHasura(Category category) async {
  final QueryResult<Mutation$addCategory> result =
      await hasuraDb.graphQLClient.mutate$addCategory(
    Options$Mutation$addCategory(
      variables: Variables$Mutation$addCategory(
        category: Input$restaurant_category_insert_input(
          restaurant_id: 4,

          position: category.position,
          items: Input$restaurant_item_arr_rel_insert_input(
              data: category.items.map((Item e) => convertIem(e)).toList()),
          // name //
          name: Input$translation_obj_rel_insert_input(
            data: Input$translation_insert_input(
              translations: Input$translation_value_arr_rel_insert_input(
                  data: <Input$translation_value_insert_input>[
                    Input$translation_value_insert_input(
                        language_id: LanguageType.EN.toFirebaseFormatString(),
                        value: category.name?[LanguageType.EN]),
                    Input$translation_value_insert_input(
                        language_id: LanguageType.ES.toFirebaseFormatString(),
                        value: category.name?[LanguageType.ES]),
                  ]),
            ),
          ),
          // description //
          description: Input$translation_obj_rel_insert_input(
            data: Input$translation_insert_input(
              translations: Input$translation_value_arr_rel_insert_input(
                  data: <Input$translation_value_insert_input>[
                    Input$translation_value_insert_input(
                        language_id: LanguageType.EN.toFirebaseFormatString(),
                        value: category.dialog?[LanguageType.EN]),
                    Input$translation_value_insert_input(
                        language_id: LanguageType.ES.toFirebaseFormatString(),
                        value: category.dialog?[LanguageType.ES]),
                  ]),
            ),
          ),
        ),
      ),
    ),
  );
  if (result.hasException) {
    mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${result.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${result.data}");
  }
}

Input$restaurant_item_insert_input convertIem(Item item) {
  return Input$restaurant_item_insert_input(
    name: Input$translation_obj_rel_insert_input(
      data: Input$translation_insert_input(
        translations: Input$translation_value_arr_rel_insert_input(
            data: <Input$translation_value_insert_input>[
              Input$translation_value_insert_input(
                  language_id: LanguageType.EN.toFirebaseFormatString(),
                  value: item.name[LanguageType.EN]),
              Input$translation_value_insert_input(
                  language_id: LanguageType.ES.toFirebaseFormatString(),
                  value: item.name[LanguageType.ES]),
            ]),
      ),
    ),
    restaurant_id: 4,
    position: item.position,
    cost: item.cost.toDouble(),
    options: Input$restaurant_item_option_map_arr_rel_insert_input(
        data: item.options
            .map((Option option) => convertOption(option))
            .toList()),
  );
}

Input$restaurant_item_option_map_insert_input convertOption(Option option) {
  return Input$restaurant_item_option_map_insert_input(
    // option_id: 7,
    // if option already exist use that option id to link it to the item
    item_options: Input$restaurant_option_arr_rel_insert_input(
      data: [
        Input$restaurant_option_insert_input(
          position: option.position,
          option_type: option.optionType.toFirebaseFormatString(),
          maximum_choice: option.maximumChoice.toInt(),
          minimum_choice: option.minimumChoice.toInt(),
          free_choice: option.freeChoice.toInt(),
          choices: Input$restaurant_option_choice_map_arr_rel_insert_input(
              data: option.choices
                  .map((Choice choice) => convertChoice(choice))
                  .toList()),
          name: Input$translation_obj_rel_insert_input(
            data: Input$translation_insert_input(
              translations: Input$translation_value_arr_rel_insert_input(
                  data: <Input$translation_value_insert_input>[
                    Input$translation_value_insert_input(
                        language_id: LanguageType.EN.toFirebaseFormatString(),
                        value: option.name[LanguageType.EN]),
                    Input$translation_value_insert_input(
                        language_id: LanguageType.ES.toFirebaseFormatString(),
                        value: option.name[LanguageType.ES]),
                  ]),
            ),
          ),
        ),
      ],
    ),
  );
}

Input$restaurant_option_choice_map_insert_input convertChoice(Choice choice) {
  return Input$restaurant_option_choice_map_insert_input(
      option_choices: Input$restaurant_choice_arr_rel_insert_input(data: [
    Input$restaurant_choice_insert_input(
      available: choice.available,
      cost: choice.cost.toDouble(),
      name: Input$translation_obj_rel_insert_input(
        data: Input$translation_insert_input(
          translations: Input$translation_value_arr_rel_insert_input(
              data: <Input$translation_value_insert_input>[
                Input$translation_value_insert_input(
                    language_id: LanguageType.EN.toFirebaseFormatString(),
                    value: choice.name[LanguageType.EN]),
                Input$translation_value_insert_input(
                    language_id: LanguageType.ES.toFirebaseFormatString(),
                    value: choice.name[LanguageType.ES]),
              ]),
        ),
      ),
    ),
  ]));
}

// Future<void> writeItem(Item item) async {
//   final QueryResult<Mutation$addItem> result =
//       await hasuraDb.graphQLClient.mutate$addItem(
//     Options$Mutation$addItem(
//       variables: Variables$Mutation$addItem(
//         item: Input$restaurant_item_insert_input(
//           category_id: 1,
//           restaurant_id: 4,
//           position: item.position,
//           cost: item.cost.toDouble(),
//           //  cost: MoneyToJson(item.cost),
//           name: Input$translation_obj_rel_insert_input(
//             data: Input$translation_insert_input(
//               translations: Input$translation_value_arr_rel_insert_input(
//                   data: <Input$translation_value_insert_input>[
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.EN.toFirebaseFormatString(),
//                         value: item.name[LanguageType.EN]),
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.ES.toFirebaseFormatString(),
//                         value: item.name[LanguageType.ES]),
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//   if (result.hasException) {
//     mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${result.exception}");
//   } else {
//     mezDbgPrint("✅✅✅ Hasura mutation success => ${result.data}");
//   }
// }

// Future<void> writeOption(Option option) async {
//   final QueryResult<Mutation$addOption> result =
//       await hasuraDb.graphQLClient.mutate$addOption(
//     Options$Mutation$addOption(
//       variables: Variables$Mutation$addOption(
//         option: Input$restaurant_option_insert_input(
//           //   category_id: 1,
//           //   restaurant_id: 4,
//           position: option.position,
//           option_type: option.optionType.toFirebaseFormatString(),
//           maximum_choice: option.maximumChoice.toInt(),
//           minimum_choice: option.minimumChoice.toInt(),
//           free_choice: option.freeChoice.toInt(),

//           //  cost: MoneyToJson(item.cost),
//           name: Input$translation_obj_rel_insert_input(
//             data: Input$translation_insert_input(
//               translations: Input$translation_value_arr_rel_insert_input(
//                   data: <Input$translation_value_insert_input>[
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.EN.toFirebaseFormatString(),
//                         value: option.name[LanguageType.EN]),
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.ES.toFirebaseFormatString(),
//                         value: option.name[LanguageType.ES]),
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//   if (result.hasException) {
//     mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${result.exception}");
//   } else {
//     mezDbgPrint("✅✅✅ Hasura mutation success => ${result.data}");
//   }
// }

// Future<void> writeChoice(Choice choice) async {
//   final QueryResult<Mutation$addChoice> result =
//       await hasuraDb.graphQLClient.mutate$addChoice(
//     Options$Mutation$addChoice(
//       variables: Variables$Mutation$addChoice(
//         choice: Input$restaurant_choice_insert_input(
//           available: choice.available,
//           cost: choice.cost.toDouble(),
//           name: Input$translation_obj_rel_insert_input(
//             data: Input$translation_insert_input(
//               translations: Input$translation_value_arr_rel_insert_input(
//                   data: <Input$translation_value_insert_input>[
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.EN.toFirebaseFormatString(),
//                         value: choice.name[LanguageType.EN]),
//                     Input$translation_value_insert_input(
//                         language_id: LanguageType.ES.toFirebaseFormatString(),
//                         value: choice.name[LanguageType.ES]),
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//   if (result.hasException) {
//     mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${result.exception}");
//   } else {
//     mezDbgPrint("✅✅✅ Hasura mutation success => ${result.data}");
//   }
// }
