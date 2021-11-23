import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/checkBoxComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      height: 5,
    ));
  }

  chooseManyOptions.forEach((chooseManyOption) {
    String name = chooseManyOption.name!;
    if (chooseManyOption.cost > 0) {
      name += " +(\$${currency.format(chooseManyOption.cost)})";
    }
    chooseManyWidgetArray.add(
      CheckBoxComponent(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        title: name,
        intailVal: cartItem.value!.chosenManyOptions[chooseManyOption.id!],
        onValueChanged: (newValue) {
          cartItem.value!.chosenManyOptions[chooseManyOption.id!] =
              newValue ?? false;
          cartItem.refresh();
        },
      ),
    );
  });
  return Column(children: chooseManyWidgetArray);
}
