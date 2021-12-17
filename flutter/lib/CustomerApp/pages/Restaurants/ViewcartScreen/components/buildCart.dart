import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

Widget buildCart(Cart cart, BuildContext context) {
  final txt = Theme.of(context).textTheme;

  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();

  return Column(
    children: [
      SizedBox(
        height: Get.height * 0.07,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Text(
                      "${lang.strings["customer"]["restaurant"]["cart"]["inCart"]}",
                      style: txt.headline2,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    child: Text(
                      "${cart.quantity()} ${lang.strings["customer"]["restaurant"]["menu"]["items"]}",
                      style: txt.headline2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    height: 30,
                    width: 30,
                    child: InkWell(
                      onTap: () async {
                        YesNoDialogButton yesNoRes = await cancelAlertDialog(
                          title: lang.strings["customer"]["restaurant"]["cart"]
                              ["clearCart"],
                          body: lang.strings["customer"]["restaurant"]["cart"]
                              ["clearCartConfirm"],
                          icon: Container(
                            child: Icon(
                              Icons.highlight_off,
                              size: 65,
                              color: Color(0xffdb2846),
                            ),
                          ),
                        );

                        if (yesNoRes == YesNoDialogButton.Yes) {
                          controller.clearCart();
                          Get.back();
                        }
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.delete_outline,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ],
  );
}
