import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';

class CustBusinessCartController extends GetxController {
// instances //
  // HasuraDb _hasuraDb = Get.find<HasuraDb>();
  AuthController _auth = Get.find<AuthController>();
  //
  Rxn<BusinessCart> cart = Rxn<BusinessCart>();
  // streams //
  // StreamSubscription<BusinessCart?>? cartStream;
  // String? subscriptionId;
  @override
  Future<void> onInit() async {
    if (_auth.hasuraUserId != null) {
      await _initCart();

      cart.refresh();
    }
    super.onInit();
  }

  Future<void> _initCart() async {
    await fetchCart();
    // await _handlerRestaurantId();
  }

  Future<void> fetchCart() async {
    if (_auth.hasuraUserId != null) {
      final BusinessCart? value = await get_business_cart(
        customerId: _auth.hasuraUserId!,
      );
      if (value != null) {
        cart.value = value;
      } else {
        await create_business_cart();
      }
    }
  }

  // Future<void> _handlerRestaurantId() async {
  //   if (cart.value != null &&
  //       cart.value?.restaurant == null &&
  //       cart.value!.items.isNotEmpty) {
  //     // await setCartRestaurantId(cart.value!.items.first.restaurantId);
  //   }
  // }

  // Future<int?> setCartRestaurantId(int restaurantId) async {
  //   try {
  //     final int res = await set_cart_restaurant_id(
  //       customer_id: _auth.hasuraUserId!,
  //       restaurant_id: restaurantId,
  //     );
  //     return res;
  //   } catch (e, stk) {
  //     mezDbgPrint(e);
  //     mezDbgPrint(stk);
  //   }
  //   return null;
  // }
  Future<int?> addCartItem(BusinessCartItem cartItem) async {
    try {
      final int res = await add_item_to_business_cart(
        cartItem: cartItem,
      );
      return res;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }
}
