import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/BuildCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/ItemInformationCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:qlevar_router/qlevar_router.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildItems"];

class CartItemsBuilder extends StatelessWidget {
  CartItemsBuilder({
    Key? key,
    required this.viewController,
    this.isWebVersion,
  }) : super(key: key);
  bool? isWebVersion = false;

  final CustCartViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CartItemsHeader(
            viewController: viewController,
          ),
          SizedBox(height: 10),
          Column(
            children: viewController.cart.cartItems.fold<List<Widget>>(
                <Widget>[], (List<Widget> children, CartItem cartItem) {
              // final Rx<num> counter = cartItem.totalCost().obs;
              children.add(Container(
                margin: const EdgeInsets.all(5),
                child: MyExpansionPanelComponent(
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildChoices(cartItem),
                      ),
                    ),
                    if (cartItem.notes != null)
                      _itemNotesComponent(cartItem, context,
                          isWebVersion: isWebVersion),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  onEdit: () {
                    if (isWebVersion == true) {
                      mezDbgPrint(
                          " the data inside the expansion ${cartItem.toFirebaseFunctionFormattedJson()}");

                      QR.to(
                          "/restaurants/${cartItem.restaurantId}/${cartItem.item.id}?mode=edit&idInCart=${cartItem.idInCart}");
                    } else {
                      if (cartItem.idInCart != null)
                        MezRouter.toNamed(
                            editCartItemRoute(cartItem.idInCart!));
                    }
                  },
                ),
              ));
              return children;
            }),
          ),
        ],
      ),
    );
  }

  Container _itemNotesComponent(CartItem cartItem, BuildContext context,
      {bool? isWebVersion = false}) {
    final txt = Theme.of(context).textTheme;
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
              style: txt.bodyText1!.copyWith(
                  fontSize: isWebVersion == true ? 16 : null,
                  fontWeight: isWebVersion == true ? FontWeight.w700 : null),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              cartItem.notes!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: isWebVersion == true ? 14 : null,
                  fontWeight: isWebVersion == true ? FontWeight.w500 : null),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChoices(CartItem cartItem) {
    final List<Widget> viewWidgets = [];
    cartItem.chosenChoices.forEach((String key, List<Choice> value) {
      mezDbgPrint(
          "From get option names 📥📥📥📥📥 ======>${int.parse(key)} \n ${cartItem.item.findOption(int.parse(key))?.name} ");
      viewWidgets.add(ItemChosenChoiceComponent(
          choices: value,
          optionName: cartItem.item.getOptionName(int.parse(key))));
    });
    return viewWidgets;
  }
}
