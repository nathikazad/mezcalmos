import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ViewItemScreenCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ChooseManyCheckBoxes extends StatelessWidget {
  final List<ChooseManyOption> chooseManyOptions;
  final Rxn<CartItem> cartItem;
  final LanguageController lang = Get.find<LanguageController>();

  ChooseManyCheckBoxes(
      {required this.cartItem, required this.chooseManyOptions});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            ...getHeadTitles(),
            ...chooseManyOptions.map((manyOptions) {
              mezDbgPrint(
                  "====>> Chosen Item ? ${cartItem.value!.findChooseManyItemById(manyOptions.id)?.chosen}");
              return ViewItemScreenCartComponent(
                title: manyOptions.name[lang.userLanguageKey]!,
                price: manyOptions.cost > 0
                    ? "\$${currency.format(manyOptions.cost)}"
                    : null,
                initialVal: cartItem.value!
                        .findChooseManyItemById(manyOptions.id)
                        ?.chosen ==
                    true,
                onValueChanged: (val) {
                  cartItem.value!.setNewChooseManyItem(
                      chooseManyOptionId: manyOptions.id, newVal: val ?? false);
                  cartItem.refresh();
                },
              );
            })
          ],
        ));
  }

  List<Widget> getHeadTitles() {
    List<Widget> _lst = [];
    if (chooseManyOptions.length > 0) {
      _lst.addAll([
        MenuTitles(
          title: lang.strings['shared']['inputLocation']['optional'],
        ),
        SizedBox(
          height: 15,
        )
      ]);
    }
    return _lst;
  }
}
