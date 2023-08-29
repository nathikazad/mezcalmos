import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

class CustHomeViewController {
  late TabController tabController;
  RxList<Restaurant> _restaurants = RxList.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];

  int fetchSize = 10;
  int offset = 0;
  bool _hasReachedEndData = false;
  RxBool isFetchingRestaurants = RxBool(false);
  RxBool isFetchingItems = RxBool(false);

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(false);

  RxString searchQuery = RxString("");

  LocationData? customerLocation;

  List<Restaurant> get restaurants => filteredRestaurants.value;
  List<Item> get items => filteredItems.value;
  bool get showRestaurantShimmer =>
      isFetchingRestaurants.value && restaurants.isEmpty;
  bool get showIemsShimmer => isFetchingItems.value;
  Future<void> init({required TickerProvider vsync}) async {
    _initTabController(vsync);
    await fetchRestaurants().then((value) => filter());
  }

  void _initTabController(TickerProvider vsync) {
    tabController = TabController(length: 2, vsync: vsync);
    tabController.addListener(() {
      if (tabController.index == 0) {
        searchType.value = SearchType.searchByRestaurantName;
      } else {
        searchType.value = SearchType.searchByItemName;
      }
      filter();
    });
  }

  Future<void> fetchRestaurants() async {
    if (_hasReachedEndData || isFetchingRestaurants.isTrue) {
      return;
    }
    try {
      isFetchingRestaurants.value = true;
      mezDbgPrint("Fetching new restaurants ...");
      List<Restaurant> newData = await fetch_restaurants(
          is_open: showOnlyOpen.value,
          withCache: false,
          distance: 10000000000000000000,
          limit: fetchSize,
          offset: offset,
          fromLocation: puertoEscondidoLocation);

      _restaurants += newData;

      if (newData.length == 0) {
        _hasReachedEndData = true;
      }
      offset += fetchSize;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isFetchingRestaurants.value = false;
    }
  }

  Future<void> filter() async {
    // _filterInput.clear();

    // changeAlwaysOpenSwitch(
    //     newData['restaurantOpened']?.contains('true') ?? false);
    // mezDbgPrint("_filterInput $_filterInput $newData");
    //   _fetchRestaurantsOnFilter();

    List<Restaurant> newList = new List<Restaurant>.from(_restaurants);
    if (searchType.value == SearchType.searchByRestaurantName) {
      newList = newList.searchByName(searchQuery.value) as List<Restaurant>;
      newList = newList.showOnlyOpen(showOnlyOpen.value) as List<Restaurant>;
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    } else {
      servicesIds = newList
          .map<int>(
            (Restaurant e) => e.info.hasuraId,
          )
          .toList();
      await _searchItem();
    }
  }

  Future<void> _searchItem() async {
    try {
      isFetchingItems.value = true;
      filteredItems.value = await search_items(
          servicesIds: servicesIds,
          keyword: searchQuery.value,
          lang: userLanguage,
          withCache: false);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      isFetchingItems.value = false;
    }
  }

  void switchOnlyOpen({required bool value}) {
    showOnlyOpen.value = value;
  }
}

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }
