import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/item/option/__generated/option.graphql.dart';
import 'package:mezcalmos/Shared/graphql/item/option/choice/hsChoice.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

HasuraDb _db = Get.find<HasuraDb>();

// querries //
Future<Option?> get_option_by_id(int optionId, {bool withCache = true}) async {
  final QueryResult<Query$getOptionById> response = await _db.graphQLClient
      .query$getOptionById(Options$Query$getOptionById(
          fetchPolicy: FetchPolicy.noCache,
          variables: Variables$Query$getOptionById(optionId: optionId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get option query exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura get option query  success ");

    final Query$getOptionById$restaurant_option_by_pk? data =
        response.parsedData?.restaurant_option_by_pk;

    if (data != null) {
      final Option option = Option(
          id: data.id,
          position: data.position,
          optionType: data.option_type.toOptionType(),
          maximumChoice: data.maximum_choice,
          freeChoice: data.free_choice,
          minimumChoice: data.minimum_choice,
          costPerExtra: data.cost_per_extra,
          nameId: data.name.id,
          name: toLanguageMap(translations: data.name.translations));
      data.choices.forEach(
          (Query$getOptionById$restaurant_option_by_pk$choices element) {
        option.choices.addAll(parse_choices(element));
      });

      return option;
    }
  }
  return null;
}

// Mutations //
Future<int?> add_option(
    {required Option option,
    required int itemId,
    required int restaurantId}) async {
  final QueryResult<Mutation$addOption> response =
      await _db.graphQLClient.mutate$addOption(
    Options$Mutation$addOption(
      variables: Variables$Mutation$addOption(
        option: Input$restaurant_option_insert_input(
          restaurant_id: restaurantId,
          items: Input$restaurant_item_option_map_arr_rel_insert_input(data: [
            Input$restaurant_item_option_map_insert_input(
                item_id: itemId, restaurant_id: restaurantId)
          ]),
          position: option.position,
          cost_per_extra: option.costPerExtra.toDouble(),
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
              service_provider_id: restaurantId,
              service_provider_type:
                  OrderType.Restaurant.toFirebaseFormatString(),
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
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 add option mutation errors ${response.exception}");
  } else if (response.parsedData?.insert_restaurant_option_one?.id != null) {
    mezDbgPrint("✅✅✅ add option mutation success ");
    return response.parsedData?.insert_restaurant_option_one?.id;
  }
  return null;
}

Future<bool> delete_option_by_id({required int optionId}) async {
  final QueryResult<Mutation$deleteOptionbyId> response = await _db
      .graphQLClient
      .mutate$deleteOptionbyId(Options$Mutation$deleteOptionbyId(
          variables: Variables$Mutation$deleteOptionbyId(id: optionId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura delete option mutation exception =>${response.exception}");
    return false;
  } else {
    mezDbgPrint("🦄🦄🦄 Hasura delete option mutation success ");
    return true;
  }
}

Future<bool> update_option_by_id(
    {required int optionId, required Option option}) async {
  final QueryResult<Mutation$updateOption> response =
      await _db.graphQLClient.mutate$updateOption(Options$Mutation$updateOption(
          variables: Variables$Mutation$updateOption(
              optionId: optionId,
              optionData: Input$restaurant_option_set_input(
                minimum_choice: option.minimumChoice.toInt(),
                maximum_choice: option.maximumChoice.toInt(),
                free_choice: option.freeChoice.toInt(),
                cost_per_extra: option.costPerExtra.toDouble(),
                option_type: option.optionType.toFirebaseFormatString(),
                position: option.position,
              ))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura update option mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura update option mutation success => ${response.data}");
  }
  return !response.hasException;
}

// helpers //
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

List<Choice> parse_choices(
    Query$getOptionById$restaurant_option_by_pk$choices listOfChoices) {
  List<Choice> choices = [];
  choices = listOfChoices.option_choices.map(
      (Query$getOptionById$restaurant_option_by_pk$choices$option_choices
          choice) {
    return Choice(
        id: choice.id,
        available: choice.available,
        nameId: choice.name.id,
        name: toLanguageMap(translations: choice.name.translations),
        cost: choice.cost);
  }).toList();

  return choices;
}
