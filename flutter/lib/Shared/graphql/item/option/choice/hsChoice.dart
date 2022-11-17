import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

Input$restaurant_option_choice_map_insert_input convert_choice_to_hasura(
    Choice choice) {
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
