import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewItemScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  String itemId;
  Rxn<CartItem> cartItem = Rxn();
  RestaurantCartController? restaurantCartController;
  ViewItemScreen(this.restaurantId, this.itemId, this.restaurantCartController);

  factory ViewItemScreen.forNewItem(String restaurantId, String itemId) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    ViewItemScreen viewItemScreen = ViewItemScreen(restaurantId, itemId,
        Get.put<RestaurantCartController>(RestaurantCartController()));

    viewItemScreen.controller.getItem(restaurantId, itemId).then((value) {
      viewItemScreen.cartItem.value = CartItem(value, restaurantId);
    });
    return viewItemScreen;
  }

  factory ViewItemScreen.forAlreadyInCartItem(CartItem cartItem) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    ViewItemScreen viewItemScreen = ViewItemScreen(
        cartItem.restaurantId,
        cartItem.item.id!,
        Get.put<RestaurantCartController>(RestaurantCartController()));
    viewItemScreen.cartItem.value = CartItem.clone(cartItem);
    return viewItemScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${cartItem.value?.item.name ?? 'Loading'}")),
          actions: [
            TextButton(
                onPressed: () => Get.to(ViewCartScreen()), child: Text("Cart"))
          ],
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Obx(() => Column(
                        children: [
                          if (cartItem.value?.item != null) ...[
                            Text(cartItem.value!.item.name!),
                            Text(cartItem.value!.item.description!),
                            Text(
                                "\$${currency.format(cartItem.value!.item.cost)}"),
                            image(cartItem.value!.item.image),
                            chooseOneCheckBoxes(
                                cartItem.value!.item.chooseOneOptions),
                            chooseManyCheckBoxes(
                                cartItem.value!.item.chooseManyOptions),
                            incrementQuantityButton(),
                            Text(
                                "\$${currency.format(cartItem.value!.totalCost)}"),
                            addItemButton()
                          ] else
                            Text("Loading")
                        ],
                      ))));
        }));
  }

  Widget image(String? imageLink) {
    if (imageLink != null)
      return Image.network(imageLink, height: 40);
    else
      return Text("Loading");
  }

  Widget chooseOneCheckBoxes(List<ChooseOneOption> chooseOneOptions) {
    // print(this.itemWithOptions.value?.chosenOneOptions.toString());
    List<Widget> chooseOneWidgetArray = [];
    chooseOneOptions.forEach((chooseOneOption) {
      List<Widget> chooseOneWidgetOptionsArray = [];
      chooseOneOption.chooseOneOptionListItems
          .forEach((chooseOneOptionListItem) {
        String name = chooseOneOptionListItem.name!;
        if (chooseOneOptionListItem.cost > 0) {
          name += " (\$${currency.format(chooseOneOptionListItem.cost)})";
        }
        chooseOneWidgetOptionsArray.add(CheckboxListTile(
          title: Text(name),
          value: cartItem.value!.chosenOneOptions[chooseOneOption.id!] ==
              chooseOneOptionListItem.id,
          onChanged: (newValue) {
            cartItem.value!.chosenOneOptions[chooseOneOption.id!] =
                chooseOneOptionListItem.id!;
            cartItem.value!.calculateCost();
            cartItem.refresh();
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ));
      });
      chooseOneWidgetArray.add(Column(
          children: <Widget>[Text(chooseOneOption.name!)] +
              chooseOneWidgetOptionsArray));
    });
    return Column(children: chooseOneWidgetArray);
  }

  Widget chooseManyCheckBoxes(List<ChooseManyOption> chooseManyOptions) {
    List<Widget> chooseManyWidgetArray = [Text("Optional")];
    chooseManyOptions.forEach((chooseManyOption) {
      String name = chooseManyOption.name!;
      if (chooseManyOption.cost > 0) {
        name += " (\$${currency.format(chooseManyOption.cost)})";
      }
      chooseManyWidgetArray.add(CheckboxListTile(
        title: Text(name),
        value: cartItem.value!.chosenManyOptions[chooseManyOption.id!],
        onChanged: (newValue) {
          cartItem.value!.chosenManyOptions[chooseManyOption.id!] =
              newValue ?? false;
          cartItem.value!.calculateCost();
          cartItem.refresh();
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ));
    });
    return Column(children: chooseManyWidgetArray);
  }

  Widget incrementQuantityButton() {
    return OutlinedButton(
        onPressed: () {
          cartItem.value!.quantity++;
          cartItem.value!.calculateCost();
          cartItem.refresh();
        },
        child: Text(cartItem.value!.quantity.toString()));
  }

  Widget addItemButton() {
    return OutlinedButton(
        child: Text("Add item to cart"),
        onPressed: () {
          restaurantCartController?.addItem(cartItem.value!, this.restaurantId);
        });
  }
}
