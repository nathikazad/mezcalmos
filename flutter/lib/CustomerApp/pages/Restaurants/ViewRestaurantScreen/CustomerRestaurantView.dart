import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/Controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/NewRestaurantAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantGridItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sizer/sizer.dart';

class CustomerRestaurantView extends StatefulWidget {
  const CustomerRestaurantView({Key? key}) : super(key: key);

  @override
  State<CustomerRestaurantView> createState() => _CustomerRestaurantViewState();
}

class _CustomerRestaurantViewState extends State<CustomerRestaurantView>
    with TickerProviderStateMixin {
  late Restaurant _restaurant;
  CustomerRestaurantController _controller = CustomerRestaurantController();
  @override
  void initState() {
    _restaurant = Get.arguments as Restaurant;
    mezDbgPrint(_restaurant.info.id);
    _controller.init(restaurant: _restaurant, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingCartComponent(),
      body: CustomScrollView(
        controller: _controller.scrollController,
        slivers: [
          NewRestaurantAppBar(controller: _controller),
          if (_controller.showSpecials)
            SliverFillRemaining(
              child: TabBarView(
                controller: _controller.mainTabsController,
                children: <Widget>[
                  CustomScrollView(
                      controller: _controller.scrollController,
                      slivers: [_catsScrollableList()]),
                  Column(
                    children: [
                      Text("Specials"),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _catsScrollableList() {
    return RectGetter(
      key: _controller.listViewKey,
      child: NotificationListener<ScrollNotification>(
        child: _buildCategoriesList(),
        onNotification: _controller.onScrollNotification,
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            List.generate(_controller.catsList.length, (int index) {
              _controller.itemKeys[index] = RectGetter.createGlobalKey();
              return _scrollableCategoryItems(index);
            }),
          ),
        ));
  }

  Widget _scrollableCategoryItems(
    int index,
  ) {
    final Category category = _controller.catsList[index];
    return RectGetter(
      key: _controller.itemKeys[index],
      child: AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: _controller.scrollController,
          child: _buildCategory(category, index)),
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
          _buildResturantItems(category.items, _restaurant.info.id),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildResturantItems(List<Item> items, String restaurantId) {
    if (_restaurant.restaurantsView == RestaurantsView.Rows) {
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
              item: items[index], restaurant: _restaurant);
        }),
      );
    }
  }
}
