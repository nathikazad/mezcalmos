import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/checkBoxComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget chooseOneCheckBoxes(
    List<ChooseOneOption> chooseOneOptions, Rxn<CartItem> cartItem) {
  // print(this.itemWithOptions.value?.chosenOneOptions.toString());
  List<Widget> chooseOneWidgetArray = [];
  chooseOneOptions.forEach((chooseOneOption) {
    List<Widget> chooseOneWidgetOptionsArray = [];
    chooseOneOption.chooseOneOptionListItems.forEach((chooseOneOptionListItem) {
      String name = chooseOneOptionListItem.name!;
      if (chooseOneOptionListItem.cost > 0) {
        name += " +(\$${currency.format(chooseOneOptionListItem.cost)})";
      }
      chooseOneWidgetOptionsArray.add(
        CheckBoxComponent(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          title: name,
          intailVal: cartItem.value!.chosenOneOptions[chooseOneOption.id!] ==
              chooseOneOptionListItem.id,
          onValueChanged: (newValue) {
            cartItem.value!.chosenOneOptions[chooseOneOption.id!] =
                chooseOneOptionListItem.id!;
            cartItem.refresh();
          },
        ),
      );
    });
    chooseOneWidgetArray.add(Column(
        children: <Widget>[
              MenuTitles(
                title: chooseOneOption.name!,
              ),
              SizedBox(
                height: 5,
              )
            ] +
            chooseOneWidgetOptionsArray));
  });
  return Column(children: chooseOneWidgetArray);
}
