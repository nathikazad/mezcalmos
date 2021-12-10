import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MyAppBarPopUp.dart';
import 'components/DriverOrderCard.dart';
import 'components/OrderDetailsCard.dart';
import 'components/OrderFooterCard.dart';
import 'components/OrderStatusCard.dart';
import 'components/OrderSummaryCard.dart';
import 'components/OrdersItemsCard.dart';
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
  RestaurantController restaurantController = Get.find<RestaurantController>();
  StreamSubscription? _orderListener;

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
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as RestaurantOrder).status.toString());
            order.value = event;
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            order.value = controller.getOrder(orderId) as RestaurantOrder?;
          }
        });
      }
      //mezDbgPrint("=========> ${order.value}");
    }
    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    _popUpController.hideMenu();
    _popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    responsiveSize(context);
    mezDbgPrint(order.value?.status);
    mezDbgPrint(order.value?.serviceProviderId);
    return Scaffold(
        appBar: CustomerAppBar(
          autoBack: true,
          title: 'Order',
        ),
        body: Obx(
          () => (order.value != null)
              ? SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Order Satus',
                            style: txt.headline3,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        OrderStatusCard(
                          order: order.value!,
                          ordersStates: order.value!.status,
                          helperText: '',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DriverOrderCard(
                            helperText: '',
                            ordersStates: order.value!.status,
                            order: order.value!),
                        SizedBox(
                          height: 30.h,
                        ),
                        OrderItemsCard(
                          items: order.value!.items,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        OrderDetailsCard(order: order.value!),
                        SizedBox(
                          height: 10.h,
                        ),
                        OrderSummaryCard(order: order.value!),

                        //===============================>notes========================>
                        order.value?.notes == null ||
                                order.value!.notes!.length <= 0
                            ? SizedBox()
                            : notesWidget(order),
                        //===============================>button cancel===========================
                        SizedBox(
                          height: 10.h,
                        ),
                        OrderFooterCard(order: order.value!),
                        // Container(
                        //   child: Obx(() => order.value!.inProcess() &&
                        //           order.value!.restaurantOrderStatus ==
                        //               RestaurantOrderStatus.OrderReceieved
                        //       ? Container(
                        //           margin: EdgeInsets.all(8),
                        //           child: TextButton(
                        //               onPressed: () async {
                        //                 await onTapButtonsShowLoading(() async {
                        //                   bool yesNoRes =
                        //                       await cancelAlertDailog(
                        //                           lang.strings['customer']
                        //                                       ['restaurant']
                        //                                   ['checkout']
                        //                               ['cancelOrder'],
                        //                           lang.strings['customer']
                        //                                       ['restaurant']
                        //                                   ['checkout']
                        //                               ['cancelOrderConfirm'],
                        //                           () {
                        //                     Get.back(result: true);
                        //                   }, () {
                        //                     Get.back(result: false);
                        //                   });

                        //                   if (yesNoRes) {
                        //                     mezDbgPrint(
                        //                         Get.parameters.toString());
                        //                     ServerResponse resp =
                        //                         await restaurantController
                        //                             .cancelOrder(Get.parameters[
                        //                                 'orderId']!);
                        //                     mezDbgPrint(resp.data.toString());
                        //                     if (resp.success) {
                        //                       Get.until((route) =>
                        //                           route.settings.name ==
                        //                           kHomeRoute);
                        //                       mezcalmosSnackBar(
                        //                           lang.strings["shared"]
                        //                                   ["snackbars"]
                        //                               ["titleSuccess"],
                        //                           lang.strings["shared"]
                        //                                   ["snackbars"]
                        //                               ["orderCancelSuccess"],
                        //                           position: SnackPosition.TOP);
                        //                     } else {
                        //                       mezcalmosSnackBar(
                        //                           lang.strings["shared"]
                        //                                   ["snackbars"]
                        //                               ["titleFailed"],
                        //                           lang.strings["shared"]
                        //                                   ["snackbars"]
                        //                               ["orderCancelFailed"],
                        //                           position: SnackPosition.TOP);
                        //                     }
                        //                   }
                        //                 });
                        //               },
                        //               style: TextButton.styleFrom(
                        //                   backgroundColor: Colors.black),
                        //               child: Container(
                        //                 alignment: Alignment.center,
                        //                 child: Text('Cancel order'),
                        //               )),
                        //         )
                        //       : (order.value!.restaurantOrderStatus ==
                        //                   RestaurantOrderStatus.Delivered ||
                        //               order.value!.restaurantOrderStatus ==
                        //                   RestaurantOrderStatus.ReadyForPickup)
                        //           ? Card(
                        //               child: Container(
                        //                 alignment: Alignment.center,
                        //                 margin: EdgeInsets.all(16),
                        //                 child: Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: [
                        //                     Icon(
                        //                       Icons.check_circle,
                        //                       color: Colors.green,
                        //                     ),
                        //                     SizedBox(
                        //                       width: 10,
                        //                     ),
                        //                     Text(
                        //                       'Order Delivered',
                        //                       style: txt.headline3,
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             )
                        //           : (order.value!.restaurantOrderStatus ==
                        //                       RestaurantOrderStatus
                        //                           .CancelledByCustomer ||
                        //                   order.value!.restaurantOrderStatus ==
                        //                       RestaurantOrderStatus
                        //                           .CancelledByAdmin)
                        //               ? Card(
                        //                   color: Colors.black,
                        //                   child: Container(
                        //                     alignment: Alignment.center,
                        //                     margin: EdgeInsets.all(16),
                        //                     child: Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         Icon(
                        //                           Icons.cancel,
                        //                           color: Colors.red,
                        //                         ),
                        //                         SizedBox(
                        //                           width: 10,
                        //                         ),
                        //                         Text(
                        //                           'Order Canceled',
                        //                           style: txt.headline3!
                        //                               .copyWith(
                        //                                   color: Colors.white),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 )
                        //               : Container()),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              : CircularProgressIndicator(),
        ));
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
