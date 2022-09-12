import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

class ListRestaurantsController extends GetxController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RestaurantList _restaurants = List<Restaurant>.empty();

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  num baseShippingPrice = 50;
  RestaurantsInfoController _restaurantsInfoController =
      Get.find<RestaurantsInfoController>();
  @override
  void onInit() {
    isLoading.value = true;
    getShiipingPrice();
    _restaurantsInfoController.getRestaurants().then((List<Restaurant> list) {
      _restaurants = list;
      filterRestaurants();
    }).whenComplete(() {
      isLoading.value = false;
    });
    print("ListRestaurantsController all good ✅");
    super.onInit();
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  getShiipingPrice() async {
    baseShippingPrice = await _restaurantsInfoController.getShippingPrice();
  }

  void filterRestaurants() {
    RestaurantList newList = new RestaurantList.from(_restaurants);
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
    if (search.length > 2)
      return where((Restaurant restaurant) =>
              restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    else
      return this;
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
