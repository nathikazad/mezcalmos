import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:intl/intl.dart';

import '../ViewItemScreen.dart';
import 'ViewItemScreenCartComponent.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget chooseOneCheckBoxes(
    List<ChooseOneOption> chooseOneOptions, Rxn<CartItem> cartItem) {
  LanguageController lang = Get.find<LanguageController>();
  // print(this.itemWithOptions.value?.chosenOneOptions.toString());
  List<Widget> chooseOneWidgetArray = [];
  chooseOneOptions.forEach((chooseOneOption) {
    List<Widget> chooseOneWidgetOptionsArray = [];
    chooseOneOption.chooseOneOptionListItems.forEach((chooseOneOptionListItem) {
      String? name = chooseOneOptionListItem.name[lang.userLanguageKey];

      String? price;
      if (chooseOneOptionListItem.cost > 0) {
        price = "\$${currency.format(chooseOneOptionListItem.cost)}";
      }
      chooseOneWidgetOptionsArray.add(ViewItemScreenCartComponent(
        title: name,
        intailVal: cartItem.value!.chosenOneOptions[chooseOneOption.id] ==
            chooseOneOptionListItem.id,
        price: price,
        onValueChanged: (val) {
          cartItem.value!.chosenOneOptions[chooseOneOption.id] =
              chooseOneOptionListItem.id;
          cartItem.refresh();
        },
      ));
    });
    chooseOneWidgetArray.add(Column(
        children: <Widget>[
              MenuTitles(
                title: chooseOneOption
                    .name[lang.userLanguageKey]!.capitalizeFirstofEach,
              ),
              SizedBox(
                height: 15,
              )
            ] +
            chooseOneWidgetOptionsArray));
  });
  return Column(children: chooseOneWidgetArray);
}
