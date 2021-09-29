import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/RankingsPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/DriverPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotifCountOnDayByDriverPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotificationsOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/UniqueNotificationsOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Customers/NewCustomersOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersOnDayPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnDayPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersFulfillmentOnMonthPage.dart';

import 'Orders/OrderViewPage.dart';

class StatsIndexPage extends GetView {
  LanguageController lng = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stats"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Text(
              "Order Stats",
              textAlign: TextAlign.center,
            ),
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
                onPressed: () {
                  Get.to(() => OrderViewPage("-MYztek7UKwGt9uc9abF"));
                },
                child: Text("Orders View ")),
            Text(
              "Driver Stats",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
                child: Text("Last Week Rankings"),
                onPressed: () => Get.to(RankingsPage())),
            OutlinedButton(
                child: Text("Sample Driver Page"),
                onPressed: () =>
                    Get.to(DriverPage("OAvACdFweLfUkQHPicckdA40XN92"))),
            Text(
              "Notification Stats",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
                child: Text("Notification by driver count on day"),
                onPressed: () => Get.to(NotifCountOnDayPage())),
            OutlinedButton(
                child: Text("Notification stats For Month"),
                onPressed: () => Get.to(NotificationsOnMonthPage())),
            OutlinedButton(
                child: Text("Unique Notification stats For Month"),
                onPressed: () => Get.to(UniqueNotificationsOnMonthPage())),
            Text(
              "Customer Stats",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
                child: Text("New Customers for month"),
                onPressed: () => Get.to(NewCustomersOnMonthPage())),
            Divider(),
            OutlinedButton(
                child: Text("Langauge"),
                onPressed: () {
                  lng.changeUserLanguage();
                }),
          ],
        ),
      ),
    );
  }
}
