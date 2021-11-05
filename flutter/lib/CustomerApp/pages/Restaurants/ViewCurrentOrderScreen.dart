import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/dailogComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:rive/rive.dart' as rive;
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
final f = new DateFormat('dd/MM/yyyy HH:mm');

////////////===========

class ViewCurrentRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewCurrentRestaurantOrderScreenState createState() =>
      _ViewCurrentRestaurantOrderScreenState();
}

class _ViewCurrentRestaurantOrderScreenState
    extends State<ViewCurrentRestaurantOrderScreen> {
  LanguageController lang = Get.find<LanguageController>();
  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  SideMenuDraweController _sideMenuDraweController =
      Get.find<SideMenuDraweController>();

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    try {
      order.value = controller.currentOrders
              .firstWhere((element) => element.orderId == orderId)
          as RestaurantOrder;
    } on StateError {
      //do nothing
    }
    controller.getCurrentOrderStream(orderId).listen((order) {
      mezDbgPrint("ViewCurrentOrderScreen: new order data");

      this.order.value = order as RestaurantOrder;
    });
    mezDbgPrint("=========> ${order.value}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    if (order.value == null) {
      mezDbgPrint("Order not loaded yet");
      return Scaffold(
          body: MezLogoAnimation(
        centered: true,
      ));
    }

    mezDbgPrint(order.value?.restaurantOrderStatus);
    mezDbgPrint(order.value?.serviceProviderId);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: GetBuilder<OrderController>(builder: (mycontoller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              //===================================>prepering orders===========================
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0x9affffff),
                ),
                child: Column(
                  children: [
                    CheckoutInfoComponent(
                        url: "${order.value!.restaurant.image}",
                        title: "${order.value!.restaurant.name}"),
                    Container(
                      width: Get.width,
                      height: 1,
                      decoration: BoxDecoration(
                        color: const Color(0xffececec),
                      ),
                    ),
                    Container(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Obx(() => _buildWigetOnOrderStatus(
                            order.value!.restaurantOrderStatus)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //=================================>Orders Items=============================>
              //Order Items
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                    "${lang.strings['customer']['restaurant']['checkout']['orderItems']}",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w700,
                        fontFamily: "psb",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 10,
              ),
              buildOrdersItems(order.value!.items),
              SizedBox(
                height: 15,
              ),
              //==========================>total cost=====================================

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                    "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
                    style: TextStyle(
                        color: const Color(0xff000f1c),
                        fontFamily: "psb",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
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
                            Text(
                                "${lang.strings['customer']['restaurant']['cart']['deliveryCost']}",
                                style: const TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Spacer(),
                            Text(" \$40.00",
                                style: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psb",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0.sp),
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
                            Text(
                                "${lang.strings['customer']['restaurant']['cart']['total']}",
                                style: const TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psr",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.left),
                            Spacer(),
                            Text("  \$${currency.format(order.value!.cost)}",
                                style: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psb",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0.sp),
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
              //===================================>Delivery Location==========================>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                    "${lang.strings['customer']['restaurant']['cart']['deliveryLocation']}",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontFamily: "psb",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0x80ffffff),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      MezcalmosIcons.map_marker,
                      size: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: Get.width * 0.75,
                      child: Text(
                        order.value!.from == null
                            ? "Home"
                            : "${order.value!.from["address"]}",
                        style: const TextStyle(
                            color: const Color(0xff000f1c),
                            fontFamily: "psr",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //===============================>notes========================>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                    "${lang.strings['customer']['restaurant']['menu']['notes']}",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontFamily: "psb",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0x80ffffff),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      order.value!.notes == null
                          ? "Nothing"
                          : "${order.value!.notes} ",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontFamily: "psr",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //===============================>button cancel===========================
              InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x332362f1),
                          offset: Offset(0, 6),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    gradient: LinearGradient(
                      begin: Alignment(-0.10374055057764053, 0),
                      end: Alignment(1.1447703838348389, 1.1694844961166382),
                      colors: [
                        const Color(0xede21132),
                        const Color(0xdbd11835)
                      ],
                    ),
                  ),
                  child: Center(
                    child: // CANCEL
                        Text(
                            "${lang.strings['customer']['restaurant']['checkout']['cancel'].toString().toUpperCase()}",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontFamily: "psb",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center),
                  ),
                ),
                onTap: () {
                  dailogComponent("Cancel Order",
                      "Are you sure you want to cancel this order?", () {
                    controller.cancelOrder(Get.parameters['orderId']!);

                    Get.back();
                  }, () {
                    Get.back();
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }),
    );
    // List<Item> items = restaurant.value?.items ?? [];
    // return Column(
    //     children: items
    //         .map((item) => TextButton(
    //             onPressed: () =>
    //                 Get.to(ViewItemScreen(restaurantId, item.id!)),
    //             child: Text(item.name!)))
    //         .toList());
  }

  Widget _buildWigetOnOrderStatus(RestaurantOrderStatus status) {
    // to do
    // check the status of each
    Widget? myWidget;
    switch (status) {
      case RestaurantOrderStatus.PreparingOrder:
        mezDbgPrint("PreparingOrder");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 61,
              height: 35,
              child: rive.RiveAnimation.asset(
                "assets/animation/cooking.riv",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text("Preparing the order",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            )
          ],
        );
        break;
      case RestaurantOrderStatus.ReadyForPickup:
        mezDbgPrint("ReadyForPickup");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 61,
                height: 35,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                )),
            Container(
              child: Text("Ready For Pickup",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            )
          ],
        );
        break;
      case RestaurantOrderStatus.OnTheWay:
        mezDbgPrint("OnTheWay");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text("On The Way",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            ),
            Container(
              width: 61,
              height: 35,
              child: rive.RiveAnimation.asset(
                "assets/animation/CookingandDelivery2.riv",
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
        break;
      case RestaurantOrderStatus.Delivered:
        var xDate = f.format(order.value!.orderTime).toString().split(" ");
        mezDbgPrint("Delivered");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                child: Icon(
              Icons.check_circle,
              color: Colors.green,
            )),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                  "Delivered ${xDate[0]} ${xDate[2]}${xDate[3].toLowerCase()}",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontFamily: "prs",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            )
          ],
        );
        break;
      case RestaurantOrderStatus.OrderReceieved:
        var xDate = f.format(order.value!.orderTime).toString().split(" ");
        mezDbgPrint("Order Receieved");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                child: Icon(
              Icons.check_circle,
              color: Colors.green,
            )),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                  "Receieved ${xDate[0]} ${xDate[2]}${xDate[3].toLowerCase()}",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontFamily: "prs",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            )
          ],
        );
        break;
      case RestaurantOrderStatus.Cancelled:
        mezDbgPrint("Cancelled");
        myWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 61,
                height: 35,
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.red,
                )),
            Container(
              child: Text("Cancelled",
                  style: const TextStyle(
                      color: const Color(0xff7e7a7a),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            )
          ],
        );
        break;
      default:
    }
    return Container(
      child: myWidget!,
    );
  }
}

class CheckoutInfoComponent extends StatelessWidget {
  final String url;
  final String title;
  final bool? isMessageIcon;
  final int? quantity;
  const CheckoutInfoComponent(
      {required this.url,
      required this.title,
      this.isMessageIcon = true,
      this.quantity,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 43,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
              child: Image.network(
                "$url",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Expanded(
              child: Container(
            child: Text("$title",
                style: const TextStyle(
                    color: const Color(0xff000f1c),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProductSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.left),
          )),
          (isMessageIcon == true)
              ? Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Color(0xff5c7fff),
                    ),
                    onPressed: () {},
                  ),
                )
              : Container(
                  width: 25,
                  height: 25,
                  child: Text("$quantity",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: const Color(0xff5c7fff),
                        fontWeight: FontWeight.w400,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(65)),
                      gradient: LinearGradient(
                          begin: Alignment(0.1689453125, 0),
                          end: Alignment(1, 1),
                          colors: [
                            const Color(0xff5582ff)
                                .withOpacity(0.05000000074505806),
                            const Color(0xffc54efc)
                                .withOpacity(0.05000000074505806)
                          ]))),
        ],
      ),
    );
  }
}

Widget buildOrdersItems(List<RestaurantOrderItem> items) {
  return Container(
      child: Column(
    children: items.fold<List<Widget>>(<Widget>[], (children, element) {
      children.add(
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: const Color(0xffececec), width: 0.5),
                color: const Color(0x9affffff),
              ),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      //height: 43,
                      child: CheckoutInfoComponent(
                        title: "${element.name.inCaps}",
                        url: "${element.image}",
                        isMessageIcon: false,
                        quantity: element.quantity,
                      )),
                  Container(
                    width: Get.width,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xffececec),
                    ),
                  ),
                  Container(
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 15, bottom: 15),
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text("\$${currency.format(element.totalCost)}",
                              style: TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontFamily: "psb",
                                  fontSize: 20.0.sp),
                              textAlign: TextAlign.right)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      );
      return children;
    }),
  ));
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
