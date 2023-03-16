import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/StripeHelper.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    this.margin,
    this.newRow,
    required this.shippingCost,
    required this.orderCost,
    required this.totalCost,
    required this.refundAmmount,
    this.divideDeliveryCost = false,
    this.showNullValues = true,
    required this.stripeOrderPaymentInfo,
  }) : super(key: key);
  // final Order order;
  final num? shippingCost;
  final num? orderCost;
  final num? totalCost;
  final num? refundAmmount;
  final Widget? newRow;
  final bool showNullValues;
  final bool divideDeliveryCost;
  final StripeOrderPaymentInfo? stripeOrderPaymentInfo;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 8),
            //  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (showNullValues || orderCost != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["orderCost"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(
                            (orderCost == 0)
                                ? "-"
                                : orderCost?.toPriceString() ?? "-",
                            style: txt.bodyMedium?.copyWith()),
                      ],
                    ),
                  ),
                if (stripeOrderPaymentInfo != null &&
                    stripeOrderPaymentInfo!.chargeFeesOnCustomer == true)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["stripeFees"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(stripeOrderPaymentInfo!.stripeFees.toPriceString(),
                            style: txt.bodyMedium),
                      ],
                    ),
                  ),
                if (showNullValues || shippingCost != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["deliveryCost"]}',
                          style: txt.bodyMedium,
                        ),
                        ShippingCostComponent(
                          shippingCost: shippingCost!,
                          formattedShippingCost: (divideDeliveryCost)
                              ? "${(shippingCost! / 2).toPriceString()} x 2 "
                              : null,
                        )
                      ],
                    ),
                  ),
                if (refundAmmount != null && refundAmmount! > 0)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["refundAmount"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(
                          "-" + refundAmmount!.toPriceString(),
                          style: txt.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                newRow ?? SizedBox(),
                if (showNullValues || totalCost != null)
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${_i18n()["totalCost"]}',
                            style: txt.headlineMedium),
                        Text(
                            (orderCost == 0)
                                ? "-"
                                : totalCost?.toPriceString() ?? "-",
                            style: txt.headlineSmall),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
