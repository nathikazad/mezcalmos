import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Customers/NewCustomersOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Driver/RankingsPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotifCountOnDayByDriverPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/NotificationsOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Notifications/UniqueNotificationsOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnDayPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersCumOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersFulfillmentOnMonthPage.dart';
import 'package:mezcalmos/TaxiAdminApp/pages/Orders/OrdersOnDayPage.dart';

class StatsIndexPage extends GetView {
  const StatsIndexPage({Key? key}) : super(key: key);

  /// LanguageController
  static final LanguageController lang = Get.find<LanguageController>();

  /// AuthController
  static final AuthController authController = Get.find<AuthController>();

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
              onPressed: () => Get.to(OrdersCumOnDayPage()),
            ),
            OutlinedButton(
              child: Text("Orders On Day"),
              onPressed: () => Get.to(OrdersOnDayPage()),
            ),
            // OutlinedButton(
            //   child: Text("Order Cumulative For Month"),
            //   onPressed: () => Get.to(OrdersCumOnMonthPage()),
            // ),
            // OutlinedButton(
            //   child: Text("Order Fulfillment For Month"),
            //   onPressed: () => Get.to(OrdersFulfillmentOnMonthPage()),
            // ),
            Text(
              "Driver Stats",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              child: Text("Last Week Rankings"),
              onPressed: () => Get.to(RankingsPage()),
            ),
            Text(
              "Notification Stats",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              child: Text("Notification by driver count on day"),
              onPressed: () => Get.to(NotifCountOnDayPage()),
            ),
            // OutlinedButton(
            //   child: Text("Notification stats For Month"),
            //   onPressed: () => Get.to(NotificationsOnMonthPage()),
            // ),
            // OutlinedButton(
            //   child: Text("Unique Notification stats For Month"),
            //   onPressed: () => Get.to(UniqueNotificationsOnMonthPage()),
            // ),
            // Text(
            //   "Customer Stats",
            //   textAlign: TextAlign.center,
            // ),
            // OutlinedButton(
            //   child: Text("New Customers for month"),
            //   onPressed: () => Get.to(NewCustomersOnMonthPage()),
            // ),
            Text(
              "Log out",
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              child: Text("Log Out"),
              onPressed: () async => await authController.signOut(),
            ),
            Divider(),
            OutlinedButton(
              child: Text("Langauge"),
              onPressed: () {
                lang.changeUserLanguage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
