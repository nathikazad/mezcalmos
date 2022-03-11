import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderMapComponent.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

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
    } else if (order.value!.isOpenOrder()) {
      _orderListener =
          taxiOrderController.getOpenOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    } else if (order.value!.inProcess()) {
      _orderListener = taxiOrderController
          .getInProcessOrderStream(orderId)
          .listen((newOrder) {
        if (newOrder != null) {
          order.value = taxiOrderController.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    } else {
      // Get.back();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              TaxiOrderMapComponent(order: order.value!),
              (!order.value!.isOpenOrder())
                  ? TaxiOrderBottomCard(order: order.value!)
                  : TaxiOpenOrderBottomCard(order: order.value!),
            ],
          ),
        );
      }),
    );
  }
}
