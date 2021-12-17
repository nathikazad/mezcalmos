import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: CustomerAppBar(
          autoBack: true,
          title: 'Order status',
        ),
        body: Obx(
          () => (order.value != null)
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        OrderStatusCard(
                          order: order.value!,
                          ordersStates: order.value!.status,
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        OrderItemsCard(
                          items: order.value!.items,
                        ),

                        SizedBox(
                          height: 2,
                        ),
                        OrderSummaryCard(order: order.value!),

                        //===============================>notes========================>
                        order.value?.notes == null ||
                                order.value!.notes!.length <= 0
                            ? SizedBox()
                            : notesWidget(order),
                        //===============================>button cancel===========================

                        SizedBox(height: 20),
                        Container(
                            alignment: Alignment.center,
                            child: OrderFooterCard(order: order.value!)),
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
