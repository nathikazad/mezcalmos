import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildCart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/PaymentMethodPicker.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["components"]["ViewCartBody"];

class ViewCartBody extends StatefulWidget {
  final void Function({Location? location})? setLocationCallBack;
  final TextEditingController notesTextController;
  final ViewCartController viewCartController;
  const ViewCartBody({
    required this.notesTextController,
    required this.viewCartController,
    Key? key,
    this.setLocationCallBack,
  }) : super(key: key);

  @override
  _ViewCartBodyState createState() => _ViewCartBodyState();
}

class _ViewCartBodyState extends State<ViewCartBody> {
  RestaurantController controller = Get.find<RestaurantController>();
  FocusNode _noteFocus = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    widget.viewCartController.init();

    super.initState();
  }

  @override
  void dispose() {
    _noteFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: DeliveryTimePicker(
                        viewCartController: widget.viewCartController),
                  ),

                  //=======================Delivery location :===========
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${_i18n()["deliveryLocation"]} :",
                      style: Get.textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropDownLocationList(
                    onValueChangeCallback: widget.setLocationCallBack,
                    bgColor: Colors.white,
                    checkDistance: true,
                    serviceProviderLocation:
                        controller.cart.value.restaurant?.info.location,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: PaymentMethodPicker(
                      viewCartController: widget.viewCartController,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("${_i18n()['notesTitle']}",
                        style: Get.textTheme.bodyText1),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom +
                                20.h),
                        style: Get.textTheme.bodyText2
                            ?.copyWith(fontWeight: FontWeight.w700),
                        controller: widget.notesTextController,
                        maxLines: 7,
                        minLines: 4,
                        decoration: InputDecoration(
                            hintText: "${_i18n()["notes"]}",
                            fillColor: Colors.white)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OrderSummaryCard(
                    setLocationCallBack: widget.setLocationCallBack,
                    controller: controller,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
