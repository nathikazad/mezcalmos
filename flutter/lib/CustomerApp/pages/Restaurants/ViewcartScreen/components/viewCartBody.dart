import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/dropDownListCartView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/textFieldComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

import 'buildCart.dart';
import 'buildItems.dart';
import 'orderSummaryCard.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

class ViewCartBody extends StatefulWidget {
  final OnDropDownNewValue? onValueChangeCallback;

  ViewCartBody({Key? key, this.onValueChangeCallback}) : super(key: key);

  @override
  _ViewCartBodyState createState() => _ViewCartBodyState();
}

class _ViewCartBodyState extends State<ViewCartBody> {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController controller = Get.find<RestaurantController>();
  TextEditingController textcontoller = new TextEditingController();

  @override
  void dispose() {
    textcontoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          (controller.cart.value.quantity() >= 1)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildCart(controller.cart.value, context),
                    SizedBox(
                      height: 10,
                    ),
                    buildItems(controller.cart.value.items, context),
                  ],
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Obx(() => OrderSummaryCard(
                onValueChangeCallback: widget.onValueChangeCallback,
                deliveryCost: currency.format(40.00),
                orderCost: currency.format(controller.cart.value.totalCost()),
                totalCost: currency.format(controller.cart.value.totalCost()),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: Text(
                "${lang.strings['customer']['restaurant']['menu']['notes']}",
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
          TextFieldComponent(
            textController: textcontoller,
            hint: lang.strings["customer"]["restaurant"]["menu"]["notes"],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
