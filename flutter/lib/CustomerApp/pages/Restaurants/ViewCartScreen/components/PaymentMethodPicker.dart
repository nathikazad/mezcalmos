import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

class PaymentMethodPicker extends StatefulWidget {
  const PaymentMethodPicker({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPicker> createState() => _PaymentMethodPickerState();
}

class _PaymentMethodPickerState extends State<PaymentMethodPicker> {
  RestaurantController controller = Get.find<RestaurantController>();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (controller.associatedRestaurant!.paymentInfo.acceptCard) {
          return Obx(
            () => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<PaymentType>(
                    decoration: InputDecoration(
                      filled: true,
                      isDense: false,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none),
                      // label: Text("${_i18n()["none"]}"),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    value: controller.cart.value.paymentType,
                    onChanged: (PaymentType? newValue) {
                      if (newValue != null) {
                        controller.switchPaymentMedthod(newValue);
                      }
                    },
                    validator: (PaymentType? value) {
                      if (value == null) {
                        return "Please select a payment method";
                      } else {
                        return null;
                      }
                    },
                    items: [
                      PaymentType.Cash,
                      PaymentType.Card
                    ].map<DropdownMenuItem<PaymentType>>((PaymentType value) {
                      return DropdownMenuItem<PaymentType>(
                          value: value,
                          // enabled: (widget.oppositeLanguageValue != null &&
                          //     widget.oppositeLanguageValue!.value != value),
                          child: Text(value.toNormalString(),
                              style: Get.textTheme.bodyText2?.copyWith(
                                fontWeight: FontWeight.w700,
                              )));
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        } else
          return SizedBox();
      },
    );
  }
}
