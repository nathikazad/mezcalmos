import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomerRestaurantController {
  // controllers //
  late AutoScrollController scrollController;

  late TabController tabsController;
  late TabController specialstabsController;
  // keys //
  final GlobalKey<RectGetterState> listViewKey = RectGetter.createGlobalKey();

  // obs //
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxBool showInfo = RxBool(false);
  Rx<RestaurantViewTab> mainTab = Rx<RestaurantViewTab>(RestaurantViewTab.Menu);
  Map<int, dynamic> itemKeys = {};
  RxBool pauseRectGetterIndex = RxBool(false);

  void init({required Restaurant restaurant, required TickerProvider vsync}) {
    this.restaurant.value = restaurant;
    _initControllers(vsync, restaurant);
    assignKeys();
  }

  void assignKeys() {
    if (isOnMenuView) {
      itemKeys.assign((restaurant.value!.getCategories.length + 1), "info");
      itemKeys[(restaurant.value!.getCategories.length + 1)] =
          RectGetter.createGlobalKey();
    } else {
      itemKeys.assign((getGroupedSpecials().length + 1), "info");
      itemKeys[(getGroupedSpecials().length + 1)] =
          RectGetter.createGlobalKey();
    }
  }

  void _initControllers(TickerProvider vsync, Restaurant restaurant) {
    tabsController =
        TabController(length: restaurant.getCategories.length, vsync: vsync);
    specialstabsController =
        TabController(length: getGroupedSpecials().length, vsync: vsync);

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
    final int lastTabIndex = getTabController.length - 1;
    final List<int> visibleItems = getVisibleItemsIndex();

    final bool reachLastTabIndex =
        visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      getTabController.animateTo(lastTabIndex);
      pauseRectGetterIndex.value = true;
    } else {
      final int sumIndex =
          visibleItems.reduce((int value, int element) => value + element);
      final int middleIndex = sumIndex ~/ visibleItems.length;
      if (getTabController.index != middleIndex)
        getTabController.animateTo(middleIndex);
    }

    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex.value = true;
    getTabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .whenComplete(() => pauseRectGetterIndex.value = false);
  }

  // methods //
  void onInfoTap() {
    if (showInfo.isFalse) {
      showInfo.value = true;
      pauseRectGetterIndex.value = !pauseRectGetterIndex.value;
    } else {
      showInfo.value = false;
      pauseRectGetterIndex.value = !pauseRectGetterIndex.value;
    }
  }

  Map<DateTime, List<Item>> getGroupedSpecials() {
    // Creating the map

    final Map<DateTime, List<Item>> data = restaurant.value!.currentSpecials
        .where((Item element) =>
            element.available &&
            (element.endsAt!.toLocal().isAfter(DateTime.now().toLocal()) ||
                element.endsAt!
                    .toLocal()
                    .isAtSameMomentAs(DateTime.now().toLocal())))
        .groupListsBy((Item element) => DateTime(
            element.startsAt!.toLocal().year,
            element.startsAt!.toLocal().month,
            element.startsAt!.toLocal().day));
    // sorting the map
    final SplayTreeMap<DateTime, List<Item>> sortedMap =
        SplayTreeMap<DateTime, List<Item>>.from(data,
            (DateTime a, DateTime b) => a.toLocal().compareTo(b.toLocal()));

    return sortedMap;
  }

  // getters //
  bool get isOnSpecialView {
    return mainTab.value == RestaurantViewTab.Specials;
  }

  bool get showMenuTabs {
    return isOnMenuView && showCategoriesChips && showInfo.isFalse;
  }

  bool get showSpecialTabs {
    return isOnSpecialView && showSpecials && showInfo.isFalse;
  }

  bool get isOnMenuView {
    return mainTab.value == RestaurantViewTab.Menu;
  }

  List<Category> get catsList {
    final List<Category> data = restaurant.value!.getCategories;
    if (restaurant.value!.itemsWithoutCategory.isNotEmpty) {
      data.add(restaurant.value!.getNoCategory!);
    }
    return data;
  }

  bool get showSpecials {
    return getGroupedSpecials().isNotEmpty;
  }

  bool get showCategoriesChips {
    return restaurant.value!.getCategories.length > 1 && showInfo.isFalse;
  }

  TabController get getTabController {
    if (isOnMenuView) {
      return tabsController;
    } else {
      return specialstabsController;
    }
  }

  void dispose() {
    scrollController.dispose();

    tabsController.dispose();
  }
}

enum RestaurantViewTab { Menu, Specials }
