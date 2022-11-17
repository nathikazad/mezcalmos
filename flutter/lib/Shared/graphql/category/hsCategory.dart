import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/category/__generated/category.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';

final HasuraDb hasuraDb = Get.find<HasuraDb>();

Future<List<Category>?> get_restaurant_categories_by_id(int restaurantId,
    {bool withCache = true}) async {
  final QueryResult<Query$getRestaurantCategories> response = await hasuraDb
      .graphQLClient
      .query$getRestaurantCategories(Options$Query$getRestaurantCategories(
          fetchPolicy:
              (!withCache) ? FetchPolicy.noCache : FetchPolicy.cacheAndNetwork,
          variables:
              Variables$Query$getRestaurantCategories(id: restaurantId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get restaurant categories querry exception =>${response.exception}");
  } else {
    mezDbgPrint("Hasura get restaurant categories querry success ✅✅✅ ");
    if (response.parsedData != null) {
      final List<Category> categories = [];

      response.parsedData!.restaurant_category
          .forEach((Query$getRestaurantCategories$restaurant_category element) {
        // assigning category
        final Category cat = Category(
          id: element.id.toString(),
          position: element.position,
          dialog: toLanguageMap(data: element.description?.translations),
          name: toLanguageMap(data: element.name.translations),
        );
        // getting alll the items //
        final List<Item> items = element.items.map(
            (Query$getRestaurantCategories$restaurant_category$items item) {
          return Item(
              // TODO INT ID
              id: item.id.toString(),
              name: toLanguageMap(data: item.name.translations),
              itemType: item.item_type.toItemType(),
              description: toLanguageMap(data: item.description?.translations),
              cost: item.cost,
              available: item.available);
        }).toList();

        cat.items = items;
        categories.add(cat);
      });
      return categories;
    }
  }
  return null;
}

Future<bool> delete_category(int id) async {
  final QueryResult<Mutation$deleteCategory> response = await hasuraDb
      .graphQLClient
      .mutate$deleteCategory(Options$Mutation$deleteCategory(
          variables: Variables$Mutation$deleteCategory(categoryId: id)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura delete category mutation exception =>${response.exception}");
    return false;
  } else {
    mezDbgPrint("✅✅✅ Hasura delete category mutation success ");
    return true;
  }
}

Future<Category?> get_category_by_id(int id) async {
  final QueryResult<Query$getCategoryInfoById> response = await hasuraDb
      .graphQLClient
      .query$getCategoryInfoById(Options$Query$getCategoryInfoById(
          variables: Variables$Query$getCategoryInfoById(id: id)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get category by id querry exception =>${response.exception}");
    return null;
  } else {
    mezDbgPrint("✅✅✅ Hasura get category by id query success => ");
    return Category(
      id: response.parsedData?.restaurant_category_by_pk?.id.toString(),
      descriptionId:
          response.parsedData?.restaurant_category_by_pk?.description_id,
      nameId: response.parsedData?.restaurant_category_by_pk?.name.id,
      name: toLanguageMap(
          data: response
              .parsedData?.restaurant_category_by_pk?.name.translations),
      dialog: toLanguageMap(
          data: response.parsedData?.restaurant_category_by_pk?.description
              ?.translations),
    );
  }
}

Future<String?> add_category(int restaurantId, Category category) async {
  final QueryResult<Mutation$addCategory> result =
      await hasuraDb.graphQLClient.mutate$addCategory(
    Options$Mutation$addCategory(
      variables: Variables$Mutation$addCategory(
        category: Input$restaurant_category_insert_input(
          restaurant_id: restaurantId,

          position: category.position,
          // items: Input$restaurant_item_arr_rel_insert_input(
          //     data: category.items
          //         .map((Item e) => convert_item_to_hasura(e))
          //         .toList()),
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
    mezDbgPrint(
        "🚨🚨🚨 Hasura add category mutation exception =>${result.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add category mutation success => ${result.data}");
    return result.parsedData?.insert_restaurant_category_one?.id.toString();
  }
  return null;
}
