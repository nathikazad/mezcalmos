import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();
  LanguageController _lang = Get.find<LanguageController>();
  // RxList<Order> currentOrders = RxList.empty();
  // RxList<Order> pastOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  AuthController auth = Get.find<AuthController>();
  // StreamSubscription? currentOrdersListener;
  // StreamSubscription? pastOrdersListener;

  @override
  initState() {
    mezDbgPrint("ListOrdersScreen: onInit");
    // currentOrders.value = controller.currentOrders;
    // currentOrdersListener = controller.currentOrders.stream.listen((_) {
    //   currentOrders.value = controller.currentOrders;
    // });
    // pastOrders.value = controller.pastOrders;
    // pastOrdersListener = controller.pastOrders.stream.listen((_) {
    //   pastOrders.value = controller.pastOrders;
    // });

    super.initState();
  }

  @override
  void dispose() {
    // currentOrdersListener?.cancel();
    // currentOrdersListener = null;
    // pastOrdersListener?.cancel();
    // pastOrdersListener = null;
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "ListOrdersScreen: build the length of past orders is ${controller.pastOrders.value.length} and the length of inprosses is ${controller.currentOrders.value.length}");
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text("List Orders"),
        // ),
        appBar: customerAppBar(
          AppBarLeftButtonType.Back,
          _popUpController,
          empty: true,
        ),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Obx(() => buildInProcessOrders()),
                SizedBox(height: 20),
                Obx(() => buildPastOrders())
              ],
            )));
  }

  Widget buildInProcessOrders() {
    List<Widget> inProcessOrdersWidget = [
      DateTitleComponent(
        date: "In Process",
      ),
    ];
    controller
        .currentOrders()
        .sort((a, b) => b.orderTime.compareTo(a.orderTime));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(1, 1),
            blurRadius: 6,
            spreadRadius: 0)
      ], color: const Color(0xffe8f5ec)),
      child: Column(
          children: controller.currentOrders().fold<List<Widget>>(
        <Widget>[],
        (children, order) {
          inProcessOrdersWidget.add(OrderCardComponenet(
            title: order.serviceProvider!.name,
            subTitle: order.to.address,
            date:
                "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
            price: "${currency.format(order.cost)}",
            type: order.orderType,
            url: order.serviceProvider!.image,
            onPress: () {
              Get.toNamed(getRestaurantOrderRoute(order.orderId));
            },
          ));
          children = inProcessOrdersWidget;
          return children;
        },
      )),
    );
  }

  Widget buildPastOrders() {
    var dd = DateTime.now().toLocal();
    List<Widget> pastOrdersWidget = [];
    controller.pastOrders().sort((a, b) => b.orderTime.compareTo(a.orderTime));
    return Column(
      children: controller.pastOrders().fold<List<Widget>>(<Widget>[],
          (children, order) {
        checkTime(order.orderTime);
        mezDbgPrint(order.serviceProvider!.name);
        if (dd.isSameDate(order.orderTime)) {
          pastOrdersWidget.add(
            OrderCardComponenet(
              title: order.serviceProvider!.name,
              subTitle: order.to.address,
              date:
                  "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
              price: "${currency.format(order.cost)}",
              type: order.orderType,
              url: order.serviceProvider!.image,
              onPress: () {
                Get.toNamed(getRestaurantOrderRoute(order.orderId));
              },
            ),
          );
        } else {
          dd = order.orderTime.toLocal();
          pastOrdersWidget.add(
            DateTitleComponent(
              date: "${f.format(dd)}",
              dateIcon: FaIcon(
                FontAwesomeIcons.calendarAlt,
                size: 12,
              ),
            ),
          );

          if (dd.isSameDate(order.orderTime.toLocal())) {
            pastOrdersWidget.add(
              OrderCardComponenet(
                title: order.serviceProvider!.name,
                subTitle: order.to.address,
                date:
                    "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
                price: "${currency.format(order.cost)}",
                type: order.orderType,
                url: order.serviceProvider!.image,
                onPress: () {
                  Get.toNamed(getRestaurantOrderRoute(order.orderId));
                },
              ),
            );
          }
        }

        children = pastOrdersWidget;
        return children;
      }),
    );
  }
}

String checkTime(DateTime date) {
  var d = DateTime.now();
  if (d.difference(date).inDays == 0) {
    mezDbgPrint("Today");
    return "Today";
  } else {
    mezDbgPrint("${f.format(date)}");
    return "${f.format(date)}";
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class TowAvatars extends StatelessWidget {
  final OrderType type;
  final String url;
  TowAvatars({required this.type, required this.url, Key? key})
      : super(key: key);
  var widget = null;
  var color = null;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OrderType.Restaurant:
        //to do
        widget = FoodImage(
          sw: 20,
          sh: 20,
        );
        color = const Color(0xff5582ff).withOpacity(0.25);
        break;
      case OrderType.Taxi:
        //to do
        widget = TaxiImage(
          sw: 20,
          sh: 20,
        );
        color = Color(0xfffceb4d).withOpacity(0.25);
        break;
      default:
    }
    return Container(
      //color: Colors.red,
      width: 70,
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: color,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: widget,
              ),
            ),
          ),
          Positioned(
            left: 27,
            child: Container(
              width: 40,
              height: 40,
              child: ClipOval(
                  child: handleNetworkImage(url: url, fit: BoxFit.cover)
                  //     Image.network(
                  //   "$url",
                  //   fit: BoxFit.cover,
                  // )
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderCardComponenet extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;
  final String price;
  final OrderType type;
  final String url;
  GestureTapCallback? onPress;
  OrderCardComponenet(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.price,
      required this.type,
      required this.url,
      this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: Get.width,
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xffececec), width: 0.5),
              color: const Color(0xffffffff),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TowAvatars(
                    type: type,
                    url: "$url",
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text("$title",
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
                            "$date",
                            // "${ff.format(element.orderTime)}",
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
                            MezcalmosIcons.map_marker,
                            size: 12,
                          ),
                          Expanded(
                            child: Container(
                              child: Text("$subTitle",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: const Color(0xff000f1c),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProductSans",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0)),
                            ),
                          ),
                          Text("\$$price",
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
          onTap: onPress,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
