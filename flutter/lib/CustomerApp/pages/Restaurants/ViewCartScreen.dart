import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
import 'package:mezcalmos/CustomerApp/components/appbarComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/myExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCurrentOrderScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen.dart';
import 'dart:async';

class ViewCartScreen extends GetView<RestaurantCartController> {
  Rxn<Cart> cart = Rxn();

  ViewCartScreen() {
    RestaurantCartController controller =
        Get.put<RestaurantCartController>(RestaurantCartController());
    cart = controller.cart;
  }

  @override
  Widget build(BuildContext context) {
    print("hey");
    print(cart.value?.toFirebaseFormattedJson());
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              restaurantAppBarComponent(
                "back",
                () {},
              ),
              SizedBox(
                height: 15,
              ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(65)),
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
                          child: // 2
                              Text(
                                  (cart.value?.toFirebaseFormattedJson()[
                                              "quantity"] !=
                                          null)
                                      ? "${cart.value?.toFirebaseFormattedJson()["quantity"]}"
                                      : "0",
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
              (cart.value?.toFirebaseFormattedJson()["items"] != null)
                  ? InCartWidget(
                      data: cart.value?.toFirebaseFormattedJson()["items"],
                      controller: controller,
                      resturantId: "",
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
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
                            Text(" \$40.00",
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
                            Text(
                                (cart.value?.toFirebaseFormattedJson()[
                                            "cost"] !=
                                        null)
                                    ? "  \$ ${cart.value?.toFirebaseFormattedJson()["cost"]}"
                                    : "0",
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
                    border:
                        Border.all(color: const Color(0xffececec), width: 0.5),
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
                      DropdownMenuItem(child: Text("office"), value: "office"),
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
                // function: () async {
                //   await controller.checkout();
                //   Get.to(() =>ViewCurrentRestaurantOrderScreen((),
                //       transition: Transition.rightToLeft,
                //       duration: Duration(seconds: 1));
                // },
                function: () async {
                  dynamic response = await controller.checkout();
                  if (response["status"] == "Success")
                    Get.offAll(
                        ViewCurrentRestaurantOrderScreen(response["orderId"]));
                  else {
                    print(response);
                    if (response["errorCode"] == "serverError") {
                      // do something
                    } else if (response["errorCode"] ==
                        "inMoreThanThreeOrders") {
                      // do something
                    } else if (response["errorCode"] == "restaurantClosed") {
                      // do something
                    } else {
                      // do something
                    }
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     OutlinedButton(
      //         child: Text("Clear cart"),
      //         onPressed: () {
      //           controller.clearCart();
      //         }),
      //     Obx(() {
      //       return Text(cart.value?.toFirebaseFormattedJson().toString() ??
      //           "Cart is empty");
      //     }),
      //     OutlinedButton(
      //         child: Text("Checkout"),
      //         onPressed: () async {
      //          await controller.checkout();
      //           // check status and error message
      //           Get.offAll(ViewOrderScreen());
      //         })
      //   ],
      // ),
    ));
    // // List<Item> items = restaurant.value?.items ?? [];
    // // return Column(
    // //     children: items
    // //         .map((item) => TextButton(
    // //             onPressed: () =>
    // //                 Get.to(ViewItemScreen(restaurantId, item.id!)),
    // //             child: Text(item.name!)))
    // //         .toList());
  }
}

class InCartWidget extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  final String resturantId;
  //, final CartItem cart;
  final RestaurantCartController controller;
  InCartWidget(
      {Key? key,
      required this.data,
      required this.controller,
      required this.resturantId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myWidget = [];
    data.forEach((key, value) {
      myWidget.add(
        ItemsCartWidget(
          data: data["$key"],
          restaurantID: "",
        ),
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
                        Get.defaultDialog(
                          radius: 4,
                          title: "",
                          content: Container(
                            color: const Color(0xffffffff),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.highlight_off,
                                    size: 65,
                                    color: Color(0xffdb2846),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                // Clear Cart
                                Text("Clear Cart",
                                    style: const TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 25.0),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: 8,
                                ),

                                Text("Are you sure you want \nto clear cart?",
                                    style: const TextStyle(
                                        color: const Color(0xff1d1d1d),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.0),
                                    textAlign: TextAlign.center),

                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          width: 88,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      const Color(0x2eff0000),
                                                  offset: Offset(0, 6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0)
                                            ],
                                            color: const Color(0xffdb2846),
                                          ),
                                          child: Center(
                                            child: Text("Yes",
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xffffffff),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "ProductSans",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        onTap: () {
                                          controller.clearCart();
                                          Get.back();
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        child: Container(
                                          width: 88,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      const Color(0x334c504a),
                                                  offset: Offset(0, 6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0)
                                            ],
                                            color: const Color(0xfffdfdfd),
                                          ),
                                          child: Center(
                                            child: Text("No",
                                                style: const TextStyle(
                                                    color:
                                                        const Color(0xff000000),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "ProductSans",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.back();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        );
                        //
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ] +
            myWidget,
      ),
    );
  }
}

class ItemsCartWidget extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  final String restaurantID;
  ItemsCartWidget({required this.data, required this.restaurantID});

  Rx<double> counter = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    counter.value = data["totalCost"];

    return Container(
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
              imgUrl: "${data["image"]}",
              title: "${data["name"]}",
              // subtitle: "Mushroom,Rice,Beans",
            ),
            children: choosenOneOption(data["options"]["chosenOneOptions"]) +
                choosenMannyOption(data["options"]["chosenManyOptions"]),
            onEdit: () {
              Get.to(() => ViewItemScreen.forAlreadyInCartItem(
                    CartItem(
                      new Item.itemFromData(data["id"], data as dynamic),
                      data["id"],
                    ),
                  ));
            },
          ),
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
                      counter = counter + data["costPerOne"];
                    },
                    value: data["quantity"],
                    decrement: () {
                      counter = counter - data["costPerOne"];
                    },
                  ),
                  Spacer(),
                  Obx(
                    () => Text("\$$counter",
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
                  )
                ],
              )),
        ],
      ),
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
          child: Text("${data["${key}"]["name"]}",
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
      if (data["$key"]["chosenValue"] == true) {
        myWidgets.add(
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Text("${data["${key}"]["name"]}",
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
}
