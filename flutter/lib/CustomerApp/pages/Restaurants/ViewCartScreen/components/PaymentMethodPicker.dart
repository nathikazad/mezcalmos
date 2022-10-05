import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/Controllers/ViewCartController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["PaymentMethodPicker"];

//
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
                  '${_i18n()["paymentMethod"]}',
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () {
                    return DropdownButtonFormField<PaymentOption>(
                      decoration: InputDecoration(
                        filled: true,
                        isDense: false,

                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 3),
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
                      value: widget.viewCartController.pickerChoice.value ??
                          widget.viewCartController.options.first,
                      onChanged: (PaymentOption? newValue) async {
                        if (newValue != null) {
                          mezDbgPrint(newValue);
                          await widget.viewCartController
                              .switchPicker(newValue);
                        }
                      },
                      items: widget.viewCartController.options
                          .map<DropdownMenuItem<PaymentOption>>(
                              (PaymentOption value) {
                        return DropdownMenuItem<PaymentOption>(
                            value: value,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 43,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: _getIcon(
                                        paymentType: value.entries.first.key,
                                        card: value.entries.first.value),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    (value.entries.first.key ==
                                            PickerChoice.SavedCard)
                                        ? value.entries.first.value!.brand.name
                                        : '${_i18n()[value.entries.first.key.toNormalString().toLowerCase()]}',
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
                    );
                  },
                ),
              ],
            ),
          );
        } else
          return SizedBox();
      },
    );
  }

  Widget _getIcon({required PickerChoice paymentType, CreditCard? card}) {
    switch (paymentType) {
      case PickerChoice.SavedCard:
        if (card != null) {
          return Icon(card.brand.toIcon());
        } else {
          return Icon(Icons.credit_card);
        }
      case PickerChoice.SavedCard:
        return Icon(Icons.credit_card);
      case PickerChoice.NewCard:
        return Icon(Icons.add_card);
      case PickerChoice.Cash:
        return Icon(Icons.payments);
      case PickerChoice.ApplePay:
        return Icon(Icons.apple);
      case PickerChoice.GooglePay:
        return Image.asset(
          aGpay,
          width: 14.w,
          height: 4.h,
        );
    }
  }
}
