import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderPaymentMethod"];

class CustBusinessPaymentMethods extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Map<PaymentType, bool> paymentsMethods;
  final double titleBodyGap;
  final double elementsGap;
  final TextStyle? titleStyle;
  const CustBusinessPaymentMethods(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.paymentsMethods,
      this.titleStyle,
      this.titleBodyGap = 10,
      this.elementsGap = 6});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["paymentMethod"]}',
            style: titleStyle ?? context.txt.bodyLarge,
          ),
          SizedBox(
            height: titleBodyGap,
          ),
          for (PaymentType type in paymentsMethods.keys)
            if (paymentsMethods[type] == true)
              Padding(
                padding: EdgeInsets.only(bottom: elementsGap),
                child: _builPaymentRow(type, context),
              ),
        ],
      ),
    );
  }

  Row _builPaymentRow(PaymentType type, BuildContext context) {
    late IconData icon;
    late String label;
    switch (type) {
      case PaymentType.BankTransfer:
        icon = Icons.account_balance;
        label = '${_i18n()["banktransfer"]}';
        break;
      case PaymentType.Card:
        icon = Icons.payment;
        label = '${_i18n()["creditCard"]}';
        break;
      default:
        icon = Icons.payments;
        label = '${_i18n()["cashOnDelivery"]}';
    }
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(
        icon,
        color: Color(0xFF494949),
      ),
      SizedBox(
        width: 12,
      ),
      Text(
        label,
        style: context.txt.bodyLarge?.copyWith(color: Color(0xFF494949)),
      )
    ]);
  }
}
