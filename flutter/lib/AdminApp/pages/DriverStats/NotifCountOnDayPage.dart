import 'package:flutter/material.dart';
import 'package:mezcalmos/AdminApp/controller/DriverStatsController.dart';
import 'package:get/get.dart';

class NotifCountOnDayPage extends GetView<DriverStatsController> {
  FutureBuilder<List<dynamic>> getNotificationCountOnDay() {
    return FutureBuilder<List<dynamic>>(
        future: controller.getNotificationCountOnDay(
            new DateTime.now()), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Result: ${snapshot.data}')
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     for (var driver in snapshot.data!)
                  //       Text(
                  //           'Rank:${driver['rank']}, Name: ${driver['displayName']}, Orders: ${driver['totalOrders']}')
                  //   ],
                  // ),
                  // Text('Result: ${snapshot.data}'),
                  )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.put<DriverStatsController>(DriverStatsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Drivers Notifs On Day"),
      ),
      body: Center(child: getNotificationCountOnDay()),
    );
  }
}
