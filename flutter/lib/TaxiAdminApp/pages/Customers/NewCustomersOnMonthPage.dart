import 'package:flutter/material.dart';
import 'package:mezcalmos/TaxiAdminApp/controller/CustomersController.dart';
import 'package:get/get.dart';

class NewCustomersOnMonthPage extends GetView<CustomersController> {
  FutureBuilder<Map<String, dynamic>> getFulfillmentRatioOnMonth() {
    return FutureBuilder<Map<String, dynamic>>(
        future: controller.getNewCustomersForMonth(
            9), // a previously-obtained Future<String> or null
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
    Get.put<CustomersController>(CustomersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Fulfillment ratio for month"),
      ),
      body: Center(child: getFulfillmentRatioOnMonth()),
    );
  }
}
