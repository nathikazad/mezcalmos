import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

import 'components/RestaurantSliverAppbar.dart';
import 'components/buildRestaurantsItems.dart';

class NewRestaurantViewScreen extends StatelessWidget {
  final Restaurant restaurant;
  const NewRestaurantViewScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              RestaurantSliverAppBar(restaurant: restaurant),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    tabs: [
                      Tab(
                        text: 'Menu',
                      ),
                      Tab(
                        text: 'Informations',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  buildResturantItems(restaurant.items, restaurant.id),
                ],
              ),
            ),
            // -----------------------------SECOND TAB (INFOS) --------------------------------------------//
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Description :',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(restaurant.description),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        'Location :',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 250.h,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      child: Text(
                        'Working Hours :',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 250.h,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
