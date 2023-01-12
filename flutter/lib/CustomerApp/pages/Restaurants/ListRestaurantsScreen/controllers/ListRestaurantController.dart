import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class ListRestaurantsController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];

  RestaurantList _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  void init() {
    isLoading.value = true;

    fetch_restaurants(withCache: false).then((List<Restaurant> list) {
      _restaurants = list;
      _assignServiceIds();
      filter();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  void _assignServiceIds() {
    servicesIds = _restaurants
        .where((Restaurant element) => element.isOpen())
        .map((Restaurant e) => e.info.hasuraId)
        .toList();
  }

  void filter() {
    RestaurantList newList = new RestaurantList.from(_restaurants);
    if (searchType.value == SearchType.searchByRestaurantName) {
      newList = newList
          .searchByName(searchQuery.value)
          .showOnlyOpen(showOnlyOpen.value);
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    } else {
      servicesIds = newList
          .showOnlyOpen(showOnlyOpen.value)
          .map(
            (Restaurant e) => e.info.hasuraId,
          )
          .toList();
      _searchItem();
    }
  }

  void switchSearchType(SearchType value) {
    searchType.value = value;
    filter();
  }

  bool get showFilters {
    return searchQuery.value.length > 0 ||
        searchType.value == SearchType.searchByItemName;
  }

  bool get byRestaurants {
    return searchType.value == SearchType.searchByRestaurantName;
  }

  Future<void> _searchItem() async {
    filteredItems.value = await search_items(
        servicesIds: servicesIds,
        keyword: searchQuery.value,
        lang: userLanguage,
        withCache: false);

    // _restaurants.forEach((Restaurant restaurant) {
    //   restaurant.itemsWithoutCategory.forEach((Item item) {
    //     final Item _item = item;
    //     _item.restaurant = restaurant;
    //     if (item.available) {
    //       filteredItems.add(_item);
    //     }
    //   });
    //   // filteredItems.addAll(element.itemsWithoutCategory);
    //   restaurant.getAvailableCategories.forEach((Category cat) {
    //     cat.items.forEach((Item item) {
    //       final Item _item = item;
    //       _item.restaurant = restaurant;
    //       if (item.available) {
    //         filteredItems.add(_item);
    //       }
    //     });
    //   });
    // });
  }
}

typedef RestaurantList = List<Restaurant>;

extension RestaurantFilters on RestaurantList {
  RestaurantList searchByName(String search) {
    return where((Restaurant restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  // List<Item> searchForFood(String search) {
  //   return fold<List<Category>>(<Category>[],
  //       (List<Category> categories, Restaurant restaurant) {
  //     final List<Category> restaurantCategories =
  //         restaurant.getAvailableCategories;
  //     restaurantCategories
  //         .forEach((Category category) => category.restaurant = restaurant);
  //     categories.addAll(restaurantCategories);
  //     return categories;
  //   }).fold<List<Item>>(<Item>[], (List<Item> items, Category category) {
  //     final List<Item> categoryItems = category.getItems;
  //     categoryItems.forEach((Item item) {
  //       item.restaurant = category.restaurant;
  //       item.category = category;
  //       if (item.restaurant?.info.hasuraId.toString() != null &&
  //           item.id != null)
  //         item.linkUrl =
  //             getItemRoute(item.restaurant!.info.hasuraId.toString(), item.id!);
  //     });
  //     items.addAll(categoryItems);
  //     return items;
  //   }).where((Item item) {
  //     for (LanguageType languageType in LanguageType.values) {
  //       if (item.name[languageType]
  //               ?.toLowerCase()
  //               .contains(search.toLowerCase()) ??
  //           false) return true;
  //       if (item.category?.name?[languageType]
  //               ?.toLowerCase()
  //               .contains(search.toLowerCase()) ??
  //           false) return true;
  //     }
  //     return false;
  //   }).toList();
  // }

  RestaurantList showOnlyOpen(bool value) {
    if (value == true) {
      return where((Restaurant restaurant) => restaurant.isOpen() == true)
          .toList();
    } else {
      return this;
    }
  }

  void sortByOpen() {
    sort((Restaurant a, Restaurant b) {
      if (a.isOpen() && !b.isOpen()) {
        return -1;
      } else if (!a.isOpen() && b.isOpen()) {
        return 1;
      } else
        return 0;
    });
  }
}
