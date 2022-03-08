import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ViewItemScreenCartComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ChooseOneCheckBox extends StatelessWidget {
  final List<ChooseOneOption> chooseOneOptions;
  final Rxn<CartItem> cartItem;
  final LanguageController lang = Get.find<LanguageController>();
  ChooseOneCheckBox({required this.chooseOneOptions, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...chooseOneOptions.map((oneOption) {
        return Column(
          children: [
            // head Category Title ie: Meat
            MenuTitles(
              title: oneOption.name[lang.userLanguageKey]!.capitalizeFirst,
            ),
            SizedBox(
              height: 15,
            ),
            // then comes out options ie : Beef, Veggie , Chicken
            ...oneOption.chooseOneOptionListItems.map((oneOptionItem) {
              return Obx(
                () => ViewItemScreenCartComponent(
                  title: oneOptionItem.name[lang.userLanguageKey],
                  initialVal: cartItem.value
                          ?.findChooseOneItemById(oneOptionItem.id)
                          ?.chosenOptionDetails
                          .id !=
                      null,
                  price: oneOptionItem.cost > 1
                      ? "\$${currency.format(oneOptionItem.cost)}"
                      : null,
                  onValueChanged: (val) {
                    cartItem.value!.setNewChooseOneItem(
                        chooseOneOptionId: oneOption.id,
                        newChooseOneOptionListItem: oneOptionItem);
                    cartItem.refresh();
                  },
                ),
              );
            })
          ],
        );
      })
    ]);
  }
}
