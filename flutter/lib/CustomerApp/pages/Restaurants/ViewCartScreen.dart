import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCurrentOrderScreen.dart';
import 'dart:async';

import 'package:mezcalmos/CustomerApp/router.dart';

class ViewCartScreen extends GetView<RestaurantCartController> {
  Rxn<Cart> cart = Rxn();

  ViewCartScreen() {
    RestaurantCartController controller = Get.find<RestaurantCartController>();
    cart = controller.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: Column(
            children: [
              OutlinedButton(
                  child: Text("Clear cart"),
                  onPressed: () {
                    controller.clearCart();
                  }),
              Obx(() {
                if (cart.value == null) {
                  return Text("Cart is empty");
                } else {
                  return buildCart(cart.value!);
                }
              }),
              OutlinedButton(
                  child: Text("Checkout"),
                  onPressed: () async {
                    dynamic response = await controller.checkout();
                    if (response["status"] == "Success")
                      Get.offNamedUntil(
                          getCurrentRestaurantOrderRoute(response["orderId"]),
                          (Route<dynamic> route) {
                        print(route.settings.name);
                        return (route.settings.name == kWrapperRoute);
                        // return route.;
                      });
                    else {
                      print(response);
                      if (response["errorCode"] == "serverError") {
                        // do something
                      } else if (response["errorCode"] ==
                          "inMoreThanThreeOrders") {
                        // do something
                      } else if (response["errorCode"] == "restaurantClosed") {
                        // do something
                      } else {
                        // do something
                      }
                    }
                  })
            ],
          ));
        }));
  }

  Widget buildCart(Cart cart) {
    return Column(children: [
      Text(cart.restaurant.name!),
      Text(cart.quantity().toString()),
      Text(cart.totalCost().toString()),
      buildItems(cart.items)
    ]);
  }

  Widget buildItems(List<CartItem> cartItems) {
    return Column(
      children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
        children.add(Row(children: [
          Text(element.id!),
          TextButton(
              onPressed: () => Get.toNamed(editCartItemRoute(element.id!)),
              child: Text("Edit Item"))
        ]
        ));
        return children;
      }),
    );
  }
}
