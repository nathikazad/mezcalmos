import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

class OrdersFulfillmentOnMonthPage extends GetView<OrderStatsController> {
  Widget getFulfillmentRatioOnMonth() {
    return getFutureData(controller.getFulfillmentRatioOnMonth(9),
        (Map<String, dynamic> data) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Result: ${data}')]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulfillment ratio for month"),
      ),
      body: Center(child: getFulfillmentRatioOnMonth()),
    );
  }
}
