import 'package:flutter/material.dart';
import 'package:mezcalmos/AdminApp/controller/OrderStatsController.dart';
import 'package:mezcalmos/AdminApp/controller/DriverStatsController.dart';
import 'package:get/get.dart';

class RankingsPage extends StatefulWidget {
  RankingsPage({Key? key}) : super(key: key);

  @override
  _RankingsPage createState() => _RankingsPage();
}

class _RankingsPage extends State<RankingsPage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    DriverStatsController driverStatsController =
        Get.put<DriverStatsController>(DriverStatsController());
    driverStatsController.getLastWeekRankings();
    // driverStatsController.getRankings().then((rankings) => {
    //       rankings.forEach((driver) {
    //         print(
    //             'Rank:${driver['rank']}, Name: ${driver['name']}, Orders: ${driver['totalOrders']}');
    //       })
    //     });
    // OrderStatsController driverStatsController =
    //     Get.put<OrderStatsController>(OrderStatsController());
    // driverStatsController.getOrderscumulativeOnDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rankings"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
