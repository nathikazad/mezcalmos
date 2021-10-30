import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends GetView {
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  AuthController auth = Get.find<AuthController>();
  ListOrdersScreen() {
    currentOrders.value = controller.currentOrders;
    controller.getCurrentOrders().listen((event) {
      currentOrders.value = event;
    });
    controller.getPastOrders().listen((event) => pastOrders.value = event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("List Orders"),
        // ),
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "back",
          () => Get.back(),
        ),
        body: Obx(() {
          return SingleChildScrollView(child: buildOrders());
        }));
  }

  Widget buildOrders() {
    var dd = DateTime.now();
    List<Widget> todayList = [
      DateTitleComponent(date: "Today", showIcon: false),
    ];
    currentOrders.value.sort((a, b) => b.orderTime.compareTo(a.orderTime));
    return Column(
      children: currentOrders.value.fold<List<Widget>>(<Widget>[],
          (children, element) {
        checkTime(element.orderTime);
        mezDbgPrint(element.orderTime);
        if (dd.isSameDate(element.orderTime)) {
          todayList.add(
            OrderCardComponenet(
              title: "${auth.user!.displayName}",
              subTitle: "Home",
              date:
                  "${DateFormat.jm().format(DateFormat("hh:mm").parse("${element.orderTime.hour}:${element.orderTime.minute}"))}",
              price: "${currency.format(element.cost)}",
              type: element.orderType,
              url: "${auth.user!.image}",
              onPress: () {
                Get.toNamed(getCurrentRestaurantOrderRoute(element.orderId));
              },
            ),
          );
        } else {
          dd = element.orderTime;
          mezDbgPrint(dd.toString() + "kkkk");
          todayList.add(
            DateTitleComponent(
              date: "${f.format(dd)}",
            ),
          );

          if (dd.isSameDate(element.orderTime)) {
            todayList.add(
              OrderCardComponenet(
                title: "${auth.user!.displayName}",
                subTitle: "Home",
                date:
                    "${DateFormat.jm().format(DateFormat("hh:mm").parse("${element.orderTime.hour}:${element.orderTime.minute}"))}",
                price: "${currency.format(element.cost)}",
                type: element.orderType,
                url: "${auth.user!.image}",
                onPress: () {
                  Get.toNamed(getCurrentRestaurantOrderRoute(element.orderId));
                  mezDbgPrint("hhhhhhhhhhhhhh");
                },
              ),
            );
          }
        }

        children = todayList;
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
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(child: Image.network("$url")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class DateTitleComponent extends StatelessWidget {
  final String date;
  final bool? showIcon;
  const DateTitleComponent({required this.date, this.showIcon = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              (showIcon!)
                  ? FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      size: 12,
                    )
                  : Container(),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text("$date",
                    style: const TextStyle(
                        color: const Color(0xff000f1c),
                        fontWeight: FontWeight.w700,
                        fontFamily: "ProductSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              )
            ],
          ),
          SizedBox(
            height: 10,
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
