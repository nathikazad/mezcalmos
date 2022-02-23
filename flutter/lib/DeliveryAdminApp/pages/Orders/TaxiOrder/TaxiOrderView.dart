import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderMapComponent.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

import '../../../../Shared/helpers/PrintHelper.dart';

class TaxiOrderView extends StatefulWidget {
  TaxiOrderView({Key? key}) : super(key: key);

  @override
  _TaxiOrderViewState createState() => _TaxiOrderViewState();
}

class _TaxiOrderViewState extends State<TaxiOrderView> {
  TaxiOrderController taxiOrderController = Get.find<TaxiOrderController>();
  Rxn<TaxiOrder> order = Rxn();
  late String orderId;
  StreamSubscription? _orderListener;
  @override
  void initState() {
    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    // taxiOrderController.clearOrderNotifications(orderId);
    order.value = taxiOrderController.getOrder(orderId);
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          taxiOrderController.getOpenOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Order '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaxiOrderMapComponent(order: order.value!),
            Obx(() => TaxiOpenOrderBottomCard(order: order.value!)),
          ],
        ),
      ),
    );
  }
}
