import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
        ["Orders"]["ViewRestaurantOrderScreen"]["components"]["OrderNoteCard"];

// Display the notte of the order inside the order view
Widget orderNoteCard(Rxn<RestaurantOrder> order) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text("${_i18n()['notes']}",
            style: const TextStyle(
                color: Color(0xff000f1c),
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
          color: Colors.white,
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
              order.value!.notes == null ? "Nothing" : "${order.value!.notes} ",
              style: const TextStyle(
                  color: Color(0xff000f1c),
                  fontFamily: "psr",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.left),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}
