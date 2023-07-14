import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/BsHomeRentalOrderView.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/components/BsOfferingOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/components/BsOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/controllers/BsOrdersListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/models/MinimumBsOrder.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['Orders']['BsOrdersListViews']['BsOrdersListView'];

class BsOrdersListView extends StatefulWidget {
  const BsOrdersListView({super.key});

  @override
  State<BsOrdersListView> createState() => _BsOrdersListViewState();
}

class _BsOrdersListViewState extends State<BsOrdersListView>
    with TickerProviderStateMixin {
  BsOrdersListViewController viewController = BsOrdersListViewController();
  @override
  void initState() {
    viewController.init(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: '${_i18n()['orders']}',
          tabBar: TabBar(
            labelPadding: EdgeInsets.zero,
            controller: viewController.tabController,
            tabs: [
              Tab(
                text: '${_i18n()['pending']}',
              ),
              Tab(
                text: '${_i18n()['upcoming']}',
              ),
              Tab(
                text: '${_i18n()['past']}',
              ),
            ],
          )),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          _pendingTab(context),
          _upcomingTab(context),
          _pastTab(context),
        ],
      ),
    );
  }

  SingleChildScrollView _pendingTab(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // pending orders
              Text(
                '${_i18n()['pendingOrders']} (${viewController.pendingOrders.length})',
                style: context.textTheme.bodyLarge,
              ),
              meduimSeperator,
              Column(
                children: List.generate(
                  viewController.pendingOrders.length,
                  (int index) => BsOrderCard(
                    imageUrl: viewController.pendingOrders[index].customerImage,
                    customerName:
                        viewController.pendingOrders[index].customerName,
                    onTap: () {
                      BsHomeRentalOrderView.navigate(
                          orderId:
                              viewController.pendingOrders[index].id.toInt());
                    },
                    time: viewController.pendingOrders[index].time,
                    numItems: viewController.pendingOrders[index].numberOfItems,
                    price: viewController.pendingOrders[index].cost,
                  ),
                ),
              ),
              // upcoming orders
            ],
          ),
        ));
  }

  SingleChildScrollView _upcomingTab(BuildContext context) {
    return SingleChildScrollView(
        controller: viewController.upcomingScrollController,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pending orders
            Text(
              '${_i18n()['upcomingOrders']}',
              style: context.textTheme.bodyLarge,
            ),
            meduimSeperator,
            GroupedListView<MinimumBusinessItem, DateTime>(
              shrinkWrap: true,
              elements: viewController.upcomingItems,
              groupBy: (MinimumBusinessItem element) => DateTime(
                  element.time.year, element.time.month, element.time.day),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator: (MinimumBusinessItem element1,
                      MinimumBusinessItem element2) =>
                  element2.time.compareTo(element1.time),
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              groupHeaderBuilder: (MinimumBusinessItem element) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    element.time
                        .toLocal()
                        .toDayName(withDateNumber: true)
                        .inCaps,
                    style: context.textTheme.bodyLarge,
                  ),
                );
              },
              separator: SizedBox(
                height: 5,
              ),
              itemBuilder: (BuildContext context, MinimumBusinessItem item) {
                return BsOfferingOrderCard(item: item);
              },
            ),

            // upcoming orders
          ],
        ));
  }

  SingleChildScrollView _pastTab(BuildContext context) {
    return SingleChildScrollView(
        controller: viewController.pastScrollController,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // pending orders
              Text(
                '${_i18n()['pastOrders']}',
                style: context.textTheme.bodyLarge,
              ),
              meduimSeperator,

              Column(
                children: List.generate(
                    viewController.pastItems.length,
                    (int index) => BsOfferingOrderCard(
                          item: viewController.pastItems[index],
                        )),
              ),
              // upcoming orders
            ],
          ),
        ));
  }
}
