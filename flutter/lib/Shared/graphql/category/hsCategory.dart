import 'package:get/instance_manager.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/category/__generated/category.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<List<Category>?> get_restaurant_categories_by_id(int restaurantId,
    {bool withCache = true}) async {
  mezDbgPrint("[66] get_restaurant_categories_by_id called !");
  final QueryResult<Query$getRestaurantCategories> response = await _hasuraDb
      .graphQLClient
      .query$getRestaurantCategories(Options$Query$getRestaurantCategories(
          fetchPolicy:
              (!withCache) ? FetchPolicy.noCache : FetchPolicy.cacheAndNetwork,
          variables:
              Variables$Query$getRestaurantCategories(id: restaurantId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get restaurant categories querry exception =>${response.exception}");
  } else if (response.parsedData?.restaurant_category != null) {
    mezDbgPrint("Hasura get restaurant categories querry success ✅✅✅ ");
    final List<Query$getRestaurantCategories$restaurant_category> data =
        response.parsedData!.restaurant_category;
    final List<Category> categories = _parseCategories(data);
    return categories;
  }
  return null;
}

Future<bool> delete_category(int categoryId) async {
  mezDbgPrint("========>Category id in mutuaion $categoryId");
  final QueryResult<Mutation$deleteCategory> response = await _hasuraDb
      .graphQLClient
      .mutate$deleteCategory(Options$Mutation$deleteCategory(
          variables:
              Variables$Mutation$deleteCategory(categoryId: categoryId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura delete category mutation exception =>${response.exception}");
    return false;
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura delete category mutation success ${response.parsedData} ");
    return true;
  }
}

Future<Category?> get_category_by_id(
    {required int categoryId, bool withCache = true}) async {
  final QueryResult<Query$getCategoryInfoById> response = await _hasuraDb
      .graphQLClient
      .query$getCategoryInfoById(Options$Query$getCategoryInfoById(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables: Variables$Query$getCategoryInfoById(id: categoryId)));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura get category by id querry exception =>${response.exception}");
    return null;
  } else if (response.parsedData?.restaurant_category_by_pk != null) {
    mezDbgPrint("✅✅✅ Hasura get category by id query success => ");
    final Query$getCategoryInfoById$restaurant_category_by_pk data =
        response.parsedData!.restaurant_category_by_pk!;
    return Category(
      id: data.id,
      descriptionId: data.description_id,
      nameId: data.name.id,
      name: toLanguageMap(translations: data.name.translations),
      dialog: (data.description?.translations != null)
          ? toLanguageMap(translations: data.description!.translations)
          : null,
    );
  }
  return null;
}

Future<String?> add_category(
    {required int restaurantId, required Category category}) async {
  final QueryResult<Mutation$addCategory> result =
      await _hasuraDb.graphQLClient.mutate$addCategory(
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
              service_provider_id: restaurantId,
              service_provider_type:
                  OrderType.Restaurant.toFirebaseFormatString(),
              // service_provider_type = OrderType.restaurant,
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
              service_provider_id: restaurantId,
              service_provider_type:
                  OrderType.Restaurant.toFirebaseFormatString(),
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

List<Category> _parseCategories(
    List<Query$getRestaurantCategories$restaurant_category> data) {
  final List<Category> categories = [];

  data.forEach((Query$getRestaurantCategories$restaurant_category category) {
    // assigning category
    final Category cat = Category(
      id: category.id,
      position: category.position,
      dialog: (category.description?.translations != null)
          ? toLanguageMap(translations: category.description!.translations)
          : null,
      name: toLanguageMap(translations: category.name.translations),
    );
    // getting alll the items //
    final List<Item> items = category.items
        .map((Query$getRestaurantCategories$restaurant_category$items item) {
      return Item(
          id: item.id,
          nameId: item.name.id,
          image: item.image,
          descriptionId: item.description_id,
          name: toLanguageMap(translations: item.name.translations),
          itemType: item.item_type.toItemType(),
          description: (item.description?.translations != null)
              ? toLanguageMap(translations: item.description!.translations)
              : null,
          cost: item.cost,
          available: item.available);
    }).toList();

    cat.items = items;
    categories.add(cat);
  });
  return categories;
}

Future<bool> update_category_positions({required List<Category> data}) async {
  final QueryResult<Mutation$updateCategoryPositions> res = await _hasuraDb
      .graphQLClient
      .mutate$updateCategoryPositions(Options$Mutation$updateCategoryPositions(
          variables: Variables$Mutation$updateCategoryPositions(
              updates: data.map((Category cat) {
    return Input$restaurant_category_updates(
        where: Input$restaurant_category_bool_exp(
            id: Input$Int_comparison_exp($_eq: cat.id)),
        $_set: Input$restaurant_category_set_input(
          position: cat.position,
        ));
  }).toList())));
  if (res.parsedData?.update_restaurant_category_many == null) {
    throwError(res.exception);
  }
  return true;
}

Future<bool> update_items_positions({required List<Item> data}) async {
  final QueryResult<Mutation$updateItemsPositions> res = await _hasuraDb
      .graphQLClient
      .mutate$updateItemsPositions(Options$Mutation$updateItemsPositions(
          variables: Variables$Mutation$updateItemsPositions(
              updates: data.map((Item item) {
    return Input$restaurant_item_updates(
        where: Input$restaurant_item_bool_exp(
            id: Input$Int_comparison_exp($_eq: item.id)),
        $_set: Input$restaurant_item_set_input(
          position: item.position,
        ));
  }).toList())));
  if (res.parsedData?.update_restaurant_item_many == null) {
    throwError(res.exception);
  }
  return true;
}
