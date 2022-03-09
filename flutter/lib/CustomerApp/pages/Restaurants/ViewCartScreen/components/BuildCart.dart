import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
    ["Restaurants"]["ViewCartScreen"]["components"]["BuildCart"];


class CartBuilder extends StatelessWidget {
  CartBuilder({Key? key}) : super(key: key);
  final RestaurantController controller = Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: 15,
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
                        "${_i18n()["inCart"]}",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28)),
                      child: InkWell(
                        onTap: () async {
                          YesNoDialogButton yesNoRes = await cancelAlertDialog(
                            title: _i18n()["clearCart"],
                            body: _i18n()["clearCartConfirm"],
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
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                    "${_i18n()["clear"]}"),
                              ),
                              Icon(
                                Icons.delete_outline,
                                size: 15,
                              ),
                            ],
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
}
