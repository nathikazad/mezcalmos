import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/controllers/CustItemViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/components/RestauSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/components/RestaurantGridItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/components/restaurantInfoTab.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/controllers/CustomerRestaurantController.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewRestaurantScreen"]["CustomerRestaurantView"];

class CustomerRestaurantView extends StatefulWidget {
  @override
  _CustomerRestaurantViewState createState() => _CustomerRestaurantViewState();
}

class _CustomerRestaurantViewState extends State<CustomerRestaurantView>
    with TickerProviderStateMixin {
  CustomerRestaurantController _viewController = CustomerRestaurantController();

  @override
  void initState() {
    final int restaurantId = int.parse(QR.params["id"].toString());
    _viewController.init(restaurantId: restaurantId, vsync: this);
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
    return Text('Test');
    Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingCartComponent(),
      bottomSheet: (_viewController.restaurant.value?.isOpen() == false)
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
                restaurant: _viewController.restaurant.value!,
                controller: _viewController,
              )),
            );
          else if (_viewController.isInitialzed) {
            return _buildItemsList();
          } else {
            return SliverFillRemaining(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "Some magic is happening ...",
                style: Get.textTheme.bodyLarge?.copyWith(
                    color: primaryBlueColor, fontStyle: FontStyle.italic),
              ),
            ));
          }
        })
      ],
    );
  }

  Widget _buildItemsList() {
    return SliverPadding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 70),
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
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0),
            child: Text(
              category.name?[userLanguage]?.inCaps ??
                  '${_i18n()["undefinedCategory"]}',
              style: category.name?[userLanguage] != null
                  ? Get.theme.textTheme.headlineSmall
                  : Get.textTheme.bodyMedium?.copyWith(
                      color: Color(0xFF787878),
                    ),
            ),
          ),
          if (category.dialog?[userLanguage] != null &&
              category.dialog![userLanguage]!.inCaps != "")
            Container(
              child: Text(
                category.dialog![userLanguage]!.inCaps,
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: offLightShadeGreyColor,
                ),
              ),
            ),
          _buildResturantItems(
            items: category.items,
            restaurantId: _viewController.restaurant.value!.info.hasuraId,
            isSpecial: false,
          ),
          SizedBox(
            height: 2,
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
            margin: const EdgeInsets.only(top: 7),
            child: Text(
                "${specItems.keys.toList()[index]!.toDayName(withDateNumber: true)}${(specItems.keys.toList()[index]!.isToday || specItems.keys.toList()[index]!.isTomorrow) ? "'s" : ""} ${_i18n()["specials"]}"
                    .inCaps,
                style: Get.theme.textTheme.headlineSmall),
          ),
          _buildResturantItems(
            items: specItems.values.toList()[index],
            restaurantId: _viewController.restaurant.value!.info.hasuraId,
            isSpecial: true,
          ),
        ],
      ),
    );
  }

  Widget _buildResturantItems(
      {required List<Item> items,
      required int restaurantId,
      bool isSpecial = false}) {
    mezDbgPrint("[66] called :: _buildResturantItems");
    if (_viewController.restaurant.value!.restaurantsView ==
            RestaurantsView.Rows ||
        isSpecial) {
      return Container(
        margin: const EdgeInsets.only(top: 7),
        child: Column(
          children: items.fold<List<Widget>>(<Widget>[],
              (List<Widget> children, Item item) {
            children.add(RestaurantsListOfItemsComponent(
                item: item,
                function: () {
                  MezRouter.toNamed(
                    RestaurantRouters()
                        .getRestaurantItemRoute(restaurantId, item.id!)
                        .replaceAll(' ', ''),
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
            item: items[index],
            restaurant: _viewController.restaurant.value!,
          );
        }),
      );
    }
  }

  Container _schedulingOrdersBottomWidget() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(color: Color(0xFFEDEDED)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              '${_i18n()["scheduleTitle"]}',
              style: Get.textTheme.bodyLarge?.copyWith(
                color: offLightShadeGreyColor,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
