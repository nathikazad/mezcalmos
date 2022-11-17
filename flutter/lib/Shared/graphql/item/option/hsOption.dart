import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/item/option/choice/hsChoice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

Input$restaurant_item_option_map_insert_input convert_option_to_hasura(
    Option option) {
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
                  .map((Choice choice) => convert_choice_to_hasura(choice))
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
