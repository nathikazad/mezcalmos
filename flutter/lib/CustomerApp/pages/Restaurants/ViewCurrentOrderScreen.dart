import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/basicCellComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buildWidgetOnOrderStatus.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/CancelAlertDailog.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
////////////===========

class ViewCurrentRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewCurrentRestaurantOrderScreenState createState() =>
      _ViewCurrentRestaurantOrderScreenState();
}

class _ViewCurrentRestaurantOrderScreenState
    extends State<ViewCurrentRestaurantOrderScreen> with MezDisposable {
  LanguageController lang = Get.find<LanguageController>();
  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  SideMenuDraweController _sideMenuDraweController =
      Get.find<SideMenuDraweController>();
  // RxBool hasNewMessages = false.obs;
  @override
  void initState() {
    super.initState();
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    try {
      mezDbgPrint(" ==> Order id param ========> $orderId");
      mezDbgPrint(
          " Len of currentOrders ==> ${controller.currentOrders.length}");

      order.value = controller.currentOrders.firstWhere((order) {
        return order.orderId == orderId;
      }) as RestaurantOrder;
    } on StateError catch (_) {
      // do nothing
    }
    controller.getCurrentOrderStream(orderId).listen((event) {
      if (event != null) {
        order.value = event as RestaurantOrder;
      }
    }).canceledBy(this);

    mezDbgPrint("=========> ${order.value}");
  }

  Widget NotesWidget() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(lang.strings['customer']['restaurant']['menu']['notes'],
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
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0x80ffffff),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(order.value!.notes!,
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
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    mezDbgPrint(order.value!.restaurantOrderStatus);
    mezDbgPrint(order.value!.serviceProviderId);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: GetBuilder<OrderController>(builder: (mycontoller) {
        return Container(
          height: Get.height,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
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
                      BasicCellComponent(
                        url: "${order.value!.restaurant.image}",
                        title: "${order.value!.restaurant.name}",
                        traillingIcon: Container(
                          child: IconButton(
                              icon: Icon(
                                Icons.chat_bubble_outline,
                                color: Color(0xff5c7fff),
                              ),
                              onPressed: () {
                                //TODO: Navigate to messages screen
                                Get.toNamed(getRestaurantMessagesRoute(
                                    order.value!.orderId));
                              }),
                        ),
                      ),
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
                          child: Obx(() => buildWigetOnOrderStatus(
                              order.value!.restaurantOrderStatus,
                              order.value!.orderTime)),
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
                          order.value!.to == null
                              ? lang.strings['shared']['placeHolders']['home']
                              : order.value!.to.address,
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
                order.value?.notes == null || order.value!.notes!.length <= 0
                    ? SizedBox()
                    : NotesWidget(),
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
                              lang.strings['customer']['restaurant']['checkout']
                                      ['cancel']
                                  .toString()
                                  .toUpperCase(),
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontFamily: "psb",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                    ),
                  ),
                  onTap: () async {
                    bool yesNoRes = await cancelAlertDailog(
                        lang.strings['customer']['restaurant']['checkout']
                            ['cancelOrder'],
                        lang.strings['customer']['restaurant']['checkout']
                            ['cancelOrderConfirm'], () {
                      Get.back(result: true);
                    }, () {
                      Get.back(result: false);
                    });

                    if (yesNoRes) {
                      mezDbgPrint(Get.parameters.toString());
                      ServerResponse resp = await controller
                          .cancelOrder(Get.parameters['orderId']!);
                      mezDbgPrint(resp.data.toString());
                      if (resp.success) {
                        Get.until((route) => route.settings.name == kHomeRoute);
                      } else {
                        mezcalmosSnackBar("Error", resp.errorMessage!);
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      }),
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
                      child: BasicCellComponent(
                        title: "${element.name.inCaps}",
                        url: "${element.image}",
                        traillingIcon: Container(
                          width: 25,
                          height: 25,
                          child: Text("${element.quantity}",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(65)),
                              gradient: LinearGradient(
                                  begin: Alignment(0.1689453125, 0),
                                  end: Alignment(1, 1),
                                  colors: [
                                    const Color(0xff5582ff)
                                        .withOpacity(0.05000000074505806),
                                    const Color(0xffc54efc)
                                        .withOpacity(0.05000000074505806)
                                  ])),
                        ),
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
