import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/ItemComponent.dart';
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
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget buildItems(List<CartItem> cartItems) {
  RestaurantController controller = Get.find<RestaurantController>();
  LanguageController lang = Get.find<LanguageController>();

  print(cartItems.toString());
  return Column(
    children: cartItems.fold<List<Widget>>(<Widget>[], (children, element) {
      var counter = element.totalCost().obs;
      print("${element.toFirebaseFunctionFormattedJson()}");
      mezDbgPrint("${element.id}");
      children.add(
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x80ffffff),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyExpensionPanelComponent(
                  child: Container(
                    // width: 200,

                    child: ItemComponent(
                      imgUrl: "${element.item.image}",
                      title:
                          "${element.item.name?[0].toUpperCase()}${element.item.name?.substring(1)}",
                    ),
                  ),
                  children: choosenOneOption(element.chosenOneOptions) +
                      choosenMannyOption(element.chosenManyOptions),
                  onEdit: () {
                    mezDbgPrint(
                        " the data inside the expansion ${element.toFirebaseFunctionFormattedJson()}");
                    Get.toNamed(editCartItemRoute("${element.id}"));
                  }),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
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
                              bool yesNoResult = await cancelAlertDialog(
                                  title: lang.strings["customer"]["restaurant"]
                                      ["cart"]
                                    ["deleteItem"],
                                body: lang.strings["customer"]["restaurant"]
                                      ["cart"]["deleteItemConfirm"]);
                              mezDbgPrint(
                                  " the returend value from the dailog $yesNoResult");
                              if (yesNoResult == true) {
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
                      Spacer(),
                      Obx(
                        () => Text("\$${currency.format(counter.value)}",
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "ProductSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0),
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
      return children;
    }),
  );
}
