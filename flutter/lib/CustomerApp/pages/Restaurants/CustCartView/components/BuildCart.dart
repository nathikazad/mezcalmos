import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildCart"];

class CartItemsHeader extends StatelessWidget {
  const CartItemsHeader({Key? key, required this.viewController})
      : super(key: key);
  final CustCartViewController viewController;

  /// RestaurantController

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    "${_i18n()["inCart"]}",
                    style: txt.headline2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await showConfirmationDialog(context,
                                title: _i18n()["clearCart"],
                                helperText: _i18n()["clearCartConfirm"],
                                primaryButtonText: _i18n()["yesClear"],
                                secondaryButtonText: _i18n()["no"],
                                onYesClick: () async {
                              await clear_customer_cart(
                                customer_id:
                                    Get.find<AuthController>().user!.hasuraId,
                              );

                              await viewController.cartController.clearCart();
                              viewController.refrechCart();

                              MezRouter.popDialog<void>();
                            });
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
