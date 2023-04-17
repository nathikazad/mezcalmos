import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderPaymentMethod"];
//

class OrderPaymentMethod extends StatelessWidget {
  const OrderPaymentMethod(
      {super.key,
      required this.paymentType,
      required this.stripeOrderPaymentInfo,
      this.margin = const EdgeInsets.only(top: 15),
      this.titleStyle});
  final PaymentType paymentType;
  final StripeOrderPaymentInfo? stripeOrderPaymentInfo;
  final EdgeInsets? margin;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["paymentMethod"]}',
            style: titleStyle ?? context.txt.bodyLarge,
          ),
          const SizedBox(
            height: 4,
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    _getIcon() ?? Icons.payments,
                    color: Colors.black,
                    size: 13.mezSp,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  if (stripeOrderPaymentInfo != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${stripeOrderPaymentInfo?.brand!.toName()}",
                        style: context.txt.bodyLarge,
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _getTitle(),
                      style: (stripeOrderPaymentInfo != null)
                          ? context.txt.bodyLarge
                          : context.txt.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getTitle() {
    if (stripeOrderPaymentInfo != null) {
      return "*" * 12 + "${stripeOrderPaymentInfo!.last4}";
    } else {
      return '${_i18n()[paymentType.toNormalString().toLowerCase()]}';
    }
  }

  IconData? _getIcon() {
    if (stripeOrderPaymentInfo != null) {
      return stripeOrderPaymentInfo?.brand?.toIcon();
    } else if (paymentType == PaymentType.BankTransfer) {
      return Icons.account_balance;
    } else {
      return Icons.payments;
    }
  }
}
