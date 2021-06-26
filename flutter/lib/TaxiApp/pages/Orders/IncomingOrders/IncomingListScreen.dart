import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class IncomingOrdersScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    // Injecting OrderController at this Node.
    AuthController _authController = Get.find<AuthController>();
    IncomingOrdersController _incomingOrdersController =
        Get.put(IncomingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        actions: [
          IconButton(
              onPressed: () => _authController.signOut(),
              icon: Icon(Icons.power_settings_new_sharp)),
        ],
      ),
      body: Container(
          height: double.infinity,
          child: Center(
            // Putting OBX here since, we're using length of orders , which will be changing
            child: Obx(() => ListView.builder(
                  itemCount: _incomingOrdersController.orders.length,
                  itemBuilder: (ctx, i) {
                    print(" List Len >>>>>>>>>>>... " +
                        _incomingOrdersController.orders.length.toString());
                    return Text(_incomingOrdersController.orders[i].id);
                  },
                )),
          )),
    );
  }
}
