import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ItemInformationCart.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildItems"];

class CartItemsBuilder extends StatelessWidget {
  const CartItemsBuilder({Key? key}) : super(key: key);

  /// RestaurantController
  static final RestaurantController _restaurantController =
      Get.find<RestaurantController>();

  /// LanguageType
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: _restaurantController.cart.value.cartItems.fold<List<Widget>>(
            <Widget>[], (List<Widget> children, CartItem cartItem) {
          // final Rx<num> counter = cartItem.totalCost().obs;
          children.add(Container(
            margin: const EdgeInsets.all(5),
            child: MyExpansionPanelComponent(
              child: Flexible(
                  child: ItemInformationCart(
                item: cartItem,
                showImage: _restaurantController.showItemsImages,
                imageUrl: cartItem.item.image,
                itemName: cartItem.item.name[userLanguage]![0].toUpperCase() +
                    cartItem.item.name[userLanguage]!.substring(1),
                restaurantName:
                    _restaurantController.associatedRestaurant?.info.name ?? "",
                itemsPrice: cartItem.totalCost().toStringAsFixed(0),
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
                  _itemNotesComponent(cartItem, context),
                SizedBox(
                  height: 10,
                ),
              ],
              onEdit: () {
                mezDbgPrint(
                    " the data inside the expansion ${cartItem.toFirebaseFunctionFormattedJson()}");
                if (cartItem.idInCart != null)
                  MezRouter.toNamed(editCartItemRoute(cartItem.idInCart!));
              },
            ),
          ));
          return children;
        }),
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
              style: Get.textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              cartItem.notes!,
              style: Theme.of(context).textTheme.bodyText2,
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
          optionName:
              cartItem.item.findOption(key)?.name ?? <LanguageType, String>{}));
    });
    return viewWidgets;
  }
}
