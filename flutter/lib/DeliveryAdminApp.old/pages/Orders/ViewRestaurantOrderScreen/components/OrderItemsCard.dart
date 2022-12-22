import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/BasicCellComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ViewRestaurantOrderScreen/components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

// build the order items inside the order info component
final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");
List<Widget> buildChoices(Map<String, List<Choice>> choices) {
  final List<Widget> viewWidgets = [];
  choices.forEach((String key, List<Choice> value) {
    viewWidgets.add(ItemChosenChoiceComponent(
      choices: value,
      optionName: key,
    ));
  });
  return viewWidgets;
}

Widget buildOrdersItems(List<RestaurantOrderItem> items) {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  return Container(
    child: Column(
      children: items.fold<List<Widget>>(
        <Widget>[],
        (List<Widget> children, RestaurantOrderItem element) {
          children.add(
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border:
                        Border.all(color: const Color(0xffececec), width: 0.5),
                    color: const Color(0x9affffff),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        //height: 43,
                        child: BasicCellComponent(
                          title: "${element.name[userLanguage]!.inCaps}",
                          url: "${element.image}",
                          traillingIcon: Container(
                            width: 25,
                            height: 25,
                            child: Text("${element.quantity}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xff5c7fff),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ProductSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(65)),
                              gradient: LinearGradient(
                                begin: Alignment(0.1689453125, 0),
                                end: Alignment(1, 1),
                                colors: <Color>[
                                  const Color(0xff5582ff)
                                      .withOpacity(0.05000000074505806),
                                  const Color(0xffc54efc)
                                      .withOpacity(0.05000000074505806)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        decoration: BoxDecoration(
                          color: const Color(0xffececec),
                        ),
                      ),
                      Container(
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 10, top: 15, bottom: 15),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "\$${currency.format(element.totalCost)}",
                              style: TextStyle(
                                color: const Color(0xff000f1c),
                                fontFamily: "psb",
                                fontSize: 20.0.sp,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
          return children;
        },
      ),
    ),
  );
}
