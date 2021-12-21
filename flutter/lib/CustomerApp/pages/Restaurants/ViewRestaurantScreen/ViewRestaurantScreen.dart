import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:get/get.dart';
import 'components/RestaurantSliverAppbar.dart';
import 'components/buildRestaurantsItems.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  buildResturantItems(restaurant!.items, restaurant!.id),
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
                      margin: EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 15.h),
                      child: Text(restaurant!.description),
                    ),
                    (restaurant!.location != null)
                        ? Column(
                            children: [
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
                            ],
                          )
                        : Container(),
                    (restaurant!.schedule != null)
                        ? Column(
                            children: [
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
                          )
                        : Container()
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
