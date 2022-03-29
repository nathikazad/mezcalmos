import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/IncrementalComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

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
      color: Colors.red,
      child: Center(child: Text("${_i18n()["notAvailable"]}")),
    );
  }

  Widget addItemToCartButton(TextTheme txt) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 5),
          IncrementalComponent(
            increment: (_) {
              widget.cartItem.value!.quantity++;
              widget.cartItem.refresh();
            },
            decrement: (_) {
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
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
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

                        final YesNoDialogButton clickedYes = await yesNoDialog(
                          text: _i18n()["title"],
                          titleUp: true,
                          icon: Container(
                            child: Icon(
                              Icons.warning_amber,
                              color: Colors.yellow,
                              size: 70,
                            ),
                          ),
                          buttonLeftStyle: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300]),
                            height: 30,
                            child: Text(_i18n()["leftBtn"]),
                          ),
                          buttonRightStyle: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue[800]),
                            height: 30,
                            child: Text(
                              _i18n()["rightBtn"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          body: _i18n()["subtitle"],
                        );
                        if (clickedYes == YesNoDialogButton.Yes) {
                          Get.back<void>();
                          await Get.toNamed<void>(kCartRoute);
                        } else {
                          Get.back<void>();
                          await restaurantCartController
                              .addItem(widget.cartItem.value!);
                          await Get.offNamed<void>(kCartRoute);
                        }
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
