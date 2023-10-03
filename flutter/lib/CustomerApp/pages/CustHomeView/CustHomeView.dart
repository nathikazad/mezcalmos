import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/CustomerApp/components/MezServicesMapView.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/components/CustRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/components/CustRestaurantItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/controllers/CustHomeViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:uni_links/uni_links.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustHomeView extends StatefulWidget {
  const CustHomeView({super.key});

  @override
  State<CustHomeView> createState() => _CustHomeViewState();
}

class _CustHomeViewState extends State<CustHomeView>
    with TickerProviderStateMixin {
  CustHomeViewController viewController = CustHomeViewController();

  @override
  void initState() {
    _startListeningForLinks();
    viewController.init(vsync: this, context: context);
    super.initState();
  }

  Future<void> _startListeningForLinks() async {
    mezDbgPrint("👁️👁️👁️👁️👁️startListeningForLinks");
    String? initialLink;
    try {
      initialLink = await getInitialLink();
    } catch (error) {
      // Handle error
    }
    // Parse the initial link (if it exists)
    if (initialLink != null) {
      await CustomerLinkHandler.handleLink(Uri.parse(initialLink));
    }

    // Subscribe to incoming links
    if (kIsWeb == false) {
      linkStream.listen((String? link) {
        // Parse the link
        mezDbgPrint("👁️👁️👁️👁️👁️new link $link");
        if (link != null) {
          CustomerLinkHandler.handleLink(Uri.parse(link));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() {
            if (viewController.isMapView)
              return _mapView();
            else
              return listScrollView();
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: MezInkwell(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  onClick: () async {
                    viewController.switchView();
                  },
                  icon:
                      viewController.isMapView ? Icons.list : Icons.map_rounded,
                  label: viewController.isMapView
                      ? '${_i18n()['viewAsList']}'
                      : '${_i18n()['viewOnMap']}',
                  borderRadius: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  NestedScrollView listScrollView() {
    return NestedScrollView(
      controller: viewController.restaurantsScrollController,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      headerSliverBuilder: (BuildContext context, _) {
        return [
          _appBar(context),
          _searchAndFilter(context),
        ];
      },
      body: tabsView(),
    );
  }

  TabBarView tabsView() {
    return TabBarView(
      controller: viewController.tabController,
      children: [
        Obx(
          () {
            if (viewController.showRestaurantShimmer) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      10, (int index) => CustRestaurantCard.shimmer()),
                ),
              );
            } else if (viewController.restaurants.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: viewController.restaurants.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Restaurant restaurant =
                            viewController.restaurants[index];
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: CustRestaurantCard(
                            key: ValueKey<int>(restaurant.info
                                .hasuraId), // Use a unique key for each item
                            restaurant: restaurant,
                          ),
                        );
                      },
                    ),
                    if (viewController.hasReachedEndData.isFalse &&
                        viewController.searchQuery.isEmpty) ...[
                      smallSepartor,
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: MezButton(
                          width: double.infinity,
                          backgroundColor: secondaryLightBlueColor,
                          textColor: primaryBlueColor,
                          borderRadius: 20,
                          height: 45,
                          label: "${_i18n()['fetchMore']}...",
                          onClick: () async {
                            await viewController.fetchMore();
                          },
                        ),
                      ),
                    ]
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(15),
                child: Text("${_i18n()['noRest']}"),
              );
            }
          },
        ),
        Scrollbar(
          child: SingleChildScrollView(
            child: Obx(
              () {
                if (viewController.showIemsShimmer) {
                  return Column(
                    children: List.generate(
                        10, (int index) => CustRestaurantItemCard.shimmer()),
                  );
                } else if (viewController.filteredItems.isNotEmpty)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: List.generate(
                            viewController.items.length,
                            (int index) => CustRestaurantItemCard(
                                  item: viewController.items[index],
                                )),
                      ),
                      if (viewController.itemsHasReachedEndData.isFalse &&
                          viewController.searchQuery.isEmpty) ...[
                        smallSepartor,
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: MezButton(
                            width: double.infinity,
                            backgroundColor: secondaryLightBlueColor,
                            textColor: primaryBlueColor,
                            borderRadius: 20,
                            height: 45,
                            label: "${_i18n()['fetchMore']}...",
                            onClick: () async {
                              await viewController.fetchMore();
                            },
                          ),
                        ),
                      ]
                    ],
                  );
                else
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15),
                    child: Text("${_i18n()['noItems']}"),
                  );
              },
            ),
          ),
        ),
      ],
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: _menuBtn(),
        actions: [
          Obx(() {
            if (Get.find<AuthController>().user == null) {
              return MezIconButton(
                  onTap: () {
                    PhoneNumberScreen.navigateAtOrderTime();
                  },
                  icon: Icons.person);
            }
            return SizedBox();
          }),
          SizedBox(
            width: 8,
          ),
        ],
        // expandedHeight: 150,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: MezcalmosSharedWidgets.fillTitle(
              actionLength: 2, showLogo: (context.width > 320) ? true : false),
        ));
  }

  SliverPersistentHeader _searchAndFilter(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MezDelegate(
        max: kToolbarHeight * 2,
        min: kToolbarHeight * 1.9,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hSmallSepartor,
                Expanded(
                  child: TextField(
                    onChanged: (String value) {
                      viewController.search(value);
                    },
                    decoration: InputDecoration(
                      hintText: "${_i18n()['search']}",
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey.shade600,
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: primaryBlueColor, width: 1.5)),
                    ),
                  ),
                ),
                hSmallSepartor,
                _filterButton(context),
                hSmallSepartor,
              ],
            ),
            TabBar(
                controller: viewController.tabController,
                labelColor: primaryBlueColor,
                unselectedLabelColor: Colors.grey.shade400,
                indicatorSize: TabBarIndicatorSize.label,
                automaticIndicatorColorAdjustment: true,
                padding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.food_bank_rounded),
                        hTinySepartor,
                        Text("${_i18n()['restaurants']['title']}"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fastfood_rounded),
                        hTinySepartor,
                        Text("${_i18n()['items']}"),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }

  Widget _filterButton(BuildContext context) {
    return Obx(
      () => Badge(
        label: Text(viewController.activeFiltersCount.toString()),
        backgroundColor: primaryBlueColor,
        isLabelVisible: viewController.showOnlyOpen.value,
        child: MezIconButton(
          onTap: () async {
            showMezSheet(
                title: "${_i18n()['filters']}",
                content: Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Obx(
                        () => SwitchListTile.adaptive(
                            activeColor: primaryBlueColor,
                            title: Text("${_i18n()['showOnlyOpen']}"),
                            value: viewController.showOnlyOpen.value,
                            onChanged: (bool v) {
                              viewController.switchOnlyOpen(value: v);
                            }),
                      ),
                      Obx(
                        () => SwitchListTile.adaptive(
                            activeColor: primaryBlueColor,
                            title: Text("${_i18n()['showOnlyDv']}"),
                            value: viewController.showOnlyDelivery.value,
                            onChanged: (bool v) {
                              viewController.switchOnlyDelivery(value: v);
                            }),
                      ),
                      smallSepartor,
                      MezButton(
                        width: double.infinity,
                        label: "${_i18n()['filter']}",
                        onClick: () async {
                          await viewController.filter();

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                context: context);
          },
          padding: const EdgeInsets.all(8),
          iconSize: 25,
          icon: Icons.filter_list,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _menuBtn() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          Get.find<SideMenuDrawerController>().openMenu();
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 7),
                ),
              ],
              color: primaryBlueColor),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Widget _switchViewBtn() {
  //   return Transform.scale(
  //     scale: 0.8,
  //     child: InkWell(
  //       onTap: () {
  //         viewController.switchView();
  //       },
  //       child: Ink(
  //         padding: const EdgeInsets.all(8),
  //         height: 20,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Color.fromARGB(255, 216, 225, 249),
  //                 spreadRadius: 0,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 7),
  //               ),
  //             ],
  //             color: primaryBlueColor),
  //         child: Icon(
  //           viewController.isMapView ? Icons.list : Icons.map_rounded,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _mapView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MezcalmosAppBar(AppBarLeftButtonType.Menu, actionIcons: []),
      Obx(
        () => Expanded(
          child: MezServicesMapView(
            mGoogleMapController: viewController.mapController,
            fetchNewData: (LatLng? mapCenter, double? distance) async {
              await viewController.fetchMapViewRentals(
                  fromLoc: mapCenter, distance: distance);
              return viewController.restaurantsMarkers.toList();
            },
            markers: viewController.restaurantsMarkers.value,
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.all(7),
                child: _filterButton(context),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  // Obx _switchMapBtn() {
  //   return Obx(
  //     () => MezIconButton(
  //       //  shape: BoxShape.rectangle,
  //       // margin: const EdgeInsets.all(3),
  //       padding: const EdgeInsets.all(8),

  //       onTap: () {
  //         viewController.switchView();
  //       },
  //       icon: viewController.isMapView ? Icons.list : Icons.map_rounded,
  //       backgroundColor: primaryBlueColor,
  //       iconColor: Colors.white,
  //     ),
  //   );
  // }
}
