import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderFooterCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/LaundryPricingComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundryCurrentOrderView/Components/OrderSummaryComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n = Get.find<LanguageController>().strings['CustomerApp']['pages']
['Laundry']['LaundryCurrentOrderView']['LaundryCurrentOrderView'];

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
  final LocationPickerController locationPickerController =
      LocationPickerController();

  LaundryController laundryController = Get.find<LaundryController>();

  @override
  void initState() {
    super.initState();
    orderId = Get.parameters['orderId'];

    order.value = controller.getOrder(orderId!) as LaundryOrder?;
    if (order.value == null) {
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
                order.value = event as LaundryOrder;
              }
            });
            order.value = controller.getOrder(orderId!) as LaundryOrder?;
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
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title:
            '${_i18n["orderStatus"]}',
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
                      LaundryPricingCompnent(order: order.value!),
                      SizedBox(
                        height: 20,
                      ),
                      OrderSummaryComponent(
                        order: order.value!,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LaundryOrderFooterCard(order: order.value!)
                    ],
                  ),
                ),
              )
            : Center(
                child: MezLogoAnimation(),
              ),
      ),
    );
  }
}
