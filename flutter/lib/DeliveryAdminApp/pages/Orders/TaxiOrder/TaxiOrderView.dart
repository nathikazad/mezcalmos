import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["TaxiOrderView"];

class TaxiOrderView extends StatefulWidget {
  const TaxiOrderView({Key? key}) : super(key: key);

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

    order.value = taxiOrderController.getOrder(orderId);
    _orderListener = taxiOrderController
        .getOrderStream(orderId)
        .listen((TaxiOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
      }
    });

    // if order value is null and
    if (order.value == null) {
      Timer(Duration(seconds: 5), () {
        if (order.value == null) {
          // ignore: inference_failure_on_function_invocation
          Get.back();
          MezSnackbar("Error", "Order does not exist");
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text('${_i18n()["order"]}'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TaxiOrderMapComponent(order: order.value!),
                (order.value!.isOpenOrder())
                    ? TaxiOpenOrderBottomCard(order: order.value!)
                    : TaxiOrderBottomCard(order: order.value!),
              ],
            ),
          )),
    );
  }
}
