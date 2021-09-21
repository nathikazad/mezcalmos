import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/CustomersController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

class NewCustomersOnMonthPage extends GetView<CustomersController> {
  Widget getFulfillmentRatioOnMonth() {
    return getFutureData(controller.getNewCustomersForMonth(9),
        (Map<String, dynamic> data) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Result: ${data}')]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<CustomersController>(CustomersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulfillment ratio for month"),
      ),
      body: Center(child: getFulfillmentRatioOnMonth()),
    );
  }
}
