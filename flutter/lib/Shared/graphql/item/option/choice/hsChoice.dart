import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/item/option/choice/__generated/choice.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

HasuraDb _db = Get.find<HasuraDb>();
// Querries //

Future<Choice?> get_choice_by_id(int choiceId) async {
  final QueryResult<Query$getChoiceById> response = await _db.graphQLClient
      .query$getChoiceById(Options$Query$getChoiceById(
          variables: Variables$Query$getChoiceById(id: choiceId)));

  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get choice guery exception =>${response.exception}");
  } else if (response.parsedData?.restaurant_choice_by_pk != null) {
    mezDbgPrint("✅✅✅ Hasura get choice guery success ");

    final Query$getChoiceById$restaurant_choice_by_pk data =
        response.parsedData!.restaurant_choice_by_pk!;
    final Choice choice = Choice(
        id: data.id.toString(),
        nameId: data.name.id,
        name: toLanguageMap(translations: data.name.translations),
        cost: data.cost);
    return choice;
  }
  return null;
}

// Mutations //
Future<int?> add_choice(
    {required Choice choice,
    required int optionId,
    required int restaurantId}) async {
  mezDbgPrint(choice.toJson());
  final QueryResult<Mutation$addChoice> response =
      await _db.graphQLClient.mutate$addChoice(
    Options$Mutation$addChoice(
      variables: Variables$Mutation$addChoice(
        choice: Input$restaurant_choice_insert_input(
          available: choice.available,
          restaurant_id: restaurantId,
          cost: choice.cost.toDouble(),
          options:
              Input$restaurant_option_choice_map_arr_rel_insert_input(data: [
            Input$restaurant_option_choice_map_insert_input(
                option_id: optionId, restaurant_id: restaurantId)
          ]),
          name: Input$translation_obj_rel_insert_input(
            data: Input$translation_insert_input(
              service_provider_id: restaurantId,
              service_provider_type:
                  OrderType.Restaurant.toFirebaseFormatString(),
              translations: Input$translation_value_arr_rel_insert_input(
                data: [
                  Input$translation_value_insert_input(
                      language_id: LanguageType.EN.toFirebaseFormatString(),
                      value: choice.name[LanguageType.EN]),
                  Input$translation_value_insert_input(
                      language_id: LanguageType.ES.toFirebaseFormatString(),
                      value: choice.name[LanguageType.ES]),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 add choice mutation ${response.exception}");
  } else if (response.parsedData?.insert_restaurant_choice_one != null) {
    mezDbgPrint("✅✅✅ add choice mutation success ");
    return response.parsedData?.insert_restaurant_choice_one!.id;
  }
  return null;
}

Future<bool> update_choice_by_id(int choiceId, Choice choice) async {
  final QueryResult<Mutation$updateChoiceById> response = await _db
      .graphQLClient
      .mutate$updateChoiceById(Options$Mutation$updateChoiceById(
          variables: Variables$Mutation$updateChoiceById(
              id: choiceId,
              choiceData: Input$restaurant_choice_set_input(
                available: choice.available,
                cost: choice.cost.toDouble(),
              ))));
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 Choice edit mutation errors ${response.exception}");
  } else if (response.parsedData?.update_restaurant_choice_by_pk != null) {
    mezDbgPrint("✅✅✅ Choice edit mutation success ${response.data}");
  }
  return response.hasException == false;
}

Future<bool> delete_choice_by_id({required int choiceId}) async {
  final QueryResult<Mutation$deleteChoiceById> response =
      await _db.graphQLClient.mutate$deleteChoiceById(
    Options$Mutation$deleteChoiceById(
      variables: Variables$Mutation$deleteChoiceById(id: choiceId),
    ),
  );
  if (response.hasException) {
    mezDbgPrint(
        "🚨 Hasura delete choice $choiceId errors ${response.exception}");
    return false;
  } else {
    mezDbgPrint("🚀 Hasura delete choice $choiceId SUCCESS}");
    return response.parsedData?.delete_restaurant_choice_by_pk != null;
  }
}

// helpers //
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
