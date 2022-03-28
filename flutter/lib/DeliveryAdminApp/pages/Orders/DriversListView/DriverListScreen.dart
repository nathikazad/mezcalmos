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
  RxList<DeliveryDriver> deliveryDrivers = <DeliveryDriver>[].obs;
  StreamSubscription? driversListener;

  DeliveryDriverController deliveryDriverController =
      Get.find<DeliveryDriverController>();
  Order? order;
  @override
  void initState() {
    order = Get.arguments;
    deliveryDrivers.value = deliveryDriverController.deliveryDrivers;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('${_i18n()["title"]}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DriversMapCompnonet(
              drivers: deliveryDrivers.value,
              order: order!,
            ),
            _driversListComponent(),
          ],
        ),
      ),
    );
  }

// Drivers list component where the user can select a driver by clicking the card
  Widget _driversListComponent() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(
              deliveryDrivers.length,
              (int index) => DriverSelectCard(
                    driver: deliveryDrivers[index],
                    function:
                        (deliveryDrivers[index].deliveryDriverState.isOnline)
                            ? () {
                                Get.back(result: deliveryDrivers[index]);
                              }
                            : null,
                  )),
        ),
      ),
    );
  }
}
