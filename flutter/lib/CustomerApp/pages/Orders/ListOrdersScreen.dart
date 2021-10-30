import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrders.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

class ListOrdersScreen extends GetView {
  LanguageController _lang = Get.find<LanguageController>();

  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  ListOrdersScreen() {
    currentOrders.value = controller.currentOrders;
    controller.currentOrdersStream.listen((event) {
      currentOrders.value = event;
    });
    pastOrders.value = controller.pastOrders;
    controller.pastOrdersStream.listen((event) => pastOrders.value = event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Orders"),
        ),
        body: buildOrders());
  }

  Widget buildOrders() {
    return ListView(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: const Color(0xffe8f5ec),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => Text(_lang.strings["customer"]["orders"]["inProcess"],
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w700,
                          fontFamily: "psr",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0xffffffff),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TowAvatars(),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Garry Nolan",
                                      style: const TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                              Text(
                                "7:46AM",
                                style: const TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 12,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(" 212 Aveni",
                                      style: TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0)),
                                ),
                              ),
                              Text("\$15.00",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.0),
                                  ),
                                  textAlign: TextAlign.right)
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0xffffffff),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TowAvatars(),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("Garry Nolan",
                                      style: const TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                              Text(
                                "7:46AM",
                                style: const TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "ProductSans",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 12,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(" 212 Aveni",
                                      style: TextStyle(
                                          color: const Color(0xff000f1c),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "ProductSans",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0)),
                                ),
                              ),
                              Text("\$15.00",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        color: const Color(0xff000f1c),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13.0),
                                  ),
                                  textAlign: TextAlign.right)
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
