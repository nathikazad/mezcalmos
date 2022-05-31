import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpCustomer.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpDriverCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderNote.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderStatusCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpSetCategoryComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/OrderEstimatedTimeComponent.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['LaundryOpOrderView'];

class LaundryOpOrderView extends StatefulWidget {
  const LaundryOpOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryOpOrderView> createState() => _LaundryOpOrderViewState();
}

class _LaundryOpOrderViewState extends State<LaundryOpOrderView> {
  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  OrderController controller = Get.find<OrderController>();
  StreamSubscription? _orderListener;
  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder;
    _orderListener = controller
        .getOrderStream(orderId)
        .listen((LaundryOrder? newOrderEvent) {
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
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: Get.back),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Obx(
          () => Column(
            children: [
              // order status
              LaundryOpOrderStatusCard(order: order.value!),
              const SizedBox(
                height: 5,
              ),
              if (_setReadyForDeliveryButton() != null)
                _setReadyForDeliveryButton()!,
              const SizedBox(
                height: 10,
              ),
              OrderEstimatedTimeComponent(order: order.value!),
              LaundryOpOrderDriverCard(order: order.value!),

              const SizedBox(
                height: 10,
              ),
              LaundryOpCustomer(order: order.value!),

              LaundyOpSetCategoryComponent(
                order: order.value!,
              ),
              const SizedBox(
                height: 10,
              ),
              _totalCostcomponent(context),

              LaundryOpOrderNote(order: order.value!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalCostcomponent(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_i18n()["total"]} :",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              (order.value!.costsByType?.totalPrice != null)
                  ? '\$${order.value!.costsByType?.totalPrice}'
                  : '-',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget? _setReadyForDeliveryButton() {
    if (order.value!.isAtLaundry() &&
        order.value!.costsByType != null &&
        order.value!.costsByType!.lineItems.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: TextButton(
            onPressed: (order.value!.status == LaundryOrderStatus.AtLaundry)
                ? () {
                    controller.setAsReadyForDelivery(order.value!.orderId);
                  }
                : null,
            style: TextButton.styleFrom(
                backgroundColor:
                    (order.value!.status == LaundryOrderStatus.AtLaundry)
                        ? primaryBlueColor
                        : Colors.grey),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Text("${_i18n()["orderReady"]}"),
            )),
      );
    }
    return null;
  }
}
