import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewItemScreen"]["components"]
    ["BottomBarItemViewScreen"];

class BottomBarItemViewScreen extends StatefulWidget {
  const BottomBarItemViewScreen({
    Key? key,
    required this.cartItem,
    required this.mode,
    this.currentRestaurantId,
    required this.restaurant,
  }) : super(key: key);

  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;
  final Restaurant restaurant;
  final int? currentRestaurantId;

  @override
  _BottomBarItemViewScreenState createState() =>
      _BottomBarItemViewScreenState();
}

class _BottomBarItemViewScreenState extends State<BottomBarItemViewScreen> {
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();
  AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;

    return addItemToCartButton(txt);
  }

  Widget restaurantClosedNow() {
    return Container(
      height: 60,
      width: Get.width,
      color: Color(0xFFF9D8D6),
      child: Center(
        child: Text(
          "${_i18n()["notAvailable"]}",
          style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  Widget addItemToCartButton(TextTheme txt) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(bottom: 16, right: 5, left: 5, top: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 5),
          IncrementalComponent(
            btnColors: primaryBlueColor,
            onMinValueBtnColor: Colors.grey.shade300,
            incrementCallback: () {
              widget.cartItem.value!.quantity++;
              widget.cartItem.refresh();
            },
            decrementCallback: () {
              widget.cartItem.value!.quantity--;
              widget.cartItem.refresh();
            },
            minVal: 1,
            value: widget.cartItem.value!.quantity,
          ),
          const Spacer(),
          Container(
            child: Center(
              child: Text(
                "\$${widget.cartItem.value!.totalCost().toInt()} ",
                style: txt.headline3,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: (restaurantCartController.cart.value
                          .canAddSpecial(item: widget.cartItem.value!) ==
                      false)
                  ? () async {
                      mezDbgPrint("[cc] Exec :: _addSpecialItemCallBack ");
                      await _addSpecialItemCallBack();
                    }
                  : () async {
                      mezDbgPrint("[cc] Exec :: other ");

                      if (auth.fireAuthUser != null) {
                        if (ViewItemScreenMode.AddItemMode == widget.mode) {
                          mezDbgPrint("[cc] Exec :: AddItemMode ");

                          if (restaurantCartController
                                  .associatedRestaurant?.info.hasuraId
                                  .toString() !=
                              null) {
                            mezDbgPrint("[cc] Exec :: AddItemMode :: if 1 ");

                            if (restaurantCartController
                                    .associatedRestaurant?.info.hasuraId ==
                                widget.currentRestaurantId) {
                              final Cart? _c = await getCustomerCart(
                                customerId: auth.user!.hasuraId,
                              );
                              if (_c == null) {
                                await create_customer_cart(
                                    restaurant_id: restaurantCartController
                                        .associatedRestaurant!.info.hasuraId);
                              }
                              await add_item_to_cart(
                                  cartItem: widget.cartItem.value!);
                              restaurantCartController.cart.value.restaurant =
                                  widget.restaurant;
                              await MezRouter.offNamed<void>(kCartRoute);
                            } else {
                              await showStatusInfoDialog(
                                context,
                                bottomRightIcon: Icons.shopping_cart,
                                btnRightIconBgColor: secondaryLightBlueColor,
                                primaryImageUrl: restaurantCartController
                                    .associatedRestaurant?.info.image,
                                btnRightIconColor: primaryBlueColor,
                                status: restaurantCartController
                                        .associatedRestaurant?.info.name ??
                                    "",
                                primaryClickTitle: _i18n()["rightBtn"],
                                secondaryClickTitle: _i18n()["leftBtn"],
                                description: _i18n()["subtitle"],
                                secondaryCallBack: () async {
                                  MezRouter.popDialog<void>();
                                  await MezRouter.toNamed<void>(kCartRoute);
                                },
                                primaryCallBack: () async {
                                  MezRouter.popDialog<void>();
                                  await restaurantCartController
                                      .addItem(widget.cartItem.value!);
                                  await MezRouter.offNamed<void>(kCartRoute);
                                },
                              );
                            }
                          } else {
                            if (restaurantCartController.cart.value
                                        .canAddSpecial(
                                            item: widget.cartItem.value!) !=
                                    null &&
                                restaurantCartController.cart.value
                                        .canAddSpecial(
                                            item: widget.cartItem.value!) ==
                                    false) {
                              MezSnackbar("Error", "Special time error");
                            } else {
                              restaurantCartController.associatedRestaurant =
                                  widget.restaurant;
                              final Cart? _c = await getCustomerCart(
                                customerId: auth.user!.hasuraId,
                              );
                              if (_c == null) {
                                await create_customer_cart(
                                    restaurant_id: restaurantCartController
                                        .associatedRestaurant!.info.hasuraId);
                              }
                              final int? item_id = await add_item_to_cart(
                                cartItem: widget.cartItem.value!,
                              );
                              widget.cartItem.value?.idInCart = item_id;
                              widget.cartItem.refresh();
                              await MezRouter.offNamed<void>(kCartRoute);
                            }
                          }
                        } else {
                          await restaurantCartController
                              .addItem(widget.cartItem.value!);
                          MezRouter.back<void>();
                        }
                      } else {
                        dialogRequiredSignIn();
                      }
                    },
              child: Text(
                widget.mode == ViewItemScreenMode.AddItemMode
                    ? _i18n()['addToCart']
                    : _i18n()['modifyItem'],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addSpecialItemCallBack() async {
    await showStatusInfoDialog(
      context,
      bottomRightIcon: Icons.shopping_cart,
      btnRightIconBgColor: secondaryLightBlueColor,
      primaryImageUrl:
          restaurantCartController.cart.value.getFirstSpecialItem?.item.image,
      btnRightIconColor: primaryBlueColor,
      status: restaurantCartController.associatedRestaurant?.info.name ?? "",
      primaryClickTitle: _i18n()["rightBtn"],
      secondaryClickTitle: _i18n()["leftBtn"],
      description: _i18n()["specialSubtitle"],
      secondaryCallBack: () async {
        MezRouter.popDialog<void>();
        await MezRouter.toNamed<void>(kCartRoute);
      },
      primaryCallBack: () async {
        mezDbgPrint("OVERIDDDING CART WITH NEW SPECIAL");
        restaurantCartController.clearCart();
        await restaurantCartController.saveCart();
        mezDbgPrint(
            "Clearing cart =============================>>>>>${restaurantCartController.cart.value.cartItems}");
        await restaurantCartController.addItem(widget.cartItem.value!);
        await MezRouter.offNamed<void>(kCartRoute);
      },
    );
  }
}
