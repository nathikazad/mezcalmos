import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezPaymentMethodPicker"];

class MezPaymentMethodPicker extends StatefulWidget {
  const MezPaymentMethodPicker({super.key, required this.paymentType});
  final PaymentType paymentType;

  @override
  State<MezPaymentMethodPicker> createState() => _MezPaymentMethodPickerState();
}

class _MezPaymentMethodPickerState extends State<MezPaymentMethodPicker> {
  PaymentType? _selectedPayemntType;
  @override
  void initState() {
    super.initState();

    _selectedPayemntType = widget.paymentType;
  }

  @override
  void didUpdateWidget(covariant MezPaymentMethodPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedPayemntType = widget.paymentType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_i18n()['paymentMethod']}",
            style: context.textTheme.bodyLarge,
          ),
          meduimSeperator,
          MezStringDropDown(
              labelText: "Payment Method",
              value: _selectedPayemntType!.toFirebaseFormatString(),
              icons: [
                Icons.payments,
                Icons.payment_rounded,
                Icons.account_balance
              ],
              langPath: _i18n(),
              items: [
                PaymentType.Cash,
                PaymentType.Card,
                PaymentType.BankTransfer
              ].map((PaymentType e) => e.toFirebaseFormatString()).toList(),
              onChanged: (String? v) {}),
        ],
      ),
    );
  }
}
