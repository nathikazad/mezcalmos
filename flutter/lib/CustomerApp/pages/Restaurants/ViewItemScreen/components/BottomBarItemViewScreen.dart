import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

import '../../../../router.dart';
import '../ViewItemScreen.dart';
import 'dailogCheckCartIfEmpty.dart';
import 'dialogRequiredSignIn.dart';

class BottomBarItemViewScreen extends StatefulWidget {
  BottomBarItemViewScreen(
      {Key? key,
      required this.cartItem,
      required this.mode,
      this.currentRestaurantId})
      : super(key: key);
  final Rxn<CartItem> cartItem;
  final ViewItemScreenMode mode;
  final String? currentRestaurantId;

  @override
  _BottomBarItemViewScreenState createState() =>
      _BottomBarItemViewScreenState();
}

class _BottomBarItemViewScreenState extends State<BottomBarItemViewScreen> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    LanguageController lang = Get.find<LanguageController>();
    RestaurantController restaurantCartController =
        Get.find<RestaurantController>();
    AuthController auth = Get.find<AuthController>();

    return Container(
        child: Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: IncrementalComponent(
                increment: () {
                  widget.cartItem.value!.quantity++;
                  widget.cartItem.refresh();
                },
                decrement: () {
                  // if(widget.cartItem.value!.quantity<=1){

                  // }
                  widget.cartItem.value!.quantity--;
                  widget.cartItem.refresh();
                },
                minVal: 1,
                value: widget.cartItem.value!.quantity,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //price thing
              child: Center(
                  child: Text(
                "${currency.format(widget.cartItem.value!.totalCost())} \$",
                style: txt.headline2,
              )),
            ),
          ),
          TextButton(
            onPressed: () async {
              if (auth.fireAuthUser != null) {
                if (ViewItemScreenMode.AddItemMode == widget.mode) {
                  if (restaurantCartController.associatedRestaurant?.id !=
                      null) {
                    if (restaurantCartController.associatedRestaurant?.id ==
                        widget.currentRestaurantId) {
                      mezDbgPrint(
                          "the first id is ${restaurantCartController.associatedRestaurant?.id} and the scond is ${widget.currentRestaurantId}");
                      restaurantCartController.addItem(widget.cartItem.value!);
                      Get.offNamed(kCartRoute);
                    } else {
                      mezDbgPrint(
                          "not true ${restaurantCartController.associatedRestaurant?.id} and the other is ${widget.currentRestaurantId}");

                      YesNoDialogButton clickedYes = await yesNoDialog(
                          text: 'Warrning !!',
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
                            child: Text("Checkout"),
                          ),
                          buttonRightStyle: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue[800]),
                            height: 30,
                            child: Text(
                              "Overwrite",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          body:
                              "You already have some items in your cart, Would you like to discard to them ?");
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
                  restaurantCartController.addItem(widget.cartItem.value!);
                  Get.back();
                }
              } else {
                dialogRequiredSignIn();
              }
            },
            child: Text(
              widget.mode == ViewItemScreenMode.AddItemMode
                  ? lang.strings['customer']['restaurant']['menu']['addToCart']
                  : lang.strings['customer']['restaurant']['menu']
                      ['modifyItem'],
            ),
          ),
        ],
      ),
    ));
  }
}
