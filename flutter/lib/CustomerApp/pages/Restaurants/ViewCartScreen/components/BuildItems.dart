import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/ItemInformationCart.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

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
    return Obx(() => Column(
      children: _restaurantController.cart.value.cartItems.fold<List<Widget>>(
          <Widget>[], (List<Widget> children, CartItem cartItem) {
        final Rx<num> counter = cartItem.totalCost().obs;
        children.add(Container(
          margin: const EdgeInsets.all(5),
          child: MyExpansionPanelComponent(
            child: Flexible(
                  child: ItemInformationCart(
                    imageUrl: cartItem.item.image,
                itemName: cartItem.item.name[userLanguage]![0].toUpperCase() +
                    cartItem.item.name[userLanguage]!.substring(1),
                restaurantName:
                    _restaurantController.associatedRestaurant?.info.name ?? "",
                itemsPrice: counter.value.toStringAsFixed(0),
              ),
                ),
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildChoices(cartItem.chosenChoices),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: Get.width,
                height: 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xffececec),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Spacer(),
                      IncrementalComponent(
                          minVal: 0,
                          increment: (_) {
                            counter.value =
                                counter.value + cartItem.costPerOne();
                            print("${cartItem.item.id}");
                            _restaurantController.incrementItem(
                                cartItem.idInCart!, 1);
                            _restaurantController.refresh();
                          },
                          onChangedToZero: (bool isZero) async {
                            if (isZero) {
                              _restaurantController.refresh();
                              final YesNoDialogButton yesNoResult =
                                  await cancelAlertDialog(
                                      title: _i18n()["deleteItem"],
                                      body: _i18n()["deleteItemConfirm"],
                                      icon: Container(
                                        child: Icon(
                                          Icons.highlight_off,
                                          size: 65,
                                          color: Color(0xffdb2846),
                                        ),
                                      ));
                              mezDbgPrint(
                                  " the returend value from the dailog $yesNoResult");
                              if (yesNoResult == YesNoDialogButton.Yes) {
                                _restaurantController
                                    .deleteItem(cartItem.idInCart!);
                                if (_restaurantController.cart.value
                                        .quantity() ==
                                    0) {
                                  _restaurantController.clearCart();
                                  Get.until((Route route) =>
                                      route.settings.name == kHomeRoute);
                                }
                                // controller.refresh();
                              }
                            }
                          },
                          value: cartItem.quantity,
                          decrement: (_) {
                            if (cartItem.quantity <= 1) {
                            } else {
                              counter.value =
                                  counter.value + cartItem.costPerOne();
                              _restaurantController.incrementItem(
                                  cartItem.idInCart!, -1);
                              _restaurantController.refresh();
                            }
                          }),
                    ],
                  )),
            ],
            onEdit: () {
              mezDbgPrint(
                  " the data inside the expansion ${cartItem.toFirebaseFunctionFormattedJson()}");
              Get.toNamed(editCartItemRoute("${cartItem.idInCart}"));
            },
          ),
        ));
        return children;
      }),
        ));
  }

  List<Widget> buildChoices(Map<String, List<Choice>> choices) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: key,
      ));
    });
    return viewWidgets;
  }
}
