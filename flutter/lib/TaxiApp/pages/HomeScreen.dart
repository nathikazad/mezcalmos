import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class HomeScreen extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) 
  {
    // Injecting OrderController at this Node.
    OrderController _orderController  = Get.put(OrderController());

    return Scaffold(

      appBar: AppBar(
        title: Text('Orders'),
        actions: [
          IconButton(onPressed: () => controller.signOut(), icon:  Icon(Icons.power_settings_new_sharp)),
        ],
      ),
      body: Container(height : double.infinity , child: Center(
        
        // Putting OBX here since, we're using length of orders , which will be changing
        child: Obx(() => ListView.builder(itemCount:  _orderController.orders.length, itemBuilder: (ctx , i){

          print(" List Len >>>>>>>>>>>... "+_orderController.orders.length.toString());
          return Text(_orderController.orders[i].id);
          
        },)),

      )),
      
    );
  }
}