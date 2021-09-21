import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

class OrderViewPage extends GetView<OrderStatsController> {
  Widget getOrder(String orderId) {
    return getStreamData(controller.getOrder(orderId),
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
        title: Text("Cum Orders For Day"),
      ),
      body: Center(child: getOrder("-MYztek7UKwGt9uc9abF")),
    );
  }
}
