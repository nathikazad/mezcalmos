import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class CurrentOrderScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find<AuthController>();
    CurrentOrderController _currentOrderController =
        Get.put(CurrentOrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Current Order'),
          actions: [
            IconButton(
                onPressed: () => _authController.signOut(),
                icon: Icon(Icons.power_settings_new_sharp)),
          ],
        ),
        body: Text('Current Order Details ' + _currentOrderController.id));
  }
}
