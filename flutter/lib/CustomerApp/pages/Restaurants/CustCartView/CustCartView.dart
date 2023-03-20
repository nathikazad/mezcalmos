// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/components/PaymentMethodPicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

class _ViewCartScreenState extends State<ViewCartScreen> {
  CustCartViewController viewController = CustCartViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomerAppBar(
        autoBack: true,
        title: "${_i18n()["myCart"]}",
      ),
      body: Obx(() {
        if (viewController.cart.cartItems.length > 0) {
          return SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (viewController.cart.quantity() >= 1)
                  CartItemsBuilder(
                    viewController: viewController,
                  ),
                DeliveryTimePicker(viewCartController: viewController),

                _deliveryLocation(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: PaymentMethodPicker(
                    viewCartController: viewController,
                  ),
                ),
                // SizedBox(
                //   height: 9,
                // ),
                Container(
                  //alignment: Alignment.centerLeft,
                  child: Text("${_i18n()['notesTitle']}",
                      style: Get.textTheme.bodyLarge),
                ),
                SizedBox(
                  height: 8,
                ),
                _notesComponent(context),
                SizedBox(
                  height: 20,
                ),
                CardSummaryCard(
                  controller: viewController,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          );
        } else {
          return CartIsEmptyScreen();
        }
      }),
      bottomSheet: _footerButton(),
    );
  }

  Widget _deliveryLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            "${_i18n()["deliveryLocation"]}",
            style: Get.textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 9),
        DropDownLocationList(
          onValueChangeCallback: ({MezLocation? location}) {
            if (location != null && location.isValidLocation()) {
              viewController.switchLocation(location);

              // ignore: unawaited_futures

              mezDbgPrint(
                  "Should update cart location 🥸🥸🥸 ===> ${viewController.cart.toLocation}");
            }
          },
          bgColor: Colors.white,
          checkDistance: true,
          serviceProviderLocation:
              viewController.cart.restaurant?.info.location,
        ),
      ],
    );
  }

  Widget _notesComponent(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          controller: viewController.noteText,
          maxLines: 7,
          minLines: 2,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom / 5,
            ),
            hintText: "${_i18n()["notes"]}",
            fillColor: Colors.white,
            hintStyle: Get.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }

  Widget _footerButton() {
    return Obx(
      () {
        mezDbgPrint("Can order from view =========>${viewController.canOrder}");
        if (viewController.cart.cartItems.length > 0) {
          return MezButton(
            label: (viewController.cart.restaurant?.isOpen() == false)
                ? '${_i18n()["scheduleOrder"]}'
                : '${_i18n()["orderNow"]}',
            enabled: viewController.canOrder,
            withGradient: true,
            borderRadius: 0,
            height: 50,
            onClick: !viewController.canOrder
                ? null
                : () async {
                    if (viewController.canOrder) {
                      await viewController.checkoutActionButton();
                    }
                  },
          );
        } else
          return SizedBox();
      },
    );
  }
}
