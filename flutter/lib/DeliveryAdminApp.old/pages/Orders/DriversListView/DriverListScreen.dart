import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/DriversListView/Components/DriverSelectCard.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/DriversListView/Components/DriversMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["driversListView"]["driversListScreen"];

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  /// deliveryDrivers
  RxList<DeliveryDriver> deliveryDrivers = <DeliveryDriver>[].obs;

  /// driversListener
  StreamSubscription<dynamic>? driversListener;

  /// deliveryDriverController
  DeliveryDriverController deliveryDriverController =
      Get.find<DeliveryDriverController>();

  /// order
  Order? order;

  @override
  void initState() {
    super.initState();
    order = Get.arguments as Order?;
    deliveryDrivers.value = deliveryDriverController.deliveryDrivers
        .where((DeliveryDriver p0) => p0.isAssociated == false)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_i18n()["title"]}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DriversMapCompnonet(
            drivers: deliveryDrivers(),
            order: order!,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: deliveryDrivers.length,
              itemBuilder: (_, int index) {
                return DriverSelectCard(
                  driver: deliveryDrivers[index],
                  function: (deliveryDrivers[index].deliveryDriverState.online)
                      ? () => MezRouter.back(result: deliveryDrivers[index])
                      : null,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
