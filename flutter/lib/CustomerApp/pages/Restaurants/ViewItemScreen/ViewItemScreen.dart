import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/ViewCartScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

import 'components/buildPanel.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
var widgetHieght = 20;
enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends StatefulWidget {
  final ViewItemScreenMode? viewItemScreenMode;
  ViewItemScreen(this.viewItemScreenMode);
  @override
  _ViewItemScreenState createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantController restaurantCartController;
  RestaurantsInfoController controller = Get.find<RestaurantsInfoController>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    mezDbgPrint("Args : ${Get.arguments.toString()}");
    mezDbgPrint("params : ${Get.parameters.toString()}");

    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantController>(RestaurantController());
    mezDbgPrint("widget.viewItemScreenMode => ${widget.viewItemScreenMode}");
    if (widget.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      String? restaurantId = Get.parameters['restaurantId'];
      mezDbgPrint("got rest id param => $restaurantId");
      String? itemId = Get.parameters['itemId'];
      mezDbgPrint("got item id param => $itemId");

      this.controller.getItem(restaurantId!, itemId!).then((value) {
        this.cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      this.cartItem.value = CartItem.clone(
          restaurantCartController.cart.value.items.firstWhere((item) {
        return item.id == Get.parameters["cartItemId"];
      }));
    }
    // scroll controller stuff !

    super.initState();
  }

  @override
  void dispose() {
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController,
          withCart: true),
      body: Obx(() => (cartItem.value?.item == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: Get.height,
                          width: Get.width,
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height * 0.45,
                                width: Get.width,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    child: handleNetworkImage(
                                        url: cartItem.value!.item.image!,
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: Get.height * 0.45,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  border: Border.all(
                                      color: const Color(0x5c707070), width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x29000000),
                                        offset: Offset(0, -2),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment(0.5, 0),
                                    end: Alignment(0.5, 0.8458111882209778),
                                    colors: [
                                      const Color(0x00000f1c),
                                      const Color(0xad000f1c),
                                      const Color(0xff000f1c)
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: Get.height * 0.34,
                                  child: Container(
                                    width: Get.width,
                                    child: Text(
                                        "${cartItem.value?.item.name![0].toUpperCase()}${cartItem.value?.item.name!.substring(1)} \$ ${currency.format(cartItem.value!.totalCost())}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            // fontWeight: FontWeight.w400,
                                            fontFamily: "psr",
                                            // fontStyle: FontStyle.normal,
                                            fontSize: 25.0.sp),
                                        textAlign: TextAlign.center),
                                  )),
                            ],
                          ),
                        )),
                        SlidingUpPanel(
                          maxHeight: Get.height * 0.87,
                          minHeight: Get.height * 0.42,
                          parallaxEnabled: true,
                          parallaxOffset: 1,
                          body: Container(
                            decoration: BoxDecoration(
                              color: Color(0x36fafafa),
                            ),
                          ),
                          panelBuilder: (_) {
                            return buildPanel(context, cartItem.value!.item,
                                cartItem, widget.viewItemScreenMode!);
                          },
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget image(String? imageLink) {
    if (imageLink != null)
      return handleNetworkImage(
        url: cartItem.value!.item.image!,
        height: 40,
      );
    //  Image.network(imageLink, height: 40);
    else
      return Center(
        child: CircularProgressIndicator(),
      );
  }

  Widget incrementQuantityButton() {
    return OutlinedButton(
        onPressed: () {
          cartItem.value!.quantity++;
          cartItem.refresh();
        },
        child: Text(cartItem.value!.quantity.toString()));
  }

  Widget addItemButton() {
    return OutlinedButton(
        child:
            Text(lang.strings['customer']['restaurant']['menu']['addToCart']),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.off(ViewCartScreen());
        });
  }

  Widget editItemButton() {
    return OutlinedButton(
        child:
            Text(lang.strings['customer']['restaurant']['menu']['modifyItem']),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.back();
        });
  }
}
