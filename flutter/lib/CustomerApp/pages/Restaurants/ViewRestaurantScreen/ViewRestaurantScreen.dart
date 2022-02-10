import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

import 'components/RestaurantSliverAppbar.dart';
import 'components/buildRestaurantsItems.dart';
import 'components/restaurantInfoTab.dart';

final f = new DateFormat('hh:mm a');

class ViewRestaurantScreen extends StatefulWidget {
  // final Restaurant restaurant;
  const ViewRestaurantScreen({
    Key? key,
    // required this.restaurant,
  }) : super(key: key);

  @override
  _ViewRestaurantScreenState createState() => _ViewRestaurantScreenState();
}

class _ViewRestaurantScreenState extends State<ViewRestaurantScreen> {
  Restaurant? restaurant;
  @override
  void initState() {
    restaurant = Get.arguments as Restaurant;
    mezDbgPrint(
        "the length of opening hours is ${restaurant?.schedule?.openHours.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              RestaurantSliverAppBar(restaurant: restaurant!),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    tabs: [
                      Tab(
                        text:
                            '${lang.strings["customer"]["restaurant"]["menu"]["menu"]}',
                      ),
                      Tab(
                        text:
                            '${lang.strings["customer"]["restaurant"]["menu"]["info"]}',
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(children: [
            // -----------------------------FIRST TAB (MENU) --------------------------------------------//
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    buildResturantItems(restaurant!.items, restaurant!.id),
                  ],
                ),
              ),
            ),
            // -----------------------------SECOND TAB (INFOS) --------------------------------------------//
            RestaurantInfoTab(
              restaurant: restaurant!,
            )
          ]),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
