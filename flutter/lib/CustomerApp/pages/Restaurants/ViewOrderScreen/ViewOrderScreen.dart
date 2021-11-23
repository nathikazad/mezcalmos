import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/basicCellComponent.dart';
import 'package:mezcalmos/CustomerApp/components/buildWidgetOnOrderStatus.dart';
import 'package:mezcalmos/CustomerApp/components/customerAppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/CancelAlertDailog.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';

import 'components/buildOrdersItem.dart';
import 'components/notesWidget.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
////////////===========

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
  MyPopupMenuController _popUpController = MyPopupMenuController();

  LanguageController lang = Get.find<LanguageController>();
  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _currentOrderListener;
  StreamSubscription? _pastShownOrder;

  bool _clickedButton = false;

  Future<void> onTapButtonsShowLoading(Function function) async {
    if (!_clickedButton) {
      // set true to show loading button
      setState(() {
        _clickedButton = true;
      });

      await function();

      // after function done set to back to false
      setState(() {
        _clickedButton = false;
      });
    }
  }

  Widget getWidgetOrShowLoading(Widget desiredWidget) {
    if (!_clickedButton) {
      return desiredWidget;
    } else {
      return Container(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      );
    }
  }

  @override
  void initState() {
    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    if (order.value == null) {
      Get.back();
    } else {
      if (order.value!.inProcess()) {
        _pastShownOrder =
            controller.getPastOrderStream(orderId).listen((event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as RestaurantOrder).restaurantOrderStatus.toString());
            order.value = event;
          }
        });
        _currentOrderListener =
            controller.getCurrentOrderStream(orderId).listen((event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as RestaurantOrder).restaurantOrderStatus.toString());
            order.value = event;
          }
        });
      } else {}

      //mezDbgPrint("=========> ${order.value}");
    }
    super.initState();
  }

  @override
  void dispose() {
    _currentOrderListener?.cancel();
    _pastShownOrder?.cancel();
    _currentOrderListener = null;
    _pastShownOrder = null;

    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    mezDbgPrint(order.value?.restaurantOrderStatus);
    mezDbgPrint(order.value?.serviceProviderId);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: customerAppBar(AppBarLeftButtonType.Back, _popUpController),
      body:
          //  GetBuilder<OrderController>(builder: (mycontoller) {
          //   return
          Container(
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
                        child: Stack(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.chat_bubble_outline,
                                  color: Color(0xff5c7fff),
                                ),
                                onPressed: () {
                                  //TODO: Navigate to messages screen
                                  Get.toNamed(getRestaurantMessagesRoute(
                                      order.value!.orderId));
                                }),
                            Positioned(
                                left: 28,
                                top: 10,
                                child: Obx(
                                  () => (controller
                                          .orderHaveNewMessageNotifications(
                                              order.value!.orderId))
                                      ? Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xfff6efff),
                                                  width: 2),
                                              color: const Color(0xffff0000)))
                                      : Container(),
                                ))
                          ],
                        ),
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
                          child: Obx(
                            () => buildWigetOnOrderStatus(
                                    order.value!.restaurantOrderStatus,
                                    order.value!.orderTime)
                                .value!,
                          )),
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
                  : notesWidget(order),
              //===============================>button cancel===========================
              Obx(() => order.value!.inProcess() &&
                      order.value!.restaurantOrderStatus ==
                          RestaurantOrderStatus.OrderReceieved
                  ? InkWell(
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
                            end: Alignment(
                                1.1447703838348389, 1.1694844961166382),
                            colors: [
                              const Color(0xede21132),
                              const Color(0xdbd11835)
                            ],
                          ),
                        ),
                        child: Center(
                          child: // CANCEL
                              getWidgetOrShowLoading(Text(
                                  lang.strings['customer']['restaurant']
                                          ['checkout']['cancel']
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: const Color(0xffffffff),
                                      fontFamily: "psb",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center)),
                        ),
                      ),
                      onTap: () async =>
                          await onTapButtonsShowLoading(() async {
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
                            Get.until(
                                (route) => route.settings.name == kHomeRoute);
                            mezcalmosSnackBar(
                                lang.strings["shared"]["snackbars"]
                                    ["titleSuccess"],
                                lang.strings["shared"]["snackbars"]
                                    ["orderCancelSuccess"],
                                position: SnackPosition.TOP);
                          } else {
                            mezcalmosSnackBar(
                                lang.strings["shared"]["snackbars"]
                                    ["titleFailed"],
                                lang.strings["shared"]["snackbars"]
                                    ["orderCancelFailed"],
                                position: SnackPosition.TOP);
                          }
                        }
                      }),
                    )
                  : SizedBox()),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        // );
        // }
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
