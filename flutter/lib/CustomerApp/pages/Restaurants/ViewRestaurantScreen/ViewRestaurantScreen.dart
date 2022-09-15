import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantGridItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantSliverAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/restaurantInfoTab.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';

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
    mezDbgPrint(restaurant.info.id);
    itemKeys.assign((restaurant.getAvailableCategories.length + 1), "info");
    itemKeys[(restaurant.getAvailableCategories.length + 1)] =
        RectGetter.createGlobalKey();

    tabController = TabController(
        length: restaurant.getAvailableCategories.length, vsync: this);
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
      floatingActionButton: FloatingCartComponent(),
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
      controller: scrollController,
      slivers: [
        RestaurantSliverAppBar(
          restaurant: restaurant,
          tabController: tabController,
          showInfo: showInfo,
          onInfoTap: () {
            setState(() {
              showInfo = !showInfo;
              pauseRectGetterIndex = !pauseRectGetterIndex;
            });
          },
          onTap: (int index) => animateAndScrollTo(index),
          scrollController: scrollController,
        ),
        (showInfo)
            ? SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  RectGetter(
                      key: itemKeys[
                          restaurant.getAvailableCategories.length + 1],
                      child: RestaurantInfoTab(
                        restaurant: restaurant,
                      )),
                ])))
            : _buildCategoriesList()
      ],
    );
  }

  Widget _buildCategoriesList() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            List.generate(_getList().length, (int index) {
              itemKeys[index] = RectGetter.createGlobalKey();
              return _scrollableCategoryItems(index);
            }),
          ),
        ));
  }

  List<Category> _getList() {
    final List<Category> data = restaurant.getAvailableCategories;
    if (restaurant.itemsWithoutCategory.isNotEmpty) {
      data.add(restaurant.getNoCategory!);
    }
    return data;
  }

  Widget _scrollableCategoryItems(
    int index,
  ) {
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
    if (category.getAvailableItems.isNotEmpty) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (category.name?[userLanguage] != null)
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  category.name![userLanguage]!,
                  style: Get.theme.textTheme.headline3
                      ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
              ),
            if (category.dialog?[userLanguage] != null)
              Container(
                child: Text(
                  category.dialog![userLanguage]!,
                  style: Get.textTheme.bodyText2?.copyWith(
                      fontFamily: "Montserrat", color: Colors.grey.shade700),
                ),
              ),
            _buildResturantItems(
                category.getAvailableItems, restaurant.info.id),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );
    } else
      return Container();
  }

  Widget _buildResturantItems(List<Item> items, String restaurantId) {
    if (restaurant.restaurantsView == RestaurantsView.Rows) {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: items.fold<List<Widget>>(<Widget>[],
              (List<Widget> children, Item item) {
            children.add(RestaurantsListOfItemsComponent(
                item: item,
                function: () {
                  Get.toNamed(
                    getItemRoute(restaurantId, item.id!),
                    arguments: {"mode": ViewItemScreenMode.AddItemMode},
                  );
                }));

            return children;
          }),
        ),
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 17),
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(items.length, (int index) {
          return RestaurantgridItemCard(
              item: items[index], restaurant: restaurant);
        }),
      );
    }
  }
}
