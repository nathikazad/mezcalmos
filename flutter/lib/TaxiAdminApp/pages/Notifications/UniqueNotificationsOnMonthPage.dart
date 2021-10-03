import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/NotificationsController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';

class UniqueNotificationsOnMonthPage extends GetView<NotificationsController> {
  Widget getUniqueNotificationForMonth() {
    return getFutureData(controller.getUniqueNotificationForMonth(9),
        (Map<String, dynamic> data) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Result: ${data}')]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<NotificationsController>(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulfillment ratio for month"),
      ),
      body: Center(child: getUniqueNotificationForMonth()),
    );
  }
}
