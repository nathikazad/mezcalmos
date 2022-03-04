import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

Widget orderShippingLocation(Rxn<RestaurantOrder> order) {
  LanguageController lang = Get.find<LanguageController>();
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(
            lang.strings['customer']['restaurant']['cart']['deliveryLocation'],
            style: const TextStyle(
                color: const Color(0xff000f1c),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: const Color(0x80ffffff),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(order.value!.to.address,
              style: const TextStyle(
                  color: const Color(0xff000f1c), fontSize: 14.0),
              textAlign: TextAlign.left),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
