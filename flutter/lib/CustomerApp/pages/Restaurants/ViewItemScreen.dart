import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

enum ViewItemScreenMode { AddItemMode, EditItemMode }

class ViewItemScreen extends GetView<RestaurantsInfoController> {
  ViewItemScreenMode viewItemScreenMode;
  Rxn<CartItem> cartItem = Rxn();
  late RestaurantCartController restaurantCartController;

  ViewItemScreen(this.viewItemScreenMode) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantCartController>(RestaurantCartController());
    if (this.viewItemScreenMode == ViewItemScreenMode.AddItemMode) {
      String restaurantId = Get.parameters['restaurantId']!;
      String itemId = Get.parameters['itemId']!;
      this.controller.getItem(restaurantId, itemId).then((value) {
        this.cartItem.value = CartItem(value, restaurantId);
      });
    } else {
      this.cartItem.value = CartItem.clone(restaurantCartController
          .cart.value!.items
          .firstWhere((item) => item.id == Get.parameters["cartItemId"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${cartItem.value?.item.name ?? 'Loading'}")),
          actions: [
            TextButton(
                onPressed: () =>
                    (this.viewItemScreenMode == ViewItemScreenMode.AddItemMode)
                        ? Get.toNamed(kCartRoute)
                        : Get.back(),
                child: Text("Cart"))
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
                                "\$${currency.format(cartItem.value!.totalCost())}"),
                            (this.viewItemScreenMode ==
                                    ViewItemScreenMode.AddItemMode)
                                ? addItemButton()
                                : editItemButton()
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
        value: cartItem.value!.chosenManyOptions[chooseManyOption.id!] ?? false,
        onChanged: (newValue) {
          cartItem.value!.chosenManyOptions[chooseManyOption.id!] =
              newValue ?? false;
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
          cartItem.refresh();
        },
        child: Text(cartItem.value!.quantity.toString()));
  }

  Widget addItemButton() {
    return OutlinedButton(
        child: Text("Add item to cart"),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.off(ViewCartScreen());
        });
  }

  Widget editItemButton() {
    return OutlinedButton(
        child: Text("Edit item"),
        onPressed: () {
          restaurantCartController.addItem(cartItem.value!);
          Get.back();
        });
  }
}
