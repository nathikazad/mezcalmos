import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/DriverController.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';
import 'package:get/get.dart';

class DriverPage extends GetView<DriverStatsController> {
  List<Widget> getDriverInfo(String driverId) {
    return <Widget>[
      getFutureData(controller.getUserInfo(driverId),
          (Map<String, dynamic> data) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Result: ${data}')]);
      }),
      getFutureData(controller.getDriverFBData(driverId),
          (Map<String, dynamic> data) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Result: ${data}')]);
      }),
      getFutureData(controller.getDriverHasuraData(driverId),
          (Map<String, dynamic> data) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Result: ${data}')]);
      })
    ];
  }

  Widget getDriverOrdersLastNDays(String driverId, int nDays) {
    return getFutureData(controller.getDriverOrdersLastNDays(driverId, nDays),
        (List<dynamic> data) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Result: ${data}')]);
    });
  }

  Widget getDriverNotificationsLastNDays(String driverId, int nDays) {
    return getFutureData(
        controller.getDriverNotificationsLastNDays(driverId, nDays),
        (List<dynamic> list) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        for (var driver in list)
          Text(
              'Rank:${driver['rank']}, Name: ${driver['displayName']}, Orders: ${driver['totalOrders']}')
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<DriverStatsController>(DriverStatsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Rankings"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getDriverInfo("yKo3XqL3dEd78BVgzjNOvAxru723") +
                  <Widget>[
                    getDriverOrdersLastNDays(
                        "yKo3XqL3dEd78BVgzjNOvAxru723", 30),
                    getDriverNotificationsLastNDays(
                        "yKo3XqL3dEd78BVgzjNOvAxru723", 30)
                  ]),
        ));
  }
}
