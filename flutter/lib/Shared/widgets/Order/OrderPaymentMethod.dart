import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
      this.margin});
  final PaymentType paymentType;
  final StripeOrderPaymentInfo? stripeOrderPaymentInfo;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["paymentMethod"]}',
            style: Get.textTheme.bodyText1,
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
                    size: 13.sp,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  if (stripeOrderPaymentInfo != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${stripeOrderPaymentInfo?.brand!.toName()}",
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _getTitle(),
                      style: (stripeOrderPaymentInfo != null)
                          ? Get.textTheme.bodyText1
                          : Get.textTheme.bodyText1,
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
