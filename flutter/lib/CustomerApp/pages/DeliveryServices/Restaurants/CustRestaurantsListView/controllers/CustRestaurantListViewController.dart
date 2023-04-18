import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class CustRestaurantListViewController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];

  List<Restaurant> _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  void init() {
    isLoading.value = true;

    fetch_restaurants(withCache: false).then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      filter();
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void _getCustomerCurrentLocation() {
    Location()
        .getLocation()
        .then((LocationData value) => customerLocation = value);
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
    List<Restaurant> newList = new List<Restaurant>.from(_restaurants);
    if (searchType.value == SearchType.searchByRestaurantName) {
      newList = newList
          .searchByName(searchQuery.value)
          .showOnlyOpen(showOnlyOpen.value) as List<Restaurant>;
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    } else {
      servicesIds = newList
          .showOnlyOpen(showOnlyOpen.value)
          .map(
            (Service e) => e.info.hasuraId,
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
