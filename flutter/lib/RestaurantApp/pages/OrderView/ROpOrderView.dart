import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
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
              ROpRefundButton(
                order: order.value!,
              ),
              if (order.value!.inProcess())
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: offRedColor, primary: Colors.red),
                    onPressed: () {
                      showConfirmationDialog(context, onYesClick: () async {
                        await controller.cancelOrder(order.value!.orderId);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text("Cancel order"),
                    ))
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
            children: List.generate(
                order.value!.items.length,
                (int index) => ROpOrderItems(
                      item: order.value!.items[index],
                      order: order.value!,
                    )),
          ),
        ],
      ),
    );
  }
}

class ROpRefundButton extends StatelessWidget {
  const ROpRefundButton({
    Key? key,
    required this.order,
  }) : super(key: key);
  final RestaurantOrder order;
  static TextEditingController refundAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    content: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Refund",
                              style: Get.textTheme.headline3,
                            ),
                          ),
                          Divider(),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Amount :",
                            style: Get.textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: refundAmount,
                            style: Get.textTheme.bodyText1,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.attach_money_rounded)),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.,]')),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.find<ROpOrderController>()
                                    .refundCustomerCustomAmount(order.orderId,
                                        num.parse(refundAmount.text))
                                    .then((ServerResponse value) {
                                  mezDbgPrint("$value");
                                  Get.back();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                child: Text("Refund"),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          },
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text("Refund customer"),
          )),
    );
  }
}
