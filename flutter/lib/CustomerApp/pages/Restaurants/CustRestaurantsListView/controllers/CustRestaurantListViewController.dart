import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class CustRestaurantListViewController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];

  RestaurantList _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  late LocationData customerLocation;

  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  void init() {
    isLoading.value = true;

    fetch_restaurants(withCache: false).then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      filter();
    }).whenComplete(() {
      Get.find<CustomerAuthController>()
          .getCustomerCurrentLocation()
          .then((value) {
        customerLocation = value;
        isLoading.value = false;
        mezDbgPrint(
            "List from view :================>${filteredRestaurants.length}");
      });
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
  }

  void dispose() {
    isLoading.value = false;
  }
}

typedef RestaurantList = List<Restaurant>;

extension RestaurantFilters on RestaurantList {
  RestaurantList searchByName(String search) {
    return where((Restaurant restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  RestaurantList showOnlyOpen(bool value) {
    if (value == true) {
      return where((Restaurant restaurant) => restaurant.isOpen() == true)
          .toList();
    } else {
      return where((Restaurant restaurant) =>
          restaurant.state.isClosedIndef == false).toList();
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
