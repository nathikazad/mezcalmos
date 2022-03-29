import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/ViewItemScreenCartComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

class ChooseOneCheckBox extends StatelessWidget {
  final List<ChooseOneOption> chooseOneOptions;
  final Rxn<CartItem> cartItem;

  const ChooseOneCheckBox({
    Key? key,
    required this.chooseOneOptions,
    required this.cartItem,
  }) : super(key: key);

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ...chooseOneOptions.map((ChooseOneOption oneOption) {
        return Column(
          children: [
            // head Category Title ie: Meat
            MenuTitles(
              title: oneOption.name[userLanguage]!.capitalizeFirst,
            ),
            const SizedBox(height: 15),
            // then comes out options ie : Beef, Veggie , Chicken
            ...oneOption.chooseOneOptionListItems
                .map((ChooseOneOptionListItem oneOptionItem) {
              return Obx(
                () => ViewItemScreenCartComponent(
                  title: oneOptionItem.name[userLanguage],
                  initialVal: cartItem.value
                          ?.findChooseOneItemById(oneOptionItem.id)
                          ?.chosenOptionDetails
                          .id !=
                      null,
                  price: oneOptionItem.cost > 1
                      ? "\$${currency.format(oneOptionItem.cost)}"
                      : null,
                  onValueChanged: (bool? val) {
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
