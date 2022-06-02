import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewItemScreen"]["components"]
    ["BottomBarItemViewScreen"];

class BottomBarItemViewScreen extends StatefulWidget {
  const BottomBarItemViewScreen({
    Key? key,
    required this.cartItem,
    required this.mode,
    required this.isAvailable,
    this.currentRestaurantId,
  }) : super(key: key);

  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;
  final String? currentRestaurantId;
  final bool isAvailable;

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

    return widget.isAvailable
        ? addItemToCartButton(txt)
        : restaurantClosedNow();
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
            flex: 5,
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
              onPressed: () async {
                if (auth.fireAuthUser != null) {
                  if (ViewItemScreenMode.AddItemMode == widget.mode) {
                    if (restaurantCartController
                            .associatedRestaurant?.info.id !=
                        null) {
                      if (restaurantCartController
                              .associatedRestaurant?.info.id ==
                          widget.currentRestaurantId) {
                        mezDbgPrint(
                            "the first id is ${restaurantCartController.associatedRestaurant?.info.id} and the scond is ${widget.currentRestaurantId}");
                        await restaurantCartController
                            .addItem(widget.cartItem.value!);
                        await Get.offNamed<void>(kCartRoute);
                      } else {
                        mezDbgPrint(
                            "not true ${restaurantCartController.associatedRestaurant?.info.id} and the other is ${widget.currentRestaurantId}");

                        await showStatusInfoDialog(
                          context,
                          bottomRightIcon: Icons.shopping_cart,
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
                            Get.back<void>();
                            await Get.toNamed<void>(kCartRoute);
                          },
                          primaryCallBack: () async {
                            Get.back<void>();
                            await restaurantCartController
                                .addItem(widget.cartItem.value!);
                            await Get.offNamed<void>(kCartRoute);
                          },
                        );
                      }
                    } else {
                      await restaurantCartController
                          .addItem(widget.cartItem.value!);
                      await Get.offNamed<void>(kCartRoute);
                    }
                  } else {
                    await restaurantCartController
                        .addItem(widget.cartItem.value!);
                    Get.back<void>();
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
}
