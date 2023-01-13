import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]["notesWidget"];

Widget notesWidget(Rxn<RestaurantOrder> order) {
  return Card(
    margin: const EdgeInsets.only(top: 20),
    child: Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _i18n()['notes'],
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Container(
            child: Text(
              order.value!.notes!,
              style: Get.textTheme.subtitle2,
            ),
          ),
        ],
      ),
    ),
  );
}
