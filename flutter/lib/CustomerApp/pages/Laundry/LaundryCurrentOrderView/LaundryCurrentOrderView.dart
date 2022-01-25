import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryCurrentOrderView extends StatefulWidget {
  const LaundryCurrentOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryCurrentOrderView> createState() =>
      _LaundryCurrentOrderViewState();
}

class _LaundryCurrentOrderViewState extends State<LaundryCurrentOrderView> {
  String? orderId;
  Rxn<LaundryOrder> order = Rxn();
  StreamSubscription? _orderListener;
  OrderController controller = Get.find<OrderController>();
  @override
  void initState() {
    super.initState();
    orderId = Get.parameters['orderId'];

    order.value = controller.getOrder(orderId!) as LaundryOrder?;
    if (order.value == null) {
      mezDbgPrint('ORDER NULLLLLLLLLLLLLL');

      controller.currentOrders.stream.first
          .then((value) => order.value = value as LaundryOrder?);
    } else {
      if (order.value!.inProcess()) {
        _orderListener =
            controller.getCurrentOrderStream(orderId!).listen((event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as LaundryOrder).status.toString());

            order.value = event;
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            controller.getPastOrderStream(orderId!).listen((event) {
              if (event != null) {
                mezDbgPrint("the past order is ========== $event ==========");
                order.value = event as LaundryOrder;
              } else {
                mezDbgPrint("the past order is ========== 'empty' ==========");
              }
            });
            order.value = controller.getOrder(orderId!) as LaundryOrder?;
          }
        });
      }
    }

    super.initState();
  }

  final LocationPickerController locationPickerController =
      LocationPickerController();
  // final AuthController authController = Get.find<AuthController>();

  LaundryController laundryController = Get.find<LaundryController>();
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: 'Order',
      ),
      body: Obx(
        () => order.value != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      LaundryOrderStatusCard(order: order.value!),
                      SizedBox(
                        height: 20,
                      ),
                      laundryPricingCard(context, order.value!),
                      SizedBox(
                        height: 20,
                      ),
                      orderSummaryCard(context, order.value!),
                      SizedBox(
                        height: 20,
                      ),
                      LaundryOrderFooterCard(order: order.value!)
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  orderSummaryCard(BuildContext context, LaundryOrder order) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${lang.strings["customer"]["restaurant"]["cart"]["orderSummary"]}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$5",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0) ? '\$' + (order.cost + 5).toString() : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.to.address, maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  laundryPricingCard(BuildContext context, LaundryOrder order) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Laundry Prcing",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fixed Rate:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order weight:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.weight != null)
                      ? order.weight.toString() + '/kg'
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.cost != 0)
                      ? '\$' + order.cost.toStringAsFixed(0)
                      : '-',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            if (order.weight == null)
              Column(
                children: [
                  Divider(
                    height: 25,
                  ),
                ],
              ),
            Row(
              children: [
                Icon(
                  Icons.help_outline_rounded,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(
                        'Order weight and total cost will be updated once the laundry service receive your order.',
                        maxLines: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
