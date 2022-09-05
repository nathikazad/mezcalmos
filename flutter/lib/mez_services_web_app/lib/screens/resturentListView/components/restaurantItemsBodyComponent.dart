import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/controllers/restaurantsInfoController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
import 'package:mez_services_web_app/screens/restaurantsItemsViiew/components/itemSliverAppBar.dart';
import 'package:mez_services_web_app/screens/restaurantsItemsViiew/restaurnatsItemsView.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantItemsBodyComponent extends StatefulWidget {
  RestaurantItemsBodyComponent({Key? key}) : super(key: key);

  @override
  State<RestaurantItemsBodyComponent> createState() =>
      _RestaurantItemsBodyComponentState();
}

class _RestaurantItemsBodyComponentState
    extends State<RestaurantItemsBodyComponent> {
  List<bool> _selectedMenu = <bool>[];
  List<Widget> togglebuttonsWidgets = [];
  Rx<Restaurant?> restaurant = null.obs;
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  @override
  void initState() {
    // TODO: implement initState
    print("the id of this item is ${QR.params['id'].toString()}");
    getRestaurantItemsValue();

    super.initState();
  }

  getRestaurantItemsValue() async {
    String? rstaurantID = QR.params['id'].toString();
    var restaurnatValue =
        await Get.find<RestaurantsInfoController>().getRestaurant(rstaurantID);
    print(
        "the id of this item is ${QR.params['id'].toString()} 2 and ${restaurnatValue.toString()}");
    setState(() {
      restaurant = restaurnatValue.obs;
    });
    _buildMenuList();

    // RestaurantsInfoController
  }

  Iterable<Widget> _buildMenuList() sync* {
    var pos = 0;
    List<Widget> x = [];
    restaurant.value?.getCategories.forEach((element) {
      if (pos == 0) {
        _selectedMenu.add(true);
      } else {
        _selectedMenu.add(false);
      }

      x.add(
        ToggleButtonItemComponent(
          title: "${element.name![userLanguage]}",
          isActive: _selectedMenu[pos],
        ),
      );
      pos++;
      print("this is a category of name ${element.name}");
    });

    yield ToggleButtons(
      children: x,
      isSelected: _selectedMenu,
      direction: Axis.vertical,
      onPressed: (index) {
        print("this is the index $index");
        setState(() {
          // _selectedMenu[index] = !_selectedMenu[index];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => restaurant.value != null
            ? CustomScrollView(
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
                                  child: Text(
                                    "More Information",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline,
                                          color:
                                              Color.fromRGBO(103, 121, 254, 1),
                                          fontSize: 11),
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
                                Text(
                                  "${restaurant.value!.description![userLanguage]!}",
                                  style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
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
                                    fontSize: 12,
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
                                    fontSize: 12,
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
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    "${restaurant.value!.info.location.address}",
                                    style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)))
                              ],
                            ),
                          ),
                          SizedBox(height: 25),

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
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Menu",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Theme(
                                          data: ThemeData(),
                                          child: Column(
                                            children: _buildMenuList().toList(),
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  width: Get.width,
                                  // height: Get.height,
                                  child: Column(
                                    children: [
                                      // ItemCardComponnent(),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              (SizeOfOvalImage(context) * 1) /
                                                  100,
                                        ),
                                        itemCount: 20,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ItemCardComponnent();
                                        },
                                      ),
                                    ],
                                  ),
                                ))
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
    );
  }
}
