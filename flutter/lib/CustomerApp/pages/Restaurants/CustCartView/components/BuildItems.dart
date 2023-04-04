import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/components/itemChosenChoices.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/BuildCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/ItemInformationCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustItemView/CustItemView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildItems"];

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({Key? key, required this.viewController})
      : super(key: key);

  final CustCartViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CartItemsHeader(
            viewController: viewController,
          ),
          SizedBox(height: 9),
          Column(
            children: viewController.cart.cartItems.fold<List<Widget>>(
                <Widget>[], (List<Widget> children, CartItem cartItem) {
              // final Rx<num> counter = cartItem.totalCost().obs;
              children.add(Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: MyExpansionPanelComponent(
                  showExpandButton: cartItem.chosenChoices.isNotEmpty ||
                      (cartItem.notes != null && cartItem.notes != ""),
                  child: Flexible(
                      child: ItemInformationCart(
                    item: cartItem,
                    showImage: viewController.showItemsImages,
                    imageUrl: cartItem.item.image,
                    itemName:
                        cartItem.item.name[userLanguage]![0].toUpperCase() +
                            cartItem.item.name[userLanguage]!.substring(1),
                    itemsPrice: cartItem.totalCost().toStringAsFixed(0),
                    viewController: viewController,
                  )),
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildChoices(cartItem),
                      ),
                    ),
                    if (cartItem.notes != null && cartItem.notes != "")
                      _itemNotesComponent(cartItem, context),
                    SizedBox(
                      height: 9,
                    ),
                  ],
                  onEdit: () {
                    if (cartItem.idInCart != null)
                      CustItemView.navigateToCartItem(
                          cartItemId: cartItem.idInCart!);
                  },
                ),
              ));
              return children;
            }),
          ),
          // SizedBox(height: 15),
        ],
      ),
    );
  }

  Container _itemNotesComponent(CartItem cartItem, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Container(
            child: Text(
              "${_i18n()["itemNotes"]}",
              style: context.txt.bodyLarge,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              cartItem.notes!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChoices(CartItem cartItem) {
    final List<Widget> viewWidgets = [];
    cartItem.chosenChoices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
          choices: value,
          optionName: cartItem.item.getOptionName(int.parse(key))));
    });
    return viewWidgets;
  }
}
