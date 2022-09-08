import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/RestaurantGridItemCard.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/RestaurantListItemComponent.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreen/components/RestaurantSliverAppbar.dart';
import 'package:mez_services_web_app/screens/viewRestaurantsScreenInfo/components/restaurantInfoTabForMobile.dart';
import 'package:qlevar_router/qlevar_router.dart';
//import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';

import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ViewRestaurantScreenFroMobile extends StatefulWidget {
  final bool? isRunningOnWeb;
  final Restaurant? restaurant;
  ViewRestaurantScreenFroMobile({this.isRunningOnWeb = false, this.restaurant});
  @override
  _ViewRestaurantScreenFroMobileState createState() =>
      _ViewRestaurantScreenFroMobileState();
}

class _ViewRestaurantScreenFroMobileState
    extends State<ViewRestaurantScreenFroMobile>
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
    // restaurant = Get.arguments[0] as Restaurant??WidgetOrderTraversalPolicy();

    itemKeys.assign(999999, "info");
    itemKeys[999999] = RectGetter.createGlobalKey();

    scrollController = AutoScrollController();
    super.initState();
  }

  Future<Restaurant?> getRestaurants() async {
    return await Get.find<RestaurantsInfoController>()
        .getRestaurant("${QR.params['id'].toString()}")
        .then((value) {
      if (value != null) {
        restaurant = value;
        tabController =
            TabController(length: restaurant.getCategories.length, vsync: this);
      }
      return value;
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    print("==================> test <====================");
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
    return FutureBuilder<Restaurant?>(
        future: getRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.hasData || snapshot.data != null) {
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
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget buildSliverScrollView() {
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        //physics: const ClampingScrollPhysics(),
        controller: scrollController,
        slivers: [
          RestaurantSliverAppBar(
            restaurant: restaurant,
            isRunningOnWeb: widget.isRunningOnWeb,
            tabController: tabController,
            showInfo: showInfo,
            onInfoTap: () {
              setState(() {
                showInfo = !showInfo;
                QR.to("${QR.currentPath}/info");
                pauseRectGetterIndex = !pauseRectGetterIndex;
              });
            },
            onTap: (int index) => animateAndScrollTo(index),
            scrollController: scrollController,
          ),
          _buildCategoriesList(),
        ],
      );
    });
  }

  Widget _buildCategoriesList() {
    return SliverPadding(
        padding: const EdgeInsets.all(12),
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
    final List<Category> data = restaurant.getCategories;
    if (restaurant.getItemsWithoutCategory != null &&
        restaurant.getItemsWithoutCategory!.isNotEmpty) {
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
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildResturantItems(List<Item> items, String restaurantId) {
    if (restaurant.restaurantsView == RestaurantsView.Rows) {
      return Column(
        children: items.fold<List<Widget>>(<Widget>[],
            (List<Widget> children, Item item) {
          children.add(RestaurantsListOfItemsComponent(
              item: item,
              function: () {
                //TODO: add routing
                // Get.toNamed(
                //   getItemRoute(restaurantId, item.id),
                //   arguments: {"mode": ViewItemScreenMode.AddItemMode},
                // );
              }));
          children.add(SizedBox(
            height: 8,
          ));
          return children;
        }),
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(items.length, (int index) {
          return RestaurantgridItemCard(
              item: items[index], restaurant: restaurant);
        }),
      );
    }
  }
}
