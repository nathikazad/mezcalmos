// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/BuildItems.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/CartIsEmptyScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/DeliveryTimePicker.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/OrderSummaryCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/components/PaymentMethodPicker.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

class ViewCartScreen extends StatefulWidget {
  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewCartScreen"]["ViewCartScreen"];

class _ViewCartScreenState extends State<ViewCartScreen> {
  ViewCartController viewController = ViewCartController();

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
      resizeToAvoidBottomInset: true,
      appBar: CustomerAppBar(
        autoBack: true,
        title: "${_i18n()["myCart"]}",
      ),
      body: Obx(() {
        if (viewController.controller.cart.value.cartItems.length > 0) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (viewController.cart.quantity() >= 1) CartItemsBuilder(),
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
                            viewCartController: viewController),
                      ),
                      _deliveryLocation(),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: PaymentMethodPicker(
                          viewCartController: viewController,
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
                      _notesComponent(context),
                      SizedBox(
                        height: 15,
                      ),
                      OrderSummaryCard(
                        controller: viewController.controller,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
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
          alignment: Alignment.centerLeft,
          child: Text(
            "${_i18n()["deliveryLocation"]}",
            style: Get.textTheme.bodyText1,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 10),
        DropDownLocationList(
          onValueChangeCallback: ({Location? location}) {
            if (location != null && location.isValidLocation()) {
              viewController.controller.cart.value.toLocation = location;

              // ignore: unawaited_futures
              viewController.controller.updateShippingPrice().then(
                  (bool value) => viewController.controller.cart.refresh());
              mezDbgPrint(
                  "Should update cart location 🥸🥸🥸 ===> ${viewController.controller.cart.value.toLocation}");
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
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h),
        style: Get.textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w700),
        controller: viewController.noteText,
        maxLines: 7,
        minLines: 4,
        decoration: InputDecoration(
          hintText: "${_i18n()["notes"]}",
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _footerButton() {
    return Obx(
      () {
        if (viewController.controller.cart.value.cartItems.length > 0) {
          return MezButton(
            label: (viewController.controller.associatedRestaurant?.isOpen() ==
                    false)
                ? '${_i18n()["scheduleOrder"]}'
                : '${_i18n()["orderNow"]}',
            enabled: viewController.controller.canOrder &&
                !viewController.clickedCheckout.value,
            withGradient: true,
            borderRadius: 0,
            onClick: viewController.clickedCheckout.value
                ? null
                : () async {
                    mezDbgPrint(viewController.controller.cart.value.toLocation
                        ?.toFirebaseFormattedJson());
                    if (viewController.controller.canOrder &&
                        !viewController.clickedCheckout.value) {
                      await viewController.checkoutActionButton();
                    } else {
                      viewController.controller.cart.refresh();
                    }
                  },
          );
        } else
          return SizedBox();
      },
    );
  }
}
