import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/RankingsPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotifCountOnDayByDriverPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Customers/NewCustomersOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersOnDayPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnDayPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersFulfillmentOnMonthPage.dart';

class StatsIndexPage extends GetView {
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
                onPressed: () => Get.to(OrdersCumOnMonthPage())),
            OutlinedButton(
                child: Text("Order Fulfillment For Month"),
                onPressed: () => Get.to(OrdersFulfillmentOnMonthPage())),
            OutlinedButton(
                child: Text("Order Cumulative By Month"),
                onPressed: () => print("Order Cumulative By Month")),
            Text("Driver Stats"),
            OutlinedButton(
                child: Text("Last Week Rankings"),
                onPressed: () => Get.to(RankingsPage())),
            OutlinedButton(
                child: Text("Notification count on day"),
                onPressed: () => Get.to(NotifCountOnDayPage())),
            OutlinedButton(
                child: Text("Notification stats For Month"),
                onPressed: () => print("Notification stats For Month")),
            Text("Customer Stats"),
            OutlinedButton(
                child: Text("New Customers for month"),
                onPressed: () => Get.to(NewCustomersOnMonthPage())),
          ],
        ),
      ),
    );
  }
}
