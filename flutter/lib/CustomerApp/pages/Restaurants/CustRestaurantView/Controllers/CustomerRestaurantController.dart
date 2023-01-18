import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ItemType.dart';
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
  Rx<Category> noCategory = Rx<Category>(Category());
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxNum basShippingPrice = RxNum(50);
  RxBool showInfo = RxBool(false);
  Rx<RestaurantViewTab> mainTab = Rx<RestaurantViewTab>(RestaurantViewTab.Menu);
  Map<int, dynamic> itemKeys = {};
  RxBool pauseRectGetterIndex = RxBool(false);
  RxList<Item> specials = RxList.empty();
  RxBool _initialized = RxBool(false);
  bool get isInitialzed {
    return _initialized.value;
  }

  Future<void> init(
      {required Restaurant restaurant, required TickerProvider vsync}) async {
    scrollController = AutoScrollController();
    this.restaurant.value = restaurant;
    await _getShippingPrice();
    // var cat = Category(
    //   name: <LanguageType,String>{LanguageType.EN:"test",LanguageType.ES:"test2"},
    //    id:2,
    //    descriptionId:4,
    //    nameId:3,

    // );
    final List<Category>? _cats =
        await get_restaurant_categories_by_id(restaurant.info.hasuraId);
    specials.value =
        await get_restaurant_special_items(restaurant.info.hasuraId);
    final List<Item> noCat =
        await get_restaurant_items_without_cat(restaurant.info.hasuraId);
    noCategory.value.items = noCat
        .where((Item element) =>
            element.available == true && element.itemType == ItemType.Daily)
        .toList();

    if (_cats != null) {
      this.restaurant.value?.setCategories(_cats);

      this.restaurant.refresh();
    }
    _initControllers(vsync, restaurant);
    assignKeys();
    _initialized.value = true;
  }

  Future<void> _getShippingPrice() async {
    basShippingPrice.value = 50;
  }

  /// i use this function for fetching restaurant

  Future<void> webInit({required int id, required TickerProvider vsync}) async {
    scrollController = AutoScrollController();
    this.restaurant.value = await get_restaurant_by_id(id: id);
    mezDbgPrint(
        "the restaurant value is  ${restaurant.value} 🌯🌯🌯🌯🌯🌯🌯🌯");
    await _getShippingPrice();
    final List<Category>? _cats =
        await get_restaurant_categories_by_id(restaurant.value!.info.hasuraId);
    specials.value =
        await get_restaurant_special_items(restaurant.value!.info.hasuraId);
    final List<Item> noCat =
        await get_restaurant_items_without_cat(restaurant.value!.info.hasuraId);
    noCategory.value.items = noCat
        .where((Item element) =>
            element.available == true && element.itemType == ItemType.Daily)
        .toList();

    if (_cats != null) {
      this.restaurant.value?.setCategories(_cats);

      this.restaurant.refresh();
    }
    _initControllers(vsync, restaurant.value!);
    assignKeys();
    _initialized.value = true;
  }

  void assignKeys() {
    if (isOnMenuView) {
      itemKeys.assign((restaurant.value!.getCategories.length + 1), "noCat");
      itemKeys[(restaurant.value!.getCategories.length + 1)] =
          RectGetter.createGlobalKey();
    }
  }

  void _initControllers(TickerProvider vsync, Restaurant restaurant) {
    tabsController = TabController(
        length: restaurant.getAvailableCategories.length, vsync: vsync);
    specialstabsController =
        TabController(length: getGroupedSpecials().length, vsync: vsync);
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

    final Map<DateTime, List<Item>> data = specials.value
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
    final List<Category> data = restaurant.value!.getAvailableCategories;

    if (noCategory.value.items.isNotEmpty) {
      data.add(noCategory.value);
    }
    return data;
  }

  bool get showSpecials {
    return getGroupedSpecials().isNotEmpty;
  }

  bool get showCategoriesChips {
    return restaurant.value!.getAvailableCategories.length > 1 &&
        showInfo.isFalse;
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
