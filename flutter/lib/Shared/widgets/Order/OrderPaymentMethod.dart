import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StripeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderPaymentMethod"];
//

class OrderPaymentMethod extends StatelessWidget {
  const OrderPaymentMethod({super.key, required this.order, this.margin});
  final Order order;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["paymentMethod"]}',
            style: Get.textTheme.bodyText1,
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
                    order.stripePaymentInfo?.brand?.toIcon() ?? Icons.payments,
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
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _getTitle(),
                      style: (order.stripePaymentInfo != null)
                          ? Get.textTheme.bodyText2
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
    if (order.stripePaymentInfo != null) {
      return "*" * 12 + "${order.stripePaymentInfo!.last4}";
    } else {
      return '${_i18n()["cash"]}';
    }
  }
}
