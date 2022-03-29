import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ViewItemScreenCartComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewItemScreen"]["components"]["ChoosenManyCheckBox"];

class ChooseManyCheckBoxes extends StatelessWidget {
  final List<ChooseManyOption> chooseManyOptions;
  final Rxn<CartItem> cartItem;

  const ChooseManyCheckBoxes({
    required this.cartItem,
    required this.chooseManyOptions,
  });

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...getHeadTitles(),
        ...chooseManyOptions.map((ChooseManyOption manyOptions) {
          mezDbgPrint(
              "====>> Chosen Item ? ${cartItem.value!.findChooseManyItemById(manyOptions.id)?.chosen}");
          return ViewItemScreenCartComponent(
            title: manyOptions.name[userLanguage]!,
            price: manyOptions.cost > 0
                ? "\$${currency.format(manyOptions.cost)}"
                : null,
            initialVal: cartItem.value!
                    .findChooseManyItemById(manyOptions.id)
                    ?.chosen ==
                true,
            onValueChanged: (bool? val) {
              cartItem.value!.setNewChooseManyItem(
                  chooseManyOptionId: manyOptions.id, newVal: val ?? false);
              cartItem.refresh();
            },
          );
        })
      ],
    );
  }

  List<Widget> getHeadTitles() {
    final List<Widget> _lst = <Widget>[];
    if (chooseManyOptions.length > 0) {
      _lst.addAll(
        <Widget>[
          MenuTitles(
            title: _i18n()['optional'],
          ),
          const SizedBox(height: 15)
        ],
      );
    }
    return _lst;
  }
}
