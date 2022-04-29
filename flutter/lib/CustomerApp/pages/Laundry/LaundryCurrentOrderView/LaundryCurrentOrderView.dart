import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderNoteComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryPricingComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderSummaryComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryCurrentOrderView']['LaundryCurrentOrderView'];

class LaundryCurrentOrderView extends StatefulWidget {
  const LaundryCurrentOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryCurrentOrderView> createState() =>
      _LaundryCurrentOrderViewState();
}

class _LaundryCurrentOrderViewState extends State<LaundryCurrentOrderView> {
  late String orderId;
  Rxn<LaundryOrder> order = Rxn<LaundryOrder>();
  StreamSubscription<dynamic>? _orderListener;
  final OrderController controller = Get.find<OrderController>();
  final LocationPickerController locationPickerController =
      LocationPickerController();

  // LaundryController laundryController = Get.find<LaundryController>();

  @override
  void initState() {
    super.initState();
    // Handle Order id from the rooting
    if (Get.parameters['orderId'] != null) {
      orderId = Get.parameters['orderId']!;
    } else {
      mezDbgPrint("Order id null from the parameters ######");
      Get.back<void>();
    }
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as LaundryOrder?;
    if (order.value == null) {
      mezDbgPrint("Order null");
      Get.back<void>();
    } else {
      controller.clearOrderNotifications(orderId);
      if (order.value!.inProcess()) {
        _orderListener =
            controller.getCurrentOrderStream(orderId).listen((Order? event) {
          if (event != null) {
            mezDbgPrint("===================" +
                (event as LaundryOrder).status.toString());

            order.value = event;
          } else {
            _orderListener?.cancel();
            _orderListener = null;
            controller.getPastOrderStream(orderId).listen((Order? event) {
              if (event != null) {
                order.value = event as LaundryOrder;
              }
            });
            order.value = controller.getOrder(orderId) as LaundryOrder?;
          }
        });
      }
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
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${_i18n()["orderStatus"]}',
      ),
      body: Obx(
        () => order.value != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      LaundryOrderStatusCard(order: order.value!),
                      const SizedBox(height: 20),
                      LaundryPricingCompnent(order: order.value!),
                      const SizedBox(height: 10),
                      LaundryOrderNoteComponent(order: order.value!),
                      const SizedBox(height: 10),
                      OrderSummaryComponent(
                        order: order.value!,
                      ),
                      const SizedBox(height: 10),
                      LaundryOrderFooterCard(order: order.value!)
                    ],
                  ),
                ),
              )
            : Center(child: MezLogoAnimation()),
      ),
    );
  }
}
