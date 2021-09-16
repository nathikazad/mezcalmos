import 'package:flutter/material.dart';
import 'package:mezcalmos/AdminApp/controller/DriverController.dart';
import 'package:get/get.dart';

class RankingsPage extends GetView<DriverStatsController> {
  FutureBuilder<List<dynamic>> getRanks() {
    return FutureBuilder<List<dynamic>>(
        future: controller
            .getLastWeekRankings(), // a previously-obtained Future<String> or null
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var driver in snapshot.data!)
                      Text(
                          'Rank:${driver['rank']}, Name: ${driver['displayName']}, Orders: ${driver['totalOrders']}')
                  ],
                ),
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

          // List<dynamic> rankings = await controller.getLastWeekRankings();
          // return <Widget>
        });
  }

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
    Get.put<DriverStatsController>(DriverStatsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Rankings"),
      ),
      body: Center(child: getRanks()),
    );
  }
}
