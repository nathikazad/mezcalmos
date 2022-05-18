import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ListRestaurantsController {
  RxList<Restaurant> restaurants = RxList.empty();
  RxList<Restaurant> sortedRestaurants = RxList.empty();
  RxList<Restaurant> searchedRestaurants = RxList.empty();
  RxList<Restaurant> sortedAndSearchedList = RxList.empty();

  RxBool showOnlyOpen = RxBool(false);
  RxBool isSearching = RxBool(false);
  RxBool isLoading = RxBool(false);
  RxBool isSortingAndSearching = RxBool(false);
  RxString searchQuerry = RxString("");
  RestaurantsInfoController _restaurantsInfoController =
      Get.find<RestaurantsInfoController>();

  void init() {
    isLoading.value = true;

    _restaurantsInfoController.getRestaurants().then((List<Restaurant> value) {
      value.forEach((Restaurant element) {
        restaurants.add(element);
      });
      filterRestaurants();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void switchOnlyOpen() {
    if (showOnlyOpen.isFalse) {
      filterRestaurants();
    } else {
      sortedRestaurants.clear();

      showOnlyOpen.value = false;
    }
  }

  void searchRestaurant(String value) {
    if (value.length > 2) {
      isSearching.value = true;
      searchedRestaurants.clear();
      searchQuerry.value = value;
      if (showOnlyOpen.isTrue) {
        isSortingAndSearching.value = true;
        sortedRestaurants.forEach((Restaurant element) {
          if (element.info.name.toLowerCase().contains(value.toLowerCase())) {
            searchedRestaurants.add(element);
          }
        });
      } else {
        restaurants.forEach((Restaurant element) {
          if (element.info.name.toLowerCase().contains(value.toLowerCase())) {
            searchedRestaurants.add(element);
          }
        });
      }
    } else {
      isSearching.value = false;
      isSortingAndSearching.value = false;
      searchedRestaurants.clear();
      // getRightList().forEach((Restaurant element) {
      //   searchedRestaurants.add(element);
      // });
    }
  }

  void filterRestaurants() {
    showOnlyOpen.value = true;
    sortedRestaurants.clear();
    if (isSearching.isTrue) {
      isSortingAndSearching.value = true;
    }

    getRightList().forEach((Restaurant element) {
      sortedRestaurants.add(element);
    });

    sortedRestaurants.sort((Restaurant a, Restaurant b) {
      if (a.isOpen() && !b.isOpen()) {
        return -1;
      } else if (!a.isOpen() && b.isOpen()) {
        return 1;
      } else
        return 0;
    });
  }

  RxList<Restaurant> getRightList() {
    if (isSearching.isTrue) {
      return searchedRestaurants;
    } else {
      return restaurants;
    }
  }

  RxList<Restaurant> getSearchedAndSorted() {
    sortedAndSearchedList.clear();
    searchedRestaurants.forEach((Restaurant element) {
      sortedAndSearchedList.add(element);
    });
    sortedAndSearchedList.sort((Restaurant a, Restaurant b) {
      if (a.isOpen() && !b.isOpen()) {
        return -1;
      } else if (!a.isOpen() && b.isOpen()) {
        return 1;
      } else
        return 0;
    });
    return sortedAndSearchedList;
  }

  RxList<Restaurant> getSortedList() {
    if (showOnlyOpen.isTrue && isSearching.isFalse) {
      return sortedRestaurants;
    } else if (showOnlyOpen.isFalse && isSearching.isTrue) {
      return searchedRestaurants;
    } else if (isSortingAndSearching.isTrue) {
      return getSearchedAndSorted();
    } else if (isSortingAndSearching.isTrue) {
      return getSearchedAndSorted();
    } else {
      return getRightList();
    }
  }
}
