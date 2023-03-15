import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["PaymentMethodPicker"];

//
class PaymentMethodPicker extends StatefulWidget {
  const PaymentMethodPicker({Key? key, required this.viewCartController})
      : super(key: key);
  final CustCartViewController viewCartController;

  @override
  State<PaymentMethodPicker> createState() => _PaymentMethodPickerState();
}

class _PaymentMethodPickerState extends State<PaymentMethodPicker> {
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
        if (widget.viewCartController.showPaymentPicker) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_i18n()["paymentMethod"]}',
                  style: context.txt.bodyText1,
                ),
                SizedBox(
                  height: 9,
                ),
                Obx(
                  () {
                    return Card(
                      child: DropdownButtonFormField<PaymentOption>(
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
                                    width: 30,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: _getIcon(
                                        paymentType: value.entries.first.key,
                                        card: value.entries.first.value,
                                        iconColor: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  // Text(
                                  //   (value.entries.first.key ==
                                  //           PickerChoice.SavedCard)
                                  //       ? value.entries.first.value!.brand.name
                                  //       : '${_i18n()[value.entries.first.key.toNormalString().toLowerCase()]}',
                                  //   style: context.txt.bodyText1?.copyWith(
                                  //     fontSize: 12.sp,
                                  //   ),
                                  // ),
                                  if (value.entries.first.value != null)
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "*" * 12 +
                                            value.entries.first.value!.last4
                                                .toString(),
                                        style: context.txt.subtitle1,
                                      ),
                                    ),
                                ],
                              ));
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        } else
          return SizedBox();
      },
    );
  }

  Widget _getIcon({
    required PickerChoice paymentType,
    CreditCard? card,
    required Color iconColor,
  }) {
    switch (paymentType) {
      // case PickerChoice.SavedCard:
      //   if (card != null) {
      //     return Icon(
      //       card.brand.toIcon(),
      //       color: iconColor,
      //     );
      //   } else {
      //     return Icon(
      //       Icons.credit_card,
      //       color: iconColor,
      //       size: 14.sp,
      //     );
      //   }
      // case PickerChoice.SavedCard:
      //   return Icon(
      //     Icons.credit_card,
      //     color: iconColor,
      //     size: 14.sp,
      //   );
      // case PickerChoice.NewCard:
      //   return Icon(
      //     Icons.add_card,
      //     color: iconColor,
      //     size: 14.sp,
      //   );
      case PickerChoice.Cash:
        return Icon(
          Icons.payments,
          color: iconColor,
          size: 14.sp,
        );
      // case PickerChoice.BankTransfer:
      //   return Icon(
      //     Icons.account_balance,
      //     color: iconColor,
      //     size: 14.sp,
      //   );
      // case PickerChoice.ApplePay:
      //   return Icon(
      //     Icons.apple,
      //     color: iconColor,
      //     size: 14.sp,
      //   );
      // case PickerChoice.GooglePay:
      //   return Image.asset(
      //     aGpay,
      //     width: 14.w,
      //     height: 4.h,
      //     color: iconColor,
      //   );
    }
  }
}
