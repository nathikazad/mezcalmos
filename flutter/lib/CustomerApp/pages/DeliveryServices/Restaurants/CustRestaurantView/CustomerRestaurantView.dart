import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicePostsList/CustServicePostsList.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustItemView/CustItemView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/components/RestauSliverAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/components/RestaurantGridItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/components/RestaurantListItemComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/components/restaurantInfoTab.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/controllers/CustomerRestaurantViewController.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelpers/OfferHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewRestaurantScreen"]["CustomerRestaurantView"];

class CustRestaurantView extends StatefulWidget {
  @override
  _CustRestaurantViewState createState() => _CustRestaurantViewState();
  static Future<void> navigate({required int restaurantId}) {
    return MezRouter.toPath(RestaurantRoutes.restaurantViewRoute
        .replaceAll(":restaurantId", restaurantId.toString()));
  }
}

class _CustRestaurantViewState extends State<CustRestaurantView>
    with TickerProviderStateMixin {
  CustRestaurantViewController _viewController = CustRestaurantViewController();

  @override
  void initState() {
    final int restaurantId =
        int.parse(MezRouter.urlArguments["restaurantId"].toString());
    _viewController.init(restaurantId: restaurantId, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomSheet: Obx(
        () => (_viewController.restaurant.value?.isOpen == false)
            ? _schedulingOrdersBottomWidget()
            : SizedBox(),
      ),
      body: Obx(
        () {
          if (_viewController.restaurant.value != null) {
            return RectGetter(
              key: _viewController.listViewKey,
              child: NotificationListener<ScrollNotification>(
                child: buildSliverScrollView(),
                onNotification: _viewController.onScrollNotification,
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      primary: true,
      slivers: [
        RestaurantSliverAppBar(controller: _viewController),
        SliverFillRemaining(
          child: TabBarView(
              controller: _viewController.mainTabController,
              children: [
                Column(
                  children: [
                    if (_viewController.showCategoriesChips)
                      _menuFilterChips(context),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8),
                        controller: _viewController.scrollController,
                        child: Column(
                          children: [
                            if (_viewController.offers.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Promotions",
                                    style: context.textTheme.bodyLarge,
                                  ),
                                  smallSepartor,
                                  Column(
                                    children: List.generate(
                                        _viewController.offers.length,
                                        (int index) {
                                      final cModels.Offer offer =
                                          _viewController.offers[index];
                                      return MezCard(
                                        cardColor: secondaryLightBlueColor,
                                        firstAvatarIcon: Icons.percent,
                                        radius: 20,
                                        firstAvatarBgColor: primaryBlueColor,
                                        firstAvatarIconColor: Colors.white,
                                        content: Container(
                                          child: Text(
                                              _viewController
                                                  .offers[index].details
                                                  .getDescription(),
                                              style: context.textTheme.bodyLarge
                                                  ?.copyWith(
                                                      color: primaryBlueColor)),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            Column(
                                children: List.generate(
                                    _viewController.isOnMenuView
                                        ? _viewController.catsList.length
                                        : _viewController
                                            .getGroupedSpecials()
                                            .length, (int index) {
                              _viewController.itemKeys[index] =
                                  RectGetter.createGlobalKey();
                              return _viewController.isOnMenuView
                                  ? _scrollableCategoryItems(index)
                                  : _scrollableSpecialItems(index);
                            })),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustServicePostsList(
                  serviceName: _viewController.restaurant.value!.info.name,
                  serviceImage: _viewController.restaurant.value!.info.image,
                  serviceId: _viewController.restaurant.value!.restaurantId,
                  serviceProviderType: cModels.ServiceProviderType.Restaurant,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 12.5),
                  child: RestaurantInfoTab(
                    restaurant: _viewController.restaurant.value!,
                    controller: _viewController,
                  ),
                ),
              ]),
        )
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 0),
          child: Text(
            category.name?.getTranslation(userLanguage)?.inCaps ??
                '${_i18n()["undefinedCategory"]}',
            style: category.name?.getTranslation(userLanguage) != null
                ? context.txt.headlineSmall
                : context.txt.bodyMedium?.copyWith(
                    color: Color(0xFF787878),
                  ),
          ),
        ),
        if (category.dialog != null &&
            category.dialog!.getTranslation(userLanguage) != null)
          Container(
            child: Text(
              category.dialog!.getTranslation(userLanguage)!.inCaps,
              style: context.txt.bodyMedium?.copyWith(
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
                style: context.txt.headlineSmall),
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
                function: () => CustItemView.navigateToRestaurantItem(
                    restaurantId: restaurantId, itemId: item.id!)));

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
              restaurant: _viewController.restaurant.value!);
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
              style: context.txt.bodyLarge?.copyWith(
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

  Widget _menuFilterChips(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 7),
      child: Obx(
        () {
          return Row(
            children: (_viewController.showSpecialTabs)
                ? List.generate(
                    _viewController.getGroupedSpecials().length,
                    (int index) {
                      return FilterChip(
                        label: Text(
                          _viewController
                              .getGroupedSpecials()
                              .keys
                              .toList()[index]
                              .toDayName()
                              .inCaps,
                        ),
                        selected: _viewController.currentSelectedIndex == index,
                        onSelected: (bool selected) {
                          _viewController.animateAndScrollTo(index);
                        },
                        selectedColor: secondaryLightBlueColor,
                        backgroundColor: Colors.transparent,
                        checkmarkColor: Colors.white,
                      );
                    },
                  )
                : (_viewController.showMenuTabs)
                    ? List.generate(
                        _viewController
                            .restaurant.value!.getAvailableCategories.length,
                        (int index) {
                          return FilterChip(
                            label: Text(
                              _viewController.restaurant.value!
                                      .getAvailableCategories[index].name
                                      ?.getTranslation(userLanguage)
                                      ?.inCaps ??
                                  "",
                            ),
                            selected:
                                _viewController.currentSelectedIndex == index,
                            onSelected: (bool selected) {
                              _viewController.animateAndScrollTo(index);
                            },
                            selectedColor: secondaryLightBlueColor,
                            backgroundColor: Colors.transparent,
                            checkmarkColor: Colors.white,
                          );
                        },
                      )
                    : [],
          );
        },
      ),
    );
  }
}
