import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantSliverAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/restaurantInfoTab.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ViewRestaurantScreen extends StatefulWidget {
  @override
  _ViewRestaurantScreenState createState() => _ViewRestaurantScreenState();
}

class _ViewRestaurantScreenState extends State<ViewRestaurantScreen>
    with SingleTickerProviderStateMixin {
  late AutoScrollController scrollController;
  late TabController tabController;

  late Restaurant restaurant;

  final GlobalKey<RectGetterState> listViewKey = RectGetter.createGlobalKey();

  Map<int, dynamic> itemKeys = {};

  bool pauseRectGetterIndex = false;
  bool showInfo = false;

  @override
  void initState() {
    restaurant = Get.arguments as Restaurant;
    itemKeys.assign(999, "jjjjjj");
    itemKeys[999] = RectGetter.createGlobalKey();

    tabController =
        TabController(length: restaurant.getCategories.length, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

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
    if (pauseRectGetterIndex) return false;
    final int lastTabIndex = tabController.length - 1;
    final List<int> visibleItems = getVisibleItemsIndex();

    final bool reachLastTabIndex =
        visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else {
      final int sumIndex =
          visibleItems.reduce((int value, int element) => value + element);
      final int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex)
        tabController.animateTo(middleIndex);
    }

    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          child: buildSliverScrollView(),
          onNotification: onScrollNotification,
        ),
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      slivers: [
        RestaurantSliverAppBar(
          restaurant: restaurant,
          tabController: tabController,
          showInfo: showInfo,
          onInfoTap: () {
            setState(() {
              showInfo = !showInfo;
              pauseRectGetterIndex = true;
            });
          },
          onTap: (int index) => animateAndScrollTo(index),
          scrollController: scrollController,
        ),
        (showInfo)
            ? SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  RectGetter(
                      key: itemKeys[999],
                      child: RestaurantInfoTab(
                        restaurant: restaurant,
                      )),
                ])))
            : _buildCategoriesList(),
      ],
    );
  }

  Widget _buildCategoriesList() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(_getList().length, (int index) {
            itemKeys[index] = RectGetter.createGlobalKey();
            return _scrollableCategoryItems(index);
          }),
        ),
      ),
    );
  }

  List<Category> _getList() {
    final List<Category> data = restaurant.getCategories;
    if (restaurant.getItemsWithoutCategory != null &&
        restaurant.getItemsWithoutCategory!.isNotEmpty) {
      data.add(restaurant.getNoCategory!);
    }
    return data;
  }

  Widget _scrollableCategoryItems(int index) {
    final Category category = _getList()[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: scrollController,
          child: _buildCategory(category, index)),
    );
  }

  Widget _buildCategory(Category category, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.name?[userLanguage] ?? "",
          style: Get.theme.textTheme.bodyText1,
        ),
        SizedBox(
          height: 5,
        ),
        if (category.dialog?[userLanguage] != null)
          Text(category.dialog![userLanguage]!),
        SizedBox(
          height: 5,
        ),
        _buildResturantItems(category.items, restaurant.info.id),
      ],
    );
  }
}

Widget _buildResturantItems(List<Item> items, String restaurantId) {
  return Column(
    children: items.fold<List<Widget>>(<Widget>[],
        (List<Widget> children, Item item) {
      children.add(RestaurantsListOfItemsComponent(
          item: item,
          function: () {
            Get.toNamed(
              getItemRoute(restaurantId, item.id),
              arguments: {"mode": ViewItemScreenMode.AddItemMode},
            );
          }));
      children.add(SizedBox(
        height: 8,
      ));
      return children;
    }),
  );
}
