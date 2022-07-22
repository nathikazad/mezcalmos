import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/PaymentMethodPicker.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["ViewCartBody"];

class ViewCartBody extends StatefulWidget {
  final void Function({Location? location})? setLocationCallBack;
  final TextEditingController notesTextController;

  const ViewCartBody({
    required this.notesTextController,
    Key? key,
    this.setLocationCallBack,
  }) : super(key: key);

  @override
  _ViewCartBodyState createState() => _ViewCartBodyState();
}

class _ViewCartBodyState extends State<ViewCartBody> {
  RestaurantController controller = Get.find<RestaurantController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (controller.cart.value.quantity() >= 1)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      CartBuilder(),
                      SizedBox(height: 10),
                      CartItemsBuilder()
                    ],
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Obx(() => OrderSummaryCard(
                  setLocationCallBack: widget.setLocationCallBack,
                  deliveryCost: controller.cart.value.shippingCost ?? 50,
                  orderCost: controller.cart.value.itemsCost().toPriceString(),
                  totalCost: controller.cart.value.totalCost().toPriceString(),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: PaymentMethodPicker(),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              alignment: Alignment.centerLeft,
              child: Text("${_i18n()['notesTitle']}",
                  style: Get.textTheme.bodyText1),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: TextFormField(
                  style: Get.textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.w700),
                  controller: widget.notesTextController,
                  maxLines: 7,
                  minLines: 4,
                  decoration: InputDecoration(hintText: "${_i18n()["notes"]}")),
            ),
            // TextFieldComponent(
            //   textController: widget.notesTextController,
            //   hint: _i18n()["notes"],
            // ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
