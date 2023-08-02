import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/category/hsCategory.dart';
import 'package:mezcalmos/Shared/graphql/feed/hsFeed.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Post.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomerRestaurantViewController {
  // controllers //
  late AutoScrollController scrollController;

  late TabController mainTabController;

  late TabController categoriesTabController;
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

  AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;

  RxList<Post> _posts = RxList.empty();
  List<Post> get posts => _posts.value;

  RxList<int> _subscribers = RxList.empty();
  List<int> get subscribers => _subscribers.value;

  RxBool get _isSubscribed =>
      _subscribers.contains(_authController.user?.hasuraId).obs;
  bool get isSubscribed => _isSubscribed.value;

  RxList<Post> _gridImages = RxList.empty();
  List<Post> get gridImages => _gridImages.value;

  bool get isInitialzed {
    return _initialized.value;
  }

  RxInt currentSelectedIndex = RxInt(0);

  Future<void> init(
      {required int restaurantId, required TickerProvider vsync}) async {
    scrollController = AutoScrollController();
    mainTabController = TabController(length: 3, vsync: vsync);

    restaurant.value = await get_restaurant_by_id(id: restaurantId);
    mezDbgPrint(
        "Restaurant ⌛️ cats ======>${restaurant.value?.getAvailableCategories.length}");
    _initControllers(vsync);
    assignKeys();
    unawaited(get_service_reviews(
            serviceId: restaurantId,
            serviceProviderType: cModels.ServiceProviderType.Restaurant)
        .then((List<Review>? value) {
      if (value != null) {
        restaurant.value!.reviews = value;
      }
    }));
    unawaited(get_service_review_average(
            serviceId: restaurantId,
            serviceProviderType: cModels.ServiceProviderType.Restaurant)
        .then((num? value) {
      if (value != null) {
        restaurant.value!.rate = value;
      }
    }));

    unawaited(_fetchPosts());
    unawaited(_fetchGridImages());

    await _getShippingPrice();

    await _fetchSubscriptions();

    final List<Category>? _cats =
        await get_restaurant_categories_by_id(restaurantId);
    specials.value = await get_restaurant_special_items(restaurantId);
    final List<Item> noCat =
        await get_restaurant_items_without_cat(restaurantId);
    noCategory.value.items = noCat
        .where((Item element) =>
            element.available == true &&
            element.itemType == cModels.ItemType.Daily)
        .toList();

    if (_cats != null) {
      restaurant.value?.setCategories(_cats);
      restaurant.refresh();
    }

    _initialized.value = true;
  }

  Future<void> _getShippingPrice() async {
    basShippingPrice.value = 50;
  }

  void assignKeys() {
    if (isOnMenuView) {
      itemKeys.assign((restaurant.value!.getCategories.length + 1), "noCat");
      itemKeys[(restaurant.value!.getCategories.length + 1)] =
          RectGetter.createGlobalKey();
    }
  }

  void _initControllers(TickerProvider vsync) {
    categoriesTabController = TabController(
        length: restaurant.value!.getAvailableCategories.length, vsync: vsync);
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
    if (pauseRectGetterIndex.value || mainTabController.index != 0)
      return false;
    final int lastTabIndex = listLength - 1;
    final List<int> visibleItems = getVisibleItemsIndex();
    if (visibleItems.isEmpty) {
      return false;
    }
    final bool reachLastTabIndex =
        visibleItems.length <= 1 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      //   getTabController.animateTo(lastTabIndex);
      currentSelectedIndex.value = lastTabIndex;
      pauseRectGetterIndex.value = true;
    } else {
      final int sumIndex =
          visibleItems.reduce((int value, int element) => value + element);
      final int middleIndex = sumIndex ~/ visibleItems.length;
      if (getTabController.index != middleIndex)
        //   getTabController.animateTo(middleIndex);

        currentSelectedIndex.value = middleIndex;
    }

    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex.value = true;
    //  getTabController.animateTo(index);

    currentSelectedIndex.value = index;
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
    return restaurant.value != null &&
        isOnMenuView &&
        showCategoriesChips &&
        showInfo.isFalse;
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
        mainTabController.index == 0;
  }

  TabController get getTabController {
    if (isOnMenuView) {
      return categoriesTabController;
    } else {
      return specialstabsController;
    }
  }

  Future<void> _fetchPosts() async {
    try {
      _posts.value = await fetch_service_provider_posts(
          imagesOnly: false,
          serviceProviderId: restaurant.value!.restaurantId,
          serviceProviderType: cModels.ServiceProviderType.Restaurant);
    } catch (e) {
    } finally {}
  }

  Future<void> _fetchGridImages() async {
    try {
      _gridImages.value = await fetch_service_provider_posts(
          imagesOnly: true,
          serviceProviderId: restaurant.value!.restaurantId,
          serviceProviderType: cModels.ServiceProviderType.Restaurant);
    } catch (e) {
    } finally {}
  }

  Future<void> writeComment(
      {required int postId,
      required TextEditingController commentController}) async {
    if (commentController.text.isEmpty) return;

    commentController.text = '';
    await write_comment(
        userId: _authController.hasuraUserId!,
        postId: postId,
        commentMsg: commentController.text);
  }

  Future<void> likePost(
    Post post,
  ) async {
    final List<int> likes = post.likes;

    if (likes.contains(_authController.user!.hasuraId)) {
      likes.remove(_authController.user!.hasuraId);
    } else {
      likes.add(_authController.user!.hasuraId);
    }
    await update_post_likes(postId: post.id, likes: likes);
  }

  bool _canSubscribe = true;
  Future<void> subscribe() async {
    if (!_canSubscribe) return;

    _canSubscribe = false;

    await _fetchSubscriptions();

    if (_subscribers.contains(_authController.user?.hasuraId)) {
      await unsubscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: restaurant.value!.restaurantId,
          serviceProviderType: cModels.ServiceProviderType.Restaurant);
    } else {
      await subscribe_service_provider(
          customerId: _authController.user!.hasuraId,
          serviceProviderId: restaurant.value!.restaurantId,
          serviceProviderType: cModels.ServiceProviderType.Restaurant);
    }
    _isSubscribed.refresh();
    _canSubscribe = true;
  }

  Future<void> _fetchSubscriptions() async {
    _subscribers.value = await fetch_subscribers(
        serviceProviderId: restaurant.value!.restaurantId,
        serviceProviderType: cModels.ServiceProviderType.Restaurant);
  }

  void dispose() {
    scrollController.dispose();

    categoriesTabController.dispose();
  }

  int get listLength {
    if (isOnMenuView) {
      return restaurant.value!.getAvailableCategories.length;
    } else {
      return getGroupedSpecials().length;
    }
  }
}

enum RestaurantViewTab { Menu, Specials }
