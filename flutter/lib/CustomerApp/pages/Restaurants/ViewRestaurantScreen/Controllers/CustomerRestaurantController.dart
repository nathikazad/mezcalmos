import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomerRestaurantController {
  // controllers //
  late AutoScrollController scrollController;
  late TabController mainTabsController;
  late TabController categoriesTabsController;
  // keys //
  final GlobalKey<RectGetterState> listViewKey = RectGetter.createGlobalKey();

  // obs //
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxBool showInfo = RxBool(false);
  Map<int, dynamic> itemKeys = {};
  RxBool pauseRectGetterIndex = RxBool(false);

  void init({required Restaurant restaurant, required TickerProvider vsync}) {
    this.restaurant.value = restaurant;
    _initControllers(vsync, restaurant);
    _assignKeys(restaurant);
  }

  void _assignKeys(Restaurant restaurant) {
    itemKeys.assign((restaurant.getCategories.length + 1), "info");
    itemKeys[(restaurant.getCategories.length + 1)] =
        RectGetter.createGlobalKey();
  }

  void _initControllers(TickerProvider vsync, Restaurant restaurant) {
    mainTabsController = TabController(length: 2, vsync: vsync);
    categoriesTabsController =
        TabController(length: restaurant.getCategories.length, vsync: vsync);
    scrollController = AutoScrollController();
  }

  // scroll methods //

  List<int> getVisibleItemsIndex() {
    final Rect? rect = RectGetter.getRectFromKey(listViewKey);
    final List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((int index, key) {
      final Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex.value) return false;
    final int lastTabIndex = categoriesTabsController.length - 1;
    final List<int> visibleItems = getVisibleItemsIndex();

    final bool reachLastTabIndex =
        visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      categoriesTabsController.animateTo(lastTabIndex);
    } else {
      final int sumIndex =
          visibleItems.reduce((int value, int element) => value + element);
      final int middleIndex = sumIndex ~/ visibleItems.length;
      if (categoriesTabsController.index != middleIndex)
        categoriesTabsController.animateTo(middleIndex);
    }

    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex.value = true;
    categoriesTabsController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .whenComplete(() => pauseRectGetterIndex.value = false);
  }

  // methods //
  void onInfoTap() {
    showInfo.value = true;
    pauseRectGetterIndex.value = !pauseRectGetterIndex.value;
  }

  // getters //

  List<Category> get catsList {
    final List<Category> data = restaurant.value!.getCategories;
    if (restaurant.value!.itemsWithoutCategory.isNotEmpty) {
      data.add(restaurant.value!.getNoCategory!);
    }
    return data;
  }

  bool get showSpecials {
    return restaurant.value!.currentSpecials.isNotEmpty;
  }

  bool get showCategoriesChips {
    return restaurant.value!.getCategories.length > 1 && showInfo.isFalse;
  }

  void dispose() {
    scrollController.dispose();
    mainTabsController.dispose();
    categoriesTabsController.dispose();
  }
}
