import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/components/getFutureData.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/driverController.dart';

class RankingsPage extends GetView<DriverStatsController> {
  Widget getRanks() {
    return getFutureData(controller.getLastWeekRankings(),
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
      body: Center(child: getRanks()),
    );
  }
}
