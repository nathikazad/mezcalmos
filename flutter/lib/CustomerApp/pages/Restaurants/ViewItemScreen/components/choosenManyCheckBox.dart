import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../ViewItemScreen.dart';
import 'ViewItemScreenCartComponent.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget chooseManyCheckBoxes(
    List<ChooseManyOption> chooseManyOptions, Rxn<CartItem> cartItem) {
  LanguageController lang = Get.find<LanguageController>();

  List<Widget> chooseManyWidgetArray = [];
  if (chooseManyOptions.length > 0) {
    chooseManyWidgetArray.add(MenuTitles(
      title: lang.strings['shared']['inputLocation']['optional'],
    ));
    chooseManyWidgetArray.add(SizedBox(
      height: 15,
    ));
  }

  chooseManyOptions.forEach((chooseManyOption) {
    String name = chooseManyOption.name[lang.userLanguageKey]!;
    String? price;
    if (chooseManyOption.cost > 0) {
      price = "\$${currency.format(chooseManyOption.cost)}";
    }
    chooseManyWidgetArray.add(ViewItemScreenCartComponent(
      title: name,
      price: price,
      intailVal: cartItem.value!.chosenManyOptions[chooseManyOption.id],
      onValueChanged: (val) {
        cartItem.value!.chosenManyOptions[chooseManyOption.id] = val ?? false;
        cartItem.refresh();
      },
    ));
  });
  return Column(children: chooseManyWidgetArray);
}
