import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
// import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

enum ViewItemScreenMode { AddItemMode, EditItemMode }

class CustItemViewController {
  // instances //
  AuthController _auth = Get.find<AuthController>();
  TextEditingController notesController = TextEditingController();
  CustomerCartController cartController = Get.find<CustomerCartController>();

  // state variables //
  Rxn<Restaurant> restaurant = Rxn();
  Rxn<CartItem> cartItem = Rxn<CartItem>();
  Rxn<Cart> cart = Rxn<Cart>();
  late ViewItemScreenMode currentMode;
// variables //
  int? itemRestaurantId;
  int? currentItemId;
  // getters //

  /// hasData means the cartItem and restaurant values are not null
  bool get hasData => restaurant.value != null && cartItem.value != null;

  /// returns the item object from the current cart item
  Item? get getItem => cartItem.value?.item;

  bool get isAdding =>
      currentMode == ViewItemScreenMode.AddItemMode &&
      _cartContainCurrentItem() == false;
  bool get itemHasDescription {
    return getItem!.description?[userLanguage] != null &&
        getItem!.description![userLanguage]!
            .toString()
            .removeAllWhitespace
            .isNotEmpty;
  }

  // methods //
  Future<void> init(
      {required int? itemId,
      required int? restaurantId,
      required int? itemIdInCart,
      required ViewItemScreenMode mode}) async {
    currentMode = mode;
    itemRestaurantId = restaurantId;
    currentItemId = itemId;

    // check and update cart restaurant id to current item restaurant if no cart items are there
    if (shouldUpdateRestaurantId()) {
      await cartController.setCartRestaurantId(restaurantId!);
    }

    // init add mode
    if (canInitAddMode(mode, restaurantId, itemId)) {
      await _fetchRestaurant(restaurantId!);
      final Item? item = await get_one_item_by_id(itemId!);
      cartItem.value = CartItem(item!, restaurantId);
    }
    // int edit mode
    else if (itemIdInCart != null) {
      if (cart.value != null) {
        cartItem.value =
            CartItem.clone(cart.value!.cartItems.firstWhere((CartItem item) {
          return item.idInCart == itemIdInCart;
        }));
        await _fetchRestaurant(cart.value!.restaurant!.restaurantId);
      }
    }
    cartItem.refresh();
  }

  Future<void> _fetchRestaurant(int restaurantId) async {
    try {
      restaurant.value = await get_restaurant_by_id(id: restaurantId);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  // handling items and cart methods //
  Future<void> handleEditItem() async {
    // todo
    await cartController.updateCartItem(cartItem.value!.idInCart!);
  }

  Future<int> handleAddItem() async {
    // todo
    return await cartController.addCartItem(cartItem.value!);
  }

  //  helpers //
  bool canInitAddMode(ViewItemScreenMode mode, int? restaurantId, int? itemId) {
    return mode == ViewItemScreenMode.AddItemMode &&
        restaurantId != null &&
        itemId != null;
  }

  bool shouldUpdateRestaurantId() {
    mezDbgPrint(
        "shouldUpdateRestaurantId ====> $itemRestaurantId ======>>>>${cart.value?.restaurant?.restaurantId}");
    return itemRestaurantId != null &&
        cart.value != null &&
        cart.value!.restaurant?.restaurantId != itemRestaurantId &&
        cart.value!.cartItems.isEmpty;
  }

  bool checkAddSpecialItemConflict() {
    return cartItem.value!.isSpecial &&
        cart.value?.canAddSpecial(item: cartItem.value!) == false;
  }

  bool differentRestaurantIds() {
    return cart.value != null &&
        cart.value!.restaurant?.restaurantId != itemRestaurantId;
  }

  bool _cartContainCurrentItem() {
    return cart.value?.cartItems.firstWhereOrNull(
            (CartItem element) => element.item.id == currentItemId) !=
        null;
  }

  // important //
  void dipose() {}
}
