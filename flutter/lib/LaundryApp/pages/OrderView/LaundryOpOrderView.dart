import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpDriverCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderNote.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderStatusCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpOrderSummaryCard.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOpSetCategoryComponent.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/OrderEstimatedTimeComponent.dart';
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
                height: 10,
              ),
              _setReadyForDeliveryButton(),
              const SizedBox(
                height: 10,
              ),
              LaundyOpSetCategoryComponent(
                order: order.value!,
              ),
              const SizedBox(
                height: 10,
              ),
              OrderEstimatedTimeComponent(order: order.value!),
              // order Customer
              _orderCustomerCard(),
              LaundryOpOrderDriverCard(order: order.value!),

              // order notes
              LaundryOpOrderNote(order: order.value!),
              // order summary
              LaundryOpOrderSummaryCard(order: order.value!),
              // order Date
              _orderDateComponent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _setReadyForDeliveryButton() {
    return Container(
      child: TextButton(
          onPressed: (order.value!.status == LaundryOrderStatus.AtLaundry)
              ? () {
                  controller.setAsReadyForDelivery(order.value!.orderId);
                }
              : null,
          style: TextButton.styleFrom(
              backgroundColor:
                  (order.value!.status == LaundryOrderStatus.AtLaundry)
                      ? Colors.blueAccent
                      : Colors.grey),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text("Order ready for delivery"),
          )),
    );
  }

  Widget _orderDateComponent() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()["orderDate"]}"),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    size: 40,
                    color: Get.theme.primaryColorLight,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${DateFormat("dd MMMM yyyy hh:mm a").format(order.value!.orderTime)}",
                    style: Get.theme.textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderCustomerCard() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${_i18n()["customer"]}"),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        CachedNetworkImageProvider(order.value!.customer.image),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    order.value!.customer.name,
                    style: Get.theme.textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
