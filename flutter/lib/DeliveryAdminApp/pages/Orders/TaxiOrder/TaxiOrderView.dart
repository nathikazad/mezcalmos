import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderBottomCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOrderButtons.dart';
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
    orderId = Get.parameters['orderId']!;
    order.value = taxiOrderController.getOrder(orderId);
    _orderListener = taxiOrderController
        .getOrderStream(orderId)
        .listen((TaxiOrder? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;
      }
    });

    waitForOrderIfNotLoaded().then((value) {
      if (order.value == null) {
        // ignore: inference_failure_on_function_invocation
        Future.delayed(Duration.zero, () {
          Get.back();
          MezSnackbar("Error", "Order does not exist");
        });
      }
    });

    super.initState();
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
  void dispose() {
    _orderListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        mezDbgPrint(
            "ORDER OBX ==================> ${order.value!.status.toFirebaseFormatString()}");
        return Scaffold(
            appBar: AppBar(
              title: Text('${_i18n()["order"]}'),
            ),
            bottomNavigationBar: Obx(
              () {
                return TaxiOrderButtons(
                  order: order.value!,
                );
              },
            ),
            body: Column(
              children: <Widget>[
                TaxiOrderMapComponent(order: order.value!),
                Expanded(
                  child: order.value!.isOpenOrder()
                      ? TaxiOpenOrderBottomCard(order: order.value!)
                      : TaxiOrderBottomCard(order: order.value!),
                )
              ],
            ));
      },
    );
  }
}
