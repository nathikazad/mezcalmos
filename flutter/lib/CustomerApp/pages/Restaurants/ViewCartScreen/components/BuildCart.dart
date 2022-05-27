import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["BuildCart"];

class CartBuilder extends StatelessWidget {
  const CartBuilder({Key? key}) : super(key: key);

  /// RestaurantController
  static final RestaurantController controller =
      Get.find<RestaurantController>();

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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await showConfirmationDialog(context,
                              title: _i18n()["clearCart"],
                              helperText: _i18n()["clearCartConfirm"],
                              primaryButtonText: _i18n()["yesClear"],
                              secondaryButtonText: _i18n()["no"],
                              onYesClick: () async {
                            controller.clearCart();
                            Get.back<void>();
                          });
                        },
                        child: const Icon(
                          Ionicons.trash_outline,
                          size: 22,
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
}
