import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';
import 'package:mezcalmos/TaxiApp/services/ApiService.dart';

class HomeScreen extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) 
  {
    OrderController _orderController = Get.put(OrderController());
    ApiService _api  = Get.put(ApiService());

    return Scaffold(

      appBar: AppBar(
        title: Text('Orders'),
        actions: [
          IconButton(onPressed: () => controller.signOut(), icon:  Icon(Icons.power_settings_new_sharp)),
        ],
      ),
      body: Container(height : double.infinity , child: Center(

        child: ListView.builder(itemCount:  _orderController.orders.length , itemBuilder: (ctx , i) {

          return Text(_orderController.orders[i].id ,  style: TextStyle(color: Colors.primaries[Random().nextInt(Colors.primaries.length)]));

        }),

      )),
      
    );
  }
}