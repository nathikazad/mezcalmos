import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

class ListRestaurantsController {
  Rx<UserInteraction> userInteractin = Rx(UserInteraction.Nothing);
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
      if (isSearching.isTrue) {
        userInteractin.value = UserInteraction.isSearching;
      } else {
        userInteractin.value = UserInteraction.Nothing;
      }
    }
  }

  void searchRestaurant(String value) {
    if (value.length > 2) {
      isSearching.value = true;
      searchedRestaurants.clear();
      searchQuerry.value = value;
      if (showOnlyOpen.isTrue) {
        userInteractin.value = UserInteraction.isSearchingAndSorting;
        isSortingAndSearching.value = true;
        sortedRestaurants.forEach((Restaurant element) {
          if (element.info.name.toLowerCase().contains(value.toLowerCase())) {
            searchedRestaurants.add(element);
          }
        });
      } else {
        userInteractin.value = UserInteraction.isSearching;
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
      if (showOnlyOpen.isTrue) {
        userInteractin.value = UserInteraction.isSorting;
      } else {
        userInteractin.value = UserInteraction.Nothing;
      }
      // getRightList().forEach((Restaurant element) {
      //   searchedRestaurants.add(element);
      // });
    }
  }

  void filterRestaurants() {
    showOnlyOpen.value = true;
    sortedRestaurants.clear();
    if (isSearching.isTrue) {
      userInteractin.value = UserInteraction.isSearchingAndSorting;
    } else {
      userInteractin.value = UserInteraction.isSorting;
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

  RxList<Restaurant> getData() {
    switch (userInteractin.value) {
      case UserInteraction.Nothing:
        return restaurants;
      case UserInteraction.isSearching:
        return searchedRestaurants;
      case UserInteraction.isSorting:
        return sortedRestaurants;
      case UserInteraction.isSearchingAndSorting:
        return getSearchedAndSorted();
      default:
        return restaurants;
    }
  }
}
