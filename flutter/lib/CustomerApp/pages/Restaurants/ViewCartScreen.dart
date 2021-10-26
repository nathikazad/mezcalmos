import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/dailogComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/myExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:intl/intl.dart';

import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartScreen extends GetView<RestaurantCartController> {
  Rxn<Cart> cart = Rxn();

  ViewCartScreen() {
    RestaurantCartController controller = Get.find<RestaurantCartController>();
    cart = controller.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: GetBuilder<RestaurantCartController>(
        // specify type as Controller
        init: RestaurantCartController(), // intialize with the Controller
        builder: (restaurant) => Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                (cart.value != null)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildCart(cart.value!),
                          SizedBox(
                            height: 15,
                          ),
                          buildItems(cart.value!.items),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Container(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Total Cost",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: Get.width,
                  height: 113,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border:
                        Border.all(color: const Color(0xffececec), width: 0.5),
                    color: const Color(0x80ffffff),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text("Delivery cost",
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                              Spacer(),
                              Text(" \$${currency.format(40.00)}",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                  ),
                                  textAlign: TextAlign.right)
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          width: Get.width,
                          height: 0.5,
                          decoration:
                              BoxDecoration(color: const Color(0xffececec))),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              // Total
                              Text("Total",
                                  style: const TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20.0),
                                  textAlign: TextAlign.left),
                              Spacer(),
                              Obx(
                                () => Text(
                                    (cart.value?.toFirebaseFormattedJson()[
                                                "cost"] !=
                                            null)
                                        ? "  \$ ${currency.format(cart.value?.toFirebaseFormattedJson()["cost"] as dynamic)}"
                                        : "0",
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0),
                                    ),
                                    textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Delivery Location",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: const Color(0xffececec), width: 0.5),
                      color: const Color(0x80ffffff)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: null,
                      isDense: true,
                      isExpanded: true,
                      hint: Text("Pick Location",
                          style: const TextStyle(
                              color: const Color(0xff000f1c),
                              fontWeight: FontWeight.w500,
                              fontFamily: "FontAwesome5Pro",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      icon: Icon(Icons.expand_more),
                      items: [
                        DropdownMenuItem(child: Text("home"), value: "home"),
                        DropdownMenuItem(
                            child: Text("office"), value: "office"),
                      ],
                      onChanged: (newValue) {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Notes",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldComponent(
                  hint: "Write Notes",
                ),
                SizedBox(
                  height: 25,
                ),
                ButtonComponent(
                    widget: Center(
                      child: Text("ORDER NOW",
                          style: GoogleFonts.sourceSansPro(
                            textStyle: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                                fontFamily: "ProductSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                          textAlign: TextAlign.center),
                    ),
                    function: () async {
                      mezDbgPrint("this has clicked");
                      dynamic response = await controller.checkout();
                      print(response["errorCode"].toString());
                      if (response["status"] == "Success")
                        Get.offNamedUntil(
                            getCurrentRestaurantOrderRoute(response["orderId"]),
                            (Route<dynamic> route) {
                          print(route.settings.name);
                          return (route.settings.name == kWrapperRoute);
                          // return route.;
                        });
                      else {
                        print(response);
                        if (response["errorCode"] == "serverError") {
                          // do something
                        } else if (response["errorCode"] ==
                            "inMoreThanThreeOrders") {
                          // do something
                        } else if (response["errorCode"] ==
                            "restaurantClosed") {
                          // do something
                        } else {
                          // do something
                        }
                      }
                    }),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCart(Cart cart) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text("Cart",
                  style: const TextStyle(
                      color: const Color(0xff1d1d1d),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 45.0),
                  textAlign: TextAlign.left),
              Spacer(),
              Stack(
                children: [
                  Opacity(
                    opacity: 0.05000000074505806,
                    child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(65)),
                            gradient: LinearGradient(
                                begin: Alignment(0.1689453125, 0),
                                end: Alignment(1, 1),
                                colors: [
                                  const Color(0xff5582ff),
                                  const Color(0xffc54efc)
                                ]))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 54,
                    height: 54,
                    child: Text(
                        (cart.quantity() != null) ? "${cart.quantity()}" : "0",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: const Color(0xff5c7fff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                child: Text("In Cart",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w700,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x33c5c5c5),
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    color: const Color(
                      0xffffffff,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 14,
                        color: Color(0xffdb2846),
                      ),
                      Text(
                        "Clear",
                        style: const TextStyle(
                            color: const Color(0xffdb2846),
                            fontWeight: FontWeight.w400,
                            fontFamily: "ProductSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  dailogComponent(
                      "Clear Cart", "Are you sure you want \nto clear cart?",
                      () {
                    controller.clearCart();
                    Get.back();
                  }, () {
                    Get.back();
                  });
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  List<Widget> choosenOneOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 15,
      )
    ];

    data.forEach((key, value) {
      myWidgets.add(MenuTitles(
        title: "${key}".toUpperCase(),
      ));

      myWidgets.add(
        Container(
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Text("${data["${key}"]}",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ProductSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0),
              textAlign: TextAlign.left),
        ),
      );
    });
    return myWidgets;
  }

  List<Widget> choosenMannyOption(Map<dynamic, dynamic> data) {
    List<Widget> myWidgets = [
      SizedBox(
        height: 15,
      ),
      MenuTitles(title: "OPTIONS"),
    ];

    data.forEach((key, value) {
      if (value == true) {
        myWidgets.add(
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Text("${key}",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 17.0),
                textAlign: TextAlign.left),
          ),
        );
      }
    });
    return myWidgets;
  }

  Widget buildItems(List<CartItem> cartItems) {
    print(cartItems.toString());
    return Column(
      children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
        var counter = element.totalCost().obs;
        print("${element.toFirebaseFunctionFormattedJson()}");
        children.add(
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0x80ffffff),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyExpensionPanelComponent(
                    child: ItemComponent(
                      imgUrl: "${element.item.image}",
                      title: "${element.item.name}",
                    ),
                    children: choosenOneOption(element.chosenOneOptions) +
                        choosenMannyOption(element.chosenManyOptions),
                    onEdit: () {
                      print(
                          " the data inside the expansion ${element.toFirebaseFunctionFormattedJson()}");
                      Get.toNamed(editCartItemRoute("${element.id}"));
                    }),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        IncrementalComponent(
                          minVal: 1,
                          increment: () {
                            counter.value =
                                counter.value + element.costPerOne();
                            print("${element.item.id}");
                            controller.changeQuantityOfItem("${element.id}", 1);
                            controller.refresh();
                          },
                          onChangedToZero: (val) {
                            if (val) {
                              dailogComponent(
                                "Delete This Item",
                                "Would you like to delete this item",
                                () => Get.back(),
                                () => Get.back(),
                              );
                            }
                          },
                          value: element.quantity,
                          decrement: () {
                            if (counter.value >= 0) {
                              counter.value =
                                  counter.value - element.costPerOne();
                              controller.changeQuantityOfItem(
                                  "${element.id}", -1);
                              controller.refresh();
                            } else {}
                          },
                        ),
                        Spacer(),
                        Obx(
                          () => Text("\$${currency.format(counter.value)}",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
        return children;
      }),
    );
  }
}
