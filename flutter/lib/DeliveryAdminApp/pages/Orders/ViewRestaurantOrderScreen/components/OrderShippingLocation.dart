import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

Widget orderShippingLocation(Rxn<RestaurantOrder> order) {
  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
          ['pages']['Orders']["ViewRestaurantOrderScreen"]["components"]
      ["OrderShippingLocation"];
  return Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(_i18n()['deliveryLocation'],
            style: const TextStyle(
                color: Color(0xff000f1c),
                fontFamily: "psb",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
      const SizedBox(height: 15),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffececec), width: 0.5),
          color: Colors.white,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(order.value!.to.address,
              style: const TextStyle(color: Color(0xff000f1c), fontSize: 14.0),
              textAlign: TextAlign.left),
        ),
      ),
      const SizedBox(height: 30),
    ],
  );
}
