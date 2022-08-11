import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';

class PaymentMethodPicker extends StatefulWidget {
  const PaymentMethodPicker({Key? key, required this.viewCartController})
      : super(key: key);
  final ViewCartController viewCartController;

  @override
  State<PaymentMethodPicker> createState() => _PaymentMethodPickerState();
}

class _PaymentMethodPickerState extends State<PaymentMethodPicker> {
  RestaurantController controller = Get.find<RestaurantController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (controller.associatedRestaurant!.paymentInfo.acceptCard) {
          return Container(
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
                Obx(
                  () => DropdownButtonFormField<PaymentOption>(
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
                    value: widget.viewCartController.pickerChoice.value,
                    onChanged: (PaymentOption? newValue) async {
                      if (newValue != null) {
                        widget.viewCartController.switchPicker(newValue);
                        mezDbgPrint(
                            "Inside cart controller ========>${controller.cart.value.paymentType}");
                      }
                    },
                    validator: (PaymentOption? value) {
                      if (value == null) {
                        return "Please select a payment method";
                      } else {
                        return null;
                      }
                    },
                    items: widget.viewCartController.options
                        .map<DropdownMenuItem<PaymentOption>>(
                            (PaymentOption value) {
                      return DropdownMenuItem<PaymentOption>(
                          value: value,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                _getIcon(
                                    paymentType: value.entries.first.key,
                                    card: value.entries.first.value),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                  (value.entries.first.key ==
                                          PickerChoice.SavedCard)
                                      ? value.entries.first.value!.brand.name
                                      : value.entries.first.key
                                          .toNormalString(),
                                  style: Get.textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  )),
                              if (value.entries.first.value != null)
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                      "•" * 12 +
                                          value.entries.first.value!.last4
                                              .toString(),
                                      style: Get.textTheme.bodyText2),
                                ),
                            ],
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        } else
          return SizedBox();
      },
    );
  }

  IconData _getIcon({required PickerChoice paymentType, CreditCard? card}) {
    switch (paymentType) {
      case PickerChoice.SavedCard:
        if (card != null) {
          return card.brand.toIcon();
        } else {
          return Icons.credit_card;
        }
      case PickerChoice.SavedCard:
        return Icons.credit_card;
      case PickerChoice.NewCard:
        return Icons.add_card;
      case PickerChoice.Cash:
        return Icons.payments;
      case PickerChoice.ApplePay:
        return Icons.apple;
      case PickerChoice.GooglePay:
        return Ionicons.logo_google;
    }
  }
}
