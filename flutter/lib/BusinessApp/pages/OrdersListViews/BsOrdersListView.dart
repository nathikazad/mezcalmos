import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/BsHomeRentalOrderView.dart';
import 'package:mezcalmos/BusinessApp/pages/OrdersListViews/components/BsOfferingOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/OrdersListViews/components/BsOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/OrdersListViews/controllers/BsOrdersListViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: 'Orders',
          tabBar: TabBar(
            controller: viewController.tabController,
            tabs: [
              Tab(
                text: 'Orders',
              ),
              Tab(
                text: 'Schedule',
              ),
            ],
          )),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          _firstTab(context),
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Column(
                  children:
                      List.generate(5, (int index) => BsOfferingOrderCard()),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _firstTab(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        // pending orders
        Container(
          padding: EdgeInsets.all(15),
          color: offPurpleColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.hourglass_empty_outlined,
                    color: purpleColor,
                  ),
                  hSmallSepartor,
                  Text(
                    "Pending orders (${5 - 2})",
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: purpleColor),
                  ),
                ],
              ),
              meduimSeperator,
              Column(
                children: List.generate(
                  5,
                  (int index) => BsOrderCard(
                    imageUrl: defaultUserImgUrl,
                    customerName: 'John Doe',
                    onTap: () {
                      BsHomeRentalOrderView.navigate(orderId: 3);
                    },
                    time: DateTime.now(),
                    numItems: 2,
                    price: 15.99,
                  ),
                ),
              )
            ],
          ),
        ),
        // upcoming orders
        Container(
          padding: EdgeInsets.all(15),
          color: secondaryLightBlueColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.event_available_outlined,
                    color: primaryBlueColor,
                  ),
                  hSmallSepartor,
                  Text(
                    "Upcoming orders (${5 - 2})",
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: primaryBlueColor),
                  ),
                ],
              ),
              meduimSeperator,
              Column(
                children: List.generate(
                  5,
                  (int index) => BsOrderCard(
                    imageUrl: defaultUserImgUrl,
                    onTap: () {},
                    customerName: 'John Doe',
                    time: DateTime.now(),
                    numItems: 2,
                    price: 15.99,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
