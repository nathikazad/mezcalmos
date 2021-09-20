import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/OrdersController.dart';
import 'package:get/get.dart';

class OrderViewPage extends GetView<OrderStatsController> {
  StreamBuilder<Map<String, dynamic>> getOrder(String orderId) {
    return StreamBuilder<Map<String, dynamic>>(
        stream: controller
            .getOrder(orderId), // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
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
    Get.put<OrderStatsController>(OrderStatsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Cum Orders For Day"),
      ),
      body: Center(child: getOrder("-MYztek7UKwGt9uc9abF")),
    );
  }
}
