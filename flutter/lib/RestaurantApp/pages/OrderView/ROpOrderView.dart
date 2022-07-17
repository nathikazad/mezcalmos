import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderCustomer.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderEstTime.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderHandleButton.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderNote.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderStatusCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrderView/components/ROpOrderSummaryCard.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
//     ['OrderView']['ROpOrderView'];

class ROpOrderView extends StatefulWidget {
  const ROpOrderView({Key? key}) : super(key: key);

  @override
  State<ROpOrderView> createState() => _ROpOrderViewState();
}

class _ROpOrderViewState extends State<ROpOrderView> {
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();
  ROpOrderController controller = Get.find<ROpOrderController>();
  StreamSubscription? _orderListener;
  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder;
    _orderListener = controller
        .getOrderStream(orderId)
        .listen((RestaurantOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;

        order.refresh();
      }
    });

    waitForOrderIfNotLoaded().then((void value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future<Null>.delayed(Duration.zero, () {
          Get.back<Null>();
          MezSnackbar("Error", "Order does not exist");
        });
      }
    });
  }

  Future<void> waitForOrderIfNotLoaded() {
    if (order.value != null) {
      return Future<void>.value(null);
    } else {
      final Completer<void> completer = Completer<void>();
      Timer(Duration(seconds: 5), () {
        completer.complete();
      });
      return completer.future;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back,
          titleWidget: Obx(() => Text("${order.value!.customer.name}"))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: [
              // order status
              ROpOrderStatusCard(order: order.value!),

              ROpOrderHandleButton(order: order.value!),
              ROpOrderEstTime(order: order.value!),
              ROpDriverCard(order: order.value!),

              ROpOrderCustomer(order: order.value!),
              _orderItemsList(),
              ROpOrderSummaryCard(
                order: order.value!,
              ),

              ROpOrderNote(order: order.value!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderItemsList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order items",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(order.value!.items.length,
                (int index) => ROpOrderItems(item: order.value!.items[index])),
          ),
        ],
      ),
    );
  }

  // Widget? _setReadyForDeliveryButton() {
  //   if () {
  //     return Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 3),
  //       child: TextButton(
  //           onPressed: (order.value!.status == LaundryOrderStatus.AtLaundry)
  //               ? () {
  //                 //  controller.setAsReadyForDelivery(order.value!.orderId);
  //                 }
  //               : null,
  //           style: TextButton.styleFrom(
  //               backgroundColor:
  //                   (order.value!.status == LaundryOrderStatus.AtLaundry)
  //                       ? primaryBlueColor
  //                       : Colors.grey),
  //           child: Container(
  //             alignment: Alignment.center,
  //             padding: const EdgeInsets.all(8),
  //             child: Text("${_i18n()["orderReady"]}"),
  //           )),
  //     );
  //   }
  //   return null;
  // }
}
