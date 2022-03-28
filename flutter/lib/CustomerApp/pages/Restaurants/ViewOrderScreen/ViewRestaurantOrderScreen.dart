import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

import 'components/OrderFooterCard.dart';
import 'components/OrderStatusCard.dart';
import 'components/OrderSummaryCard.dart';
import 'components/OrdersItemsCard.dart';
import 'components/notesWidget.dart';

final currency = new NumberFormat("#0", "en_US");
////////////===========
dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
["Restaurants"]["ViewOrderScreen"]["ViewRestaurantOrderScreen"];


class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreenState createState() =>
      _ViewRestaurantOrderScreenState();
}

class _ViewRestaurantOrderScreenState extends State<ViewRestaurantOrderScreen> {
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
    super.initState();

    String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    if (order.value == null) {
      //Get.back();
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
            controller.getPastOrderStream(orderId).listen((event) {
              if (event != null) {
                mezDbgPrint("the past order is ========== $event ==========");
                order.value = event as RestaurantOrder;
              } else {
                mezDbgPrint("the past order is ========== 'empty' ==========");
              }
            });
            order.value = controller.getOrder(orderId) as RestaurantOrder?;
          }
        });
      }
      //mezDbgPrint("=========> ${order.value}");
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ViewRestaurantOrderScreen oldWidget) {
    String orderId = Get.parameters['orderId']!;
    super.didUpdateWidget(oldWidget);
    mezDbgPrint("this widget is updated");
    if (order.value == null) {
      order.value = controller.getOrder(orderId) as RestaurantOrder?;
    }
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
          title:
              '${_i18n()["orderStatus"]}',
        ),
        body: Obx(
          () {
            if (order.value != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      OrderStatusCard(
                        order: order.value!,
                        ordersStates: order.value!.status,
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      OrderItemsCard(
                        items: order.value!.items,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderSummaryCard(order: order.value!),
                      //===============================>notes========================>
                      order.value?.notes == null ||
                              order.value!.notes!.length <= 0
                          ? Container()
                          : notesWidget(order),
                      //===============================>button cancel===========================
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: OrderFooterCard(order: order.value!)),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

