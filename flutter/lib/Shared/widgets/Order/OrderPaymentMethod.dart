import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderPaymentMethod"];
//

class OrderPaymentMethod extends StatelessWidget {
  OrderPaymentMethod(
      {super.key, required this.order, this.margin, this.isWebVersion});
  final Order order;
  final EdgeInsets? margin;

  bool? isWebVersion = false;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["paymentMethod"]}',
            style: txt.bodyText1!
                .copyWith(fontSize: (isWebVersion == true) ? 16 : null),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    _getIcon() ?? Icons.payments,
                    color: Color.fromRGBO(73, 73, 73, 1),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  if (order.stripePaymentInfo != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${order.stripePaymentInfo!.brand!.toName()}",
                        style: txt.bodyText1!.copyWith(
                            fontSize: (isWebVersion == true) ? 16 : null),
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _getTitle(),
                      style: (order.stripePaymentInfo != null)
                          ? txt.bodyText2!.copyWith(
                              fontSize: (isWebVersion == true) ? 14 : null)
                          : txt.bodyText1!.copyWith(
                              fontSize: (isWebVersion == true) ? 16 : null),
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
    if (order.stripePaymentInfo != null) {
      return "*" * 12 + "${order.stripePaymentInfo!.last4}";
    } else {
      return '${_i18n()[order.paymentType.toNormalString().toLowerCase()]}';
    }
  }

  IconData? _getIcon() {
    if (order.stripePaymentInfo != null) {
      return order.stripePaymentInfo?.brand?.toIcon();
    } else if (order.paymentType == PaymentType.BankTransfer) {
      return Icons.account_balance;
    } else {
      return Icons.payments;
    }
  }
}
