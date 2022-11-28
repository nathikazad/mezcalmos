import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/item/__generated/item.graphql.dart';
import 'package:mezcalmos/Shared/graphql/item/option/hsOption.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';

HasuraDb _db = Get.find<HasuraDb>();

// Mutations //
Future<bool> update_item_by_id(
    {required int itemId, required Item item}) async {
  final QueryResult<Mutation$upadateItem> response =
      await _db.graphQLClient.mutate$upadateItem(
    Options$Mutation$upadateItem(
      variables: Variables$Mutation$upadateItem(
        id: itemId,
        itemData: Input$restaurant_item_set_input(
          category_id: item.categoryId,
          cost: item.cost.toDouble(),
          available: item.available,
          item_type: item.itemType.toFirebaseFormatString(),
          position: item.position,
          special_period_end: item.startsAt?.toUtc().toString(),
          special_period_start: item.endsAt?.toUtc().toString(),
        ),
      ),
    ),
  );
  response.hasException
      ? mezDbgPrint("🚨🚨🚨 Update item mutation errors ${response.exception}")
      : mezDbgPrint("✅✅✅ Update item mutation success");
  return !response.hasException;
}

Future<int?> add_one_item(
    {required Item item, required int restaurantId, int? categoryId}) async {
  final QueryResult<Mutation$addItem> response =
      await _db.graphQLClient.mutate$addItem(Options$Mutation$addItem(
          variables: Variables$Mutation$addItem(
              item: Input$restaurant_item_insert_input(
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
    description: Input$translation_obj_rel_insert_input(
      data: Input$translation_insert_input(
        translations: Input$translation_value_arr_rel_insert_input(
            data: <Input$translation_value_insert_input>[
              Input$translation_value_insert_input(
                  language_id: LanguageType.EN.toFirebaseFormatString(),
                  value: item.description?[LanguageType.EN]),
              Input$translation_value_insert_input(
                  language_id: LanguageType.ES.toFirebaseFormatString(),
                  value: item.description?[LanguageType.ES]),
            ]),
      ),
    ),
    restaurant_id: restaurantId,
    category_id: categoryId,
    position: item.position,
    cost: item.cost.toDouble(),
    options: Input$restaurant_item_option_map_arr_rel_insert_input(
        data: item.options
            .map((Option option) => convert_option_to_hasura(option))
            .toList()),
  ))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add item mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add item mutation success => ${response.data}");
    return response.parsedData?.insert_restaurant_item_one?.id;
  }
  return null;
}

Future<int?> delete_item_by_id(int itemId) async {
  final QueryResult<Mutation$deleteItem> response = await _db.graphQLClient
      .mutate$deleteItem(Options$Mutation$deleteItem(
          variables: Variables$Mutation$deleteItem(itemId: itemId)));

  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura delete item mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura delete item mutation success => ${response.data}");
    return response.parsedData?.delete_restaurant_item_by_pk?.id;
  }
  return null;
}

// Querries //

Future<Item?> get_one_item_by_id(int itemId, {bool withCache = true}) async {
  final QueryResult<Query$getItemById> response = await _db.graphQLClient
      .query$getItemById(Options$Query$getItemById(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getItemById(id: itemId)));

  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get item guery exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura get item query success");
    final Query$getItemById$restaurant_item_by_pk data =
        response.parsedData!.restaurant_item_by_pk!;
    final Item item = Item(
        name: toLanguageMap(translations: data.name.translations),
        id: data.id.toString(),
        nameId: data.name.id,
        descriptionId: data.description?.id,
        categoryId: data.category_id,
        startsAt: (data.special_period_start != null)
            ? DateTime.tryParse(data.special_period_start!)
            : null,
        endsAt: (data.special_period_end != null)
            ? DateTime.tryParse(data.special_period_end!)
            : null,
        description: (data.description?.translations != null)
            ? toLanguageMap(translations: data.description!.translations)
            : null,
        cost: data.cost,
        available: data.available,
        position: data.position,
        itemType: data.item_type.toItemType());
    data.options.forEach(
        (Query$getItemById$restaurant_item_by_pk$options listOfOptions) {
      item.options.addAll(_convertOption(listOfOptions));
    });

    return item;
  }
  return null;
}

// helpers //
List<Option> _convertOption(
    Query$getItemById$restaurant_item_by_pk$options optionsData) {
  final List<Option> options = optionsData.item_options.map(
      (Query$getItemById$restaurant_item_by_pk$options$item_options oneOption) {
    final Option newOption = Option(
      id: oneOption.id.toString(),
      nameId: oneOption.name.id,
      name: toLanguageMap(translations: oneOption.name.translations),
      costPerExtra: oneOption.cost_per_extra,
      freeChoice: oneOption.free_choice,
      maximumChoice: oneOption.maximum_choice,
      minimumChoice: oneOption.minimum_choice,
      optionType: oneOption.option_type.toOptionType(),
      position: oneOption.position,
    );
    oneOption.choices.forEach(
        (Query$getItemById$restaurant_item_by_pk$options$item_options$choices
            listOfChoices) {
      newOption.choices.addAll(_convertChoices(listOfChoices));
    });
    return newOption;
  }).toList();
  return options;
}

List<Choice> _convertChoices(
    Query$getItemById$restaurant_item_by_pk$options$item_options$choices
        choicesData) {
  final List<Choice> choices = choicesData.option_choices.map(
      (Query$getItemById$restaurant_item_by_pk$options$item_options$choices$option_choices
          oneChoice) {
    return Choice(
        id: oneChoice.id.toString(),
        nameId: oneChoice.name.id,
        name: toLanguageMap(translations: oneChoice.name.translations),
        cost: oneChoice.cost);
  }).toList();
  return choices;
}
