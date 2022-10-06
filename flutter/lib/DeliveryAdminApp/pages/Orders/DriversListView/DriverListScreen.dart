import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/DriversListView/Components/DriverSelectCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/DriversListView/Components/DriversMapComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

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
    deliveryDrivers.value = deliveryDriverController.deliveryDrivers;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
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
                  function:
                      (deliveryDrivers[index].deliveryDriverState.isOnline)
                          ? () => Get.back(result: deliveryDrivers[index])
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
