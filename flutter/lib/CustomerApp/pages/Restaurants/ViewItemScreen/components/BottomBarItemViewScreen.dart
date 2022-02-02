import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/IncrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/DialogRequiredSignIn.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

class BottomBarItemViewScreen extends StatefulWidget {
  BottomBarItemViewScreen(
      {Key? key,
      required this.cartItem,
      required this.mode,
      required this.isAvailable,
      this.currentRestaurantId})
      : super(key: key);
  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;
  final String? currentRestaurantId;
  final bool isAvailable;

  @override
  _BottomBarItemViewScreenState createState() =>
      _BottomBarItemViewScreenState();
}

class _BottomBarItemViewScreenState extends State<BottomBarItemViewScreen> {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();
  AuthController auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return widget.isAvailable
        ? addItemToCartButton(txt)
        : restaurantClosedNow();
  }

  Widget restaurantClosedNow() {
    return Container(
      height: 60,
      width: Get.width,
      color: Colors.red,
      child: Center(
          child: Text(
              "${lang.strings["customer"]["restaurant"]["notAvailable"]}")),
    );
  }

  Widget addItemToCartButton(TextTheme txt) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 5,
          ),
          IncrementalComponent(
            increment: () {
              widget.cartItem.value!.quantity++;
              widget.cartItem.refresh();
            },
            decrement: () {
              widget.cartItem.value!.quantity--;
              widget.cartItem.refresh();
            },
            minVal: 1,
            value: widget.cartItem.value!.quantity,
          ),
          Spacer(),
          Container(
            child: Center(
                child: Text(
              "\$${widget.cartItem.value!.totalCost().toStringAsFixed(0)} ",
              style: txt.headline3,
            )),
          ),
          Spacer(),
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(172, 89, 252, 1))),
              onPressed: () async {
                if (auth.fireAuthUser != null) {
                  if (ViewItemScreenMode.AddItemMode == widget.mode) {
                    if (restaurantCartController.associatedRestaurant?.id !=
                        null) {
                      if (restaurantCartController.associatedRestaurant?.id ==
                          widget.currentRestaurantId) {
                        mezDbgPrint(
                            "the first id is ${restaurantCartController.associatedRestaurant?.id} and the scond is ${widget.currentRestaurantId}");
                        restaurantCartController
                            .addItem(widget.cartItem.value!);
                        Get.offNamed(kCartRoute);
                      } else {
                        mezDbgPrint(
                            "not true ${restaurantCartController.associatedRestaurant?.id} and the other is ${widget.currentRestaurantId}");

                        YesNoDialogButton clickedYes = await yesNoDialog(
                            text: lang.strings['customer']['restaurant']['menu']
                                ["dailog"]["title"],
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
                              child: Text(lang.strings['customer']['restaurant']
                                  ['menu']["dailog"]["leftBtn"]),
                            ),
                            buttonRightStyle: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue[800]),
                              height: 30,
                              child: Text(
                                lang.strings['customer']['restaurant']['menu']
                                    ["dailog"]["rightBtn"],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            body: lang.strings['customer']['restaurant']['menu']
                                ["dailog"]["subtitle"]);
                        if (clickedYes == YesNoDialogButton.Yes) {
                          Get.back();
                          Get.toNamed(kCartRoute);
                        } else {
                          Get.back();
                          restaurantCartController
                              .addItem(widget.cartItem.value!);
                          Get.offNamed(kCartRoute);
                        }
                      }
                    } else {
                      restaurantCartController.addItem(widget.cartItem.value!);
                      Get.offNamed(kCartRoute);
                    }
                  } else {
                    await restaurantCartController
                        .addItem(widget.cartItem.value!);
                    Get.back();
                  }
                } else {
                  dialogRequiredSignIn();
                }
              },
              child: Text(
                widget.mode == ViewItemScreenMode.AddItemMode
                    ? lang.strings['customer']['restaurant']['menu']
                        ['addToCart']
                    : lang.strings['customer']['restaurant']['menu']
                        ['modifyItem'],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
