import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class ListRestaurantsController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  RestaurantList _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  num baseShippingPrice = 50;
  RestaurantsInfoController _restaurantsInfoController =
      Get.put(RestaurantsInfoController());
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  void dispose() {
    Get.delete<RestaurantsInfoController>();
  }

  void init() {
    isLoading.value = true;
    getShippingPrice();
    _restaurantsInfoController.getRestaurants().then((List<Restaurant> list) {
      _restaurants = list;
      getAllItems();
      filter();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  Future<void> getShippingPrice() async {
    baseShippingPrice = await _restaurantsInfoController.getShippingPrice();
  }

  void filter() {
    RestaurantList newList = new RestaurantList.from(_restaurants);
    if (searchType == SearchType.searchByItemName) {
      newList
          .showOnlyOpen(showOnlyOpen.value)
          .searchForFood(searchQuery.value)
          .forEach((Item element) => mezDbgPrint(element.name[userLanguage]));
      filteredItems.value = newList
          .showOnlyOpen(showOnlyOpen.value)
          .searchForFood(searchQuery.value);
    } else {
      newList = newList
          .searchByName(searchQuery.value)
          .showOnlyOpen(showOnlyOpen.value);
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    }
  }

  void switchSearchType(SearchType value) {
    searchType.value = value;
  }

  bool get showFilters {
    return searchQuery.value.length > 0;
  }

  bool get byRestaurants {
    return searchType.value == SearchType.searchByRestaurantName;
  }

  void getAllItems() {
    _restaurants.forEach((Restaurant restaurant) {
      restaurant.itemsWithoutCategory.forEach((Item item) {
        final Item _item = item;
        _item.restaurant = restaurant;
        if (item.available) {
          filteredItems.add(_item);
        }
      });
      // filteredItems.addAll(element.itemsWithoutCategory);
      restaurant.getAvailableCategories.forEach((Category cat) {
        cat.items.forEach((Item item) {
          final Item _item = item;
          _item.restaurant = restaurant;
          if (item.available) {
            filteredItems.add(_item);
          }
        });
      });
    });
  }
}

typedef RestaurantList = List<Restaurant>;

extension RestaurantFilters on RestaurantList {
  RestaurantList searchByName(String search) {
    return where((Restaurant restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Item> searchForFood(String search) {
    return fold<List<Category>>(<Category>[],
        (List<Category> categories, Restaurant restaurant) {
      final List<Category> restaurantCategories =
          restaurant.getAvailableCategories;
      restaurantCategories
          .forEach((Category category) => category.restaurant = restaurant);
      categories.addAll(restaurantCategories);
      return categories;
    }).fold<List<Item>>(<Item>[], (List<Item> items, Category category) {
      final List<Item> categoryItems = category.getItems;
      categoryItems.forEach((Item item) {
        item.restaurant = category.restaurant;
        item.category = category;
        if (item.restaurant?.info.hasuraId.toString() != null &&
            item.id != null)
          item.linkUrl =
              getItemRoute(item.restaurant!.info.hasuraId.toString(), item.id!);
      });
      items.addAll(categoryItems);
      return items;
    }).where((Item item) {
      for (LanguageType languageType in LanguageType.values) {
        if (item.name[languageType]
                ?.toLowerCase()
                .contains(search.toLowerCase()) ??
            false) return true;
        if (item.category?.name?[languageType]
                ?.toLowerCase()
                .contains(search.toLowerCase()) ??
            false) return true;
      }
      return false;
    }).toList();
  }

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
