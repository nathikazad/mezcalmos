import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/Controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/restaurantInfoTab.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewRestaurantScreen"]["CustomerRestaurantView"];

class CustomerRestaurantView extends StatefulWidget {
  @override
  _CustomerRestaurantViewState createState() => _CustomerRestaurantViewState();
}

class _CustomerRestaurantViewState extends State<CustomerRestaurantView>
    with TickerProviderStateMixin {
  CustomerRestaurantController _viewController = CustomerRestaurantController();
  late Restaurant restaurant;

  @override
  void initState() {
    restaurant = Get.arguments as Restaurant;
    mezDbgPrint(restaurant.info.id);
    _viewController.init(restaurant: restaurant, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingCartComponent(),
      bottomSheet: (restaurant.isOpen() == false)
          ? _schedulingOrdersBottomWidget()
          : null,
      body: RectGetter(
        key: _viewController.listViewKey,
        child: NotificationListener<ScrollNotification>(
          child: buildSliverScrollView(),
          onNotification: _viewController.onScrollNotification,
        ),
      ),
    );
  }

  Container _schedulingOrdersBottomWidget() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.grey.shade400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              "Only available for scheduling orders",
              style: Get.textTheme.bodyText1,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      controller: _viewController.scrollController,
      slivers: [
        RestaurantSliverAppBar(controller: _viewController),
        Obx(() {
          if (_viewController.showInfo.value)
            return SliverPadding(
              padding: const EdgeInsets.all(12),
              sliver: SliverToBoxAdapter(
                  child: RestaurantInfoTab(
                restaurant: restaurant,
                controller: _viewController,
              )),
            );
          else
            return _buildItemsList();
        })
      ],
    );
  }

  Widget _buildItemsList() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
                _viewController.isOnMenuView
                    ? _viewController.catsList.length
                    : _viewController.getGroupedSpecials().length, (int index) {
              _viewController.itemKeys[index] = RectGetter.createGlobalKey();
              return _viewController.isOnMenuView
                  ? _scrollableCategoryItems(index)
                  : _scrollableSpecialItems(index);
            }),
          ),
        ));
  }

  Widget _scrollableCategoryItems(
    int index,
  ) {
    final Category category = _viewController.catsList[index];
    return RectGetter(
      key: _viewController.itemKeys[index],
      child: AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: _viewController.scrollController,
          child: _buildCategory(category, index)),
    );
  }

  Widget _scrollableSpecialItems(
    int index,
  ) {
    return RectGetter(
      key: _viewController.itemKeys[index],
      child: AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: _viewController.scrollController,
          child:
              _buildSpecialItems(_viewController.getGroupedSpecials(), index)),
    );
  }

  Widget _buildCategory(Category category, int index) {
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
            items: category.items,
            restaurantId: restaurant.info.id,
            isSpecial: false,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildSpecialItems(Map<DateTime?, List<Item>> specItems, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              "${specItems.keys.toList()[index]!.toDayName(withDateNumber: true)}${(specItems.keys.toList()[index]!.isToday || specItems.keys.toList()[index]!.isTomorrow) ? "'s" : ""} ${_i18n()["specials"]}",
              style: Get.theme.textTheme.headline3
                  ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
          ),
          _buildResturantItems(
            items: specItems.values.toList()[index],
            restaurantId: restaurant.info.id,
            isSpecial: true,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildResturantItems(
      {required List<Item> items,
      required String restaurantId,
      bool isSpecial = false}) {
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
                  arguments: {
                    "mode": ViewItemScreenMode.AddItemMode,
                    "isSpecial": isSpecial
                  },
                );
              }));

          return children;
        }),
      ),
    );
  }
}
