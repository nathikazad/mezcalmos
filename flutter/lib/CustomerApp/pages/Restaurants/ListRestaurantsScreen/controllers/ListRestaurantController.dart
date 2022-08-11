import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

class ListRestaurantsController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RestaurantList _restaurants = List<Restaurant>.empty();

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  num baseShippingPrice = 50;
  RestaurantsInfoController _restaurantsInfoController =
      Get.find<RestaurantsInfoController>();

  void init() {
    isLoading.value = true;
    getShiipingPrice();
    _restaurantsInfoController.getRestaurants().then((List<Restaurant> list) {
      _restaurants = list;
      filterRestaurants();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  getShiipingPrice() async {
    baseShippingPrice = await _restaurantsInfoController.getShippingPrice();
  }

  void filterRestaurants() {
    RestaurantList newList = new RestaurantList.from(_restaurants);
    newList.searchForFood(searchQuery.value, LanguageType.EN);
    // .forEach((element) => mezDbgPrint(element.name[LanguageType.EN]));
    newList = newList
        .searchByName(searchQuery.value)
        .showOnlyOpen(showOnlyOpen.value);
    newList.sortByOpen();
    filteredRestaurants.value = newList;
  }
}

typedef RestaurantList = List<Restaurant>;

extension RestaurantFilters on RestaurantList {
  RestaurantList searchByName(String search) {
    return where((Restaurant restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Item> searchForFood(String search, LanguageType languageType) {
    final List<Category> cats = fold<List<Category>>(<Category>[],
        (List<Category> categories, Restaurant restaurant) {
      final List<Category> restaurantCategories = restaurant.getCategories;
      categories.forEach(
          (Category category) => category.restaurantId = restaurant.info.id);
      categories.addAll(restaurantCategories);
      return categories;
    });
    List<Item> allItems = [];
    allItems = cats
        .fold<List<Item>>(<Item>[], (List<Item> items, Category category) {
          final List<Item> items = category.getItems;
          items.forEach(
              (Item item) => item.restaurantId = category.restaurantId);
          items.forEach((Item item) {
            item.categoryId = category.id;
          });
          // items.addAll(category.getItems);
          return items;
        })
        .where(
            (Item item) => item.name[languageType]?.contains(search) ?? false)
        .toList();
    return allItems;
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
