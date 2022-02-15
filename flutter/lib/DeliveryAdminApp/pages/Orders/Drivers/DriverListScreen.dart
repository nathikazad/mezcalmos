import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Drivers/DriversMapComponent.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  RxList<DeliveryDriver> deliveryDrivers = RxList.empty();
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
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Driver'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DriversMapCompnonet(
              drivers: deliveryDrivers.value,
              order: order!,
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                      deliveryDrivers.length,
                      (index) => DriverSelectCard(
                            driver: deliveryDrivers[index],
                            function: (deliveryDrivers[index]
                                    .deliveryDriverState
                                    .isOnline)
                                ? () {
                                    Get.back(result: deliveryDrivers[index]);
                                  }
                                : null,
                          )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DriverSelectCard extends StatelessWidget {
  const DriverSelectCard({
    Key? key,
    required this.driver,
    required this.function,
  }) : super(key: key);
  final DeliveryDriver driver;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
        child: InkWell(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  CachedNetworkImageProvider(driver.driverInfo.image),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver.driverInfo.name,
                    style: txt.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  (driver.deliveryDriverState.isOnline)
                      ? Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Available',
                              style: txt.bodyText2,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.redAccent,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Unavailable',
                              style: txt.bodyText2,
                            )
                          ],
                        )
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColorLight,
              size: 35,
            )
          ],
        ),
      ),
    ));
  }
}
