import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantsInfoController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/models/restaurant.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'dart:async';
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewItemScreen extends GetView<RestaurantsInfoController> {
  String restaurantId;
  String itemtId;
  Rxn<Item> item = Rxn();
  Rxn<CartItem> itemWithOptions = Rxn();
  RestaurantCartController? restaurantCartController;
  ViewItemScreen(this.restaurantId, this.itemtId) {
    Get.put<RestaurantsInfoController>(RestaurantsInfoController());
    restaurantCartController =
        Get.put<RestaurantCartController>(RestaurantCartController());
    controller.getItem(restaurantId, itemtId).then((value) {
      item.value = value;
      itemWithOptions.value = CartItem(value, restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text("${item.value?.name ?? 'Loading'}")),
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
                          if (item.value != null) ...[
                            Text(item.value!.name!),
                            Text(item.value!.description!),
                            Text("\$${currency.format(item.value!.cost)}"),
                            image(item.value!.image),
                            chooseOneCheckBoxes(item.value!.chooseOneOptions),
                            chooseManyCheckBoxes(item.value!.chooseManyOptions),
                            incrementQuantityButton(),
                            Text(
                                "\$${currency.format(this.itemWithOptions.value!.cost)}"),
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
          value: this
                  .itemWithOptions
                  .value!
                  .chosenOneOptions[chooseOneOption.id!] ==
              chooseOneOptionListItem.id,
          onChanged: (newValue) {
            this.itemWithOptions.value!.chosenOneOptions[chooseOneOption.id!] =
                chooseOneOptionListItem.id!;
            this.itemWithOptions.value!.calculateCost();
            this.itemWithOptions.refresh();
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
        value:
            this.itemWithOptions.value!.chosenManyOptions[chooseManyOption.id!],
        onChanged: (newValue) {
          this.itemWithOptions.value!.chosenManyOptions[chooseManyOption.id!] =
              newValue ?? false;
          this.itemWithOptions.value!.calculateCost();
          this.itemWithOptions.refresh();
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
          this.itemWithOptions.value!.quantity++;
          this.itemWithOptions.value!.calculateCost();
          this.itemWithOptions.refresh();
        },
        child: Text(this.itemWithOptions.value!.quantity.toString()));
  }

  Widget addItemButton() {
    return OutlinedButton(
        child: Text("Add item to cart"),
        onPressed: () {
          restaurantCartController?.addItem(this.itemWithOptions.value!);
        });
  }
}
