import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/myExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/choosenMannyOption.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

import 'choosenOneOption.dart';
import 'itemInformationCart.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget buildItems(List<CartItem> cartItems, BuildContext context) {
  RestaurantController controller = Get.find<RestaurantController>();
  LanguageController lang = Get.find<LanguageController>();

  print(cartItems.toString());
  return Column(
    children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
      var counter = element.totalCost().obs;
      print("${element.toFirebaseFunctionFormattedJson()}");
      mezDbgPrint("${element.id}");
      children.add(Container(
        padding: const EdgeInsets.only(bottom: 15),
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: MyExpensionPanelComponent(
          child: Flexible(
              // width: 200,
              child: Obx(
            () => ItemInformationCart(
              imageUrl: element.item.image!,
              itemName: element.item.name!,
              restaurantName: "Basic food",
              itemsPrice: "${currency.format(counter.value)}",
            ),
          )),
          children: choosenOneOption(element.chosenOneOptions, context) +
              choosenMannyOption(element.chosenManyOptions, context) +
              [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: Get.width,
                  height: 0.5,
                  decoration: BoxDecoration(
                    color: const Color(0xffececec),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Spacer(),
                        IncrementalComponent(
                            minVal: 0,
                            increment: () {
                              counter.value =
                                  counter.value + element.costPerOne();
                              print("${element.item.id}");
                              controller.incrementItem(element.id!, 1);
                              controller.refresh();
                            },
                            onChangedToZero: (isZero) async {
                              if (isZero) {
                                controller.refresh();
                                YesNoDialogButton yesNoResult =
                                    await cancelAlertDialog(
                                        title: lang.strings["customer"]
                                                ["restaurant"]["cart"]
                                            ["deleteItem"],
                                        body: lang.strings["customer"]
                                                ["restaurant"]["cart"]
                                            ["deleteItemConfirm"],
                                        icon: Container(
                                          child: Icon(
                                            Icons.highlight_off,
                                            size: 65,
                                            color: Color(0xffdb2846),
                                          ),
                                        ));
                                mezDbgPrint(
                                    " the returend value from the dailog $yesNoResult");
                                if (yesNoResult == YesNoDialogButton.Yes) {
                                  controller.deleteItem("${element.id}");

                                  if (controller.cart.value.quantity() == 0) {
                                    Get.until((route) =>
                                        route.settings.name == kHomeRoute);
                                  }
                                  // controller.refresh();
                                }
                              }
                            },
                            value: element.quantity,
                            decrement: () {
                              if (element.quantity <= 1) {
                              } else {
                                counter.value =
                                    counter.value + element.costPerOne();
                                controller.incrementItem(element.id!, -1);
                                controller.refresh();
                              }
                            }),
                      ],
                    )),
              ],
          onEdit: () {
            mezDbgPrint(
                " the data inside the expansion ${element.toFirebaseFunctionFormattedJson()}");
            Get.toNamed(editCartItemRoute("${element.id}"));
          },
        ),
      ));
      return children;
    }),
  );
}
