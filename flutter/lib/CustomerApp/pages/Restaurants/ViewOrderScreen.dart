import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantOrderController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';

import 'dart:async';

class ViewOrderScreen extends GetView<RestaurantOrderController> {
  Rxn<Cart> cart = Rxn();

  ViewCartScreen() {
    RestaurantOrderController controller =
        Get.put<RestaurantOrderController>(RestaurantOrderController());
    cart = controller.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order"),
        ),
        body: Column(
          children: [
            // OutlinedButton(
            //     child: Text("Clear cart"),
            //     onPressed: () {
            //       controller.clearCart();
            //     }),
            // Obx(() {
            //   return Text(cart.value?.toFirebaseFormattedJson().toString() ??
            //       "Cart is empty");
            // }),
            // OutlinedButton(
            //     child: Text("Checkout"),
            //     onPressed: () async {
            //       await controller.checkout();
            //       Get.offAll(page)
            //     })
          ],
        ));
    // List<Item> items = restaurant.value?.items ?? [];
    // return Column(
    //     children: items
    //         .map((item) => TextButton(
    //             onPressed: () =>
    //                 Get.to(ViewItemScreen(restaurantId, item.id!)),
    //             child: Text(item.name!)))
    //         .toList());
  }
}
