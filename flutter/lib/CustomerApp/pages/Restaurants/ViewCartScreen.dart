import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen.dart';
import 'dart:async';

class ViewCartScreen extends GetView<RestaurantCartController> {
  Rxn<Cart> cart = Rxn();

  ViewCartScreen() {
    RestaurantCartController controller =
        Get.put<RestaurantCartController>(RestaurantCartController());
    cart = controller.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Column(
          children: [
            OutlinedButton(
                child: Text("Clear cart"),
                onPressed: () {
                  controller.clearCart();
                }),
            Obx(() {
              return Text(cart.value?.toFirebaseFormattedJson().toString() ??
                  "Cart is empty");
            }),
            OutlinedButton(
                child: Text("Checkout"),
                onPressed: () async {
                  await controller.checkout();
                  // check status and error message
                  Get.offAll(ViewOrderScreen());
                })
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
