import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/AdminApp/pages/DriverStats/RankingsPage.dart';
import 'package:mezcalmos/AdminApp/pages/OrderStats/OrdersOnDayPage.dart';
import 'package:mezcalmos/AdminApp/pages/OrderStats/OrdersCumOnDayPage.dart';

class StatsIndexPage extends GetView {
  // void getRanks() async {
  //   controller.getLastWeekRankings().then((rankings) => {
  //         rankings.forEach((driver) {
  //           print(
  //               'Rank:${driver['rank']}, Name: ${driver['displayName']}, Orders: ${driver['totalOrders']}');
  //         })
  //       });
  // }

  // void getNotificationCountStatsOnDay() async {
  //   controller.getNotificationCountStatsOnDay().then((value) => print(value));
  //   // .then((rankings) => {
  //   //   rankings.forEach((driver) {
  //   //     print(
  //   //         'Rank:${driver['rank']}, Name: ${driver['name']}, Orders: ${driver['totalOrders']}');
  //   //   })
  //   // });
  // }

  // void getUniqueNotificationStatsForMonth() async {
  //   controller
  //       .getUniqueNotificationStatsForMonth()
  //       .then((value) => print(value));
  //   // .then((rankings) => {
  //   //   rankings.forEach((driver) {
  //   //     print(
  //   //         'Rank:${driver['rank']}, Name: ${driver['name']}, Orders: ${driver['totalOrders']}');
  //   //   })
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stats"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Order Stats"),
            OutlinedButton(
                child: Text("Order Cumulative On Day"),
                onPressed: () => Get.to(OrdersCumOnDayPage())),
            OutlinedButton(
                child: Text("Orders On Day"),
                onPressed: () => Get.to(OrdersOnDayPage())),
            OutlinedButton(
                child: Text("Order Cumulative For Month"),
                onPressed: () => print("Order Cumulative For Month")),
            OutlinedButton(
                child: Text("Order Cumulative By Month"),
                onPressed: () => print("Order Cumulative By Month")),
            Text("Driver Stats"),
            OutlinedButton(
                child: Text("Last Week Rankings"),
                onPressed: () => Get.to(RankingsPage())),
            OutlinedButton(
                child: Text("Notification count on day"),
                onPressed: () => print("Notification count on day")),
            OutlinedButton(
                child: Text("Notification stats For Month"),
                onPressed: () => print("Notification stats For Month")),
          ],
        ),
      ),
    );
  }
}
