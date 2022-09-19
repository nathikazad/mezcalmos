import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/Restaurants/viewRestaurantsScreen/components/itemSliverAppBar.dart';
import 'package:mez_services_web_app/screens/Restaurants/viewRestaurantsScreen/restaurnatsItemsView.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ViewRestaurantScreenFroDesktop extends StatefulWidget {
  ViewRestaurantScreenFroDesktop({Key? key}) : super(key: key);

  @override
  State<ViewRestaurantScreenFroDesktop> createState() =>
      _ViewRestaurantScreenFroDesktopState();
}

class _ViewRestaurantScreenFroDesktopState
    extends State<ViewRestaurantScreenFroDesktop>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<bool> _selectedMenu = <bool>[];
  List<Widget> togglebuttonsWidgets = [];
  Rx<Restaurant?> restaurant = null.obs;
  LanguageController lang = Get.find<LanguageController>();
  Iterable<Widget> listW = [];
  Map<int, dynamic> itemKeys = {};
  bool pauseRectGetterIndex = false;
  late AutoScrollController scrollController;
  final ScrollController sController = ScrollController();
  GlobalKey stickyKey = GlobalKey();

  final GlobalKey<RectGetterState> listViewKey = RectGetter.createGlobalKey();

  @override
  void initState() {
    itemKeys.assign(999999, "info");
    itemKeys[999999] = RectGetter.createGlobalKey();

    scrollController = AutoScrollController();
    // TODO: implement initState
    print("the id of this item is ${QR.params['id'].toString()}");
    getRestaurantItemsValue();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (mounted) {
      // Future.delayed(Duration(seconds: 3)).then((value) {
      //   var x = (stickyKey.currentContext!.findRenderObject() as RenderBox)
      //       .size
      //       .height;

      //   print("this is the length of the x $x");
      // });
    }
    super.didChangeDependencies();
  }

  List<Category> _getList() {
    final List<Category> data = restaurant.value!.getCategories;
    if (restaurant.value!.getItemsWithoutCategory != null &&
        restaurant.value!.getItemsWithoutCategory!.isNotEmpty) {
      data.add(restaurant.value!.getNoCategory!);
    }
    return data;
  }

  getRestaurantItemsValue() async {
    String? rstaurantID = QR.params['id'].toString();
    var restaurnatValue =
        await Get.find<RestaurantsInfoController>().getRestaurant(rstaurantID);
    print(
        "the id of this item is ${QR.params['id'].toString()} 2 and ${restaurnatValue.toString()}");
    setState(() {
      restaurant = restaurnatValue.obs;
      listW = [];
      _selectedMenu = [];
      _selectedMenu =
          List.generate(restaurant.value!.getCategories.length, (index) {
        if (index == 0) {
          return true;
        } else {
          return false;
        }
      });
      listW = restaurant.value!.getCategories.map((e) => Container(
          width: 200,
          child: Text(
            '${e.name![lang.userLanguageKey]}',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )));
      print(
          "the children length is ${listW.length} and selections is ${_selectedMenu.length}");
      tabController = TabController(
          length: restaurant.value!.getCategories.length, vsync: this);
      print("the lenght of list is${_getList().length} ");
    });
  }

  Widget _buildCategoriesList() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          ...List.generate(_getList().length, (int index) {
            itemKeys[index] = RectGetter.createGlobalKey();
            return _scrollableCategoryItems(index);
          })
        ],
      ),
    );
  }

  Widget _scrollableCategoryItems(
    int index,
  ) {
    final Category category = _getList()[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
          key: ValueKey(index),
          index: index,
          controller: scrollController,
          child: _buildCategory(category, index)),
    );
  }

  Widget _buildCategory(Category category, int index) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              category.name?[lang.userLanguageKey] ?? "",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          if (category.dialog?[lang.userLanguageKey] != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                category.dialog![lang.userLanguageKey]!,
                style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(73, 73, 73, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          _buildResturantItems(category.items, restaurant.value!.info.id),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  bool checkCategoriesItemsImage() {
    bool hasAnImage = true;
    _getList().forEach((category) {
      var x = category.items.where((item) => item.image == null);
      if (x.length > 0) {
        hasAnImage = false;
      }
    });
    return hasAnImage;
  }

  Widget _buildResturantItems(List<Item> items, String restaurantId) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (checkCategoriesItemsImage() == true)
            ? (SizeOfOvalImage(context) / 100)
            : ((SizeOfOvalImageTwo(context) * 5) / 100),
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return (checkCategoriesItemsImage() == true)
            ? ItemCardComponnent(
                title: items[index].name[lang.userLanguageKey]!,
                imageUrl: items[index].image,
                id: items[index].id,
                price: items[index].cost.toString(),
              )
            : ItemCardWithoutImageComponent(
                title: items[index].name[lang.userLanguageKey]!,
                imageUrl: items[index].image,
                id: items[index].id,
                price: items[index].cost.toString(),
              );
      },
    );
  }

  List<int> getVisibleItemsIndex() {
    final Rect? rect = RectGetter.getRectFromKey(listViewKey);
    final List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((int index, key) {
      final Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return false;
    final int lastTabIndex = tabController.length - 1;
    final List<int> visibleItems = getVisibleItemsIndex();

    final bool reachLastTabIndex =
        visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
      setState(() {
        for (int i = 0; i < _selectedMenu.length; i++) {
          _selectedMenu[i] = i == lastTabIndex;
        }
      });
    } else {
      final int sumIndex =
          visibleItems.reduce((int value, int element) => value + element);
      final int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex)
        tabController.animateTo(middleIndex);
      setState(() {
        for (int i = 0; i < _selectedMenu.length; i++) {
          _selectedMenu[i] = i == middleIndex;
        }
      });
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: onScrollNotification,
          child: Obx(
            () => restaurant.value != null
                ? CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      ItemSliverAppBar(
                        urlImg: restaurant.value!.info.image,
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MezCalmosResizer.getWepPageHorizontalPadding(
                                      context)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Row(
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "${restaurant.value!.info.name}",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Obx(
                                        () => InkWell(
                                          onTap: () {
                                            // print(
                                            //     "QR.currentPath ${QR.currentPath}");
                                            var xPath = getCurrentPath();

                                            QR.to(
                                                "${xPath[0]}/info${xPath[1]}");
                                          },
                                          child: Text(
                                            lang.strings["CustomerApp"]["pages"]
                                                            ["Restaurants"]
                                                        ["ViewRestaurantScreen"]
                                                    ["ViewRestaurantScreen"]
                                                ["moreInfo"],
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color.fromRGBO(
                                                      103, 121, 254, 1),
                                                  fontSize: 11),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    (restaurant.value!.description![
                                                lang.userLanguageKey] !=
                                            "")
                                        ? Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${restaurant.value!.description![lang.userLanguageKey]!}",
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    Icon(
                                      Icons.schedule,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "52min",
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.delivery_dining,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "\$50",
                                      style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.payment,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                          "${restaurant.value!.info.location.address}",
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black))),
                                    )
                                  ],
                                ),
                              ),

                              ///menu Container
                              Container(
                                width: Get.width,
                                // color: Colors.red,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      alignment: Alignment.topLeft,
                                      child: StickyHeader(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: Get.height *
                                                    (_getList().length + 1),
                                              ),
                                              //Spacer(),
                                              Container()
                                            ],
                                          ),
                                          controller: scrollController,
                                          header: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(height: 25),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Obx(
                                                  () => Text(
                                                    lang.strings["CustomerApp"]
                                                                    ["pages"]
                                                                ["Restaurants"][
                                                            "ViewRestaurantScreen"]
                                                        [
                                                        "ViewRestaurantScreen"]["menu"],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.black,
                                                            fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Theme(
                                                data: ThemeData(),
                                                child: ToggleButtons(
                                                  borderColor:
                                                      Colors.transparent,
                                                  selectedColor: Color.fromRGBO(
                                                      103, 121, 254, 1),
                                                  fillColor: Colors.transparent,
                                                  selectedBorderColor:
                                                      Colors.transparent,
                                                  children: listW.toList(),
                                                  direction: Axis.vertical,
                                                  onPressed: (int index) {
                                                    setState(() {
                                                      // The button that is tapped is set to true, and the others to false.
                                                      for (int i = 0;
                                                          i <
                                                              _selectedMenu
                                                                  .length;
                                                          i++) {
                                                        _selectedMenu[i] =
                                                            i == index;
                                                      }
                                                      animateAndScrollTo(index);
                                                    });
                                                  },
                                                  isSelected: _selectedMenu,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      key: stickyKey,
                                      child: _buildCategoriesList(),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
