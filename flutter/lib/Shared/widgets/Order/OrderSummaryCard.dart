import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
    this.margin,
  }) : super(key: key);
  final Order order;

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["orderCost"]}',
                        style: txt.bodyMedium,
                      ),
                      Text(_getOrderCost(),
                          style: txt.bodyMedium?.copyWith(
                              fontStyle:
                                  (order.orderType == OrderType.Laundry &&
                                          (order as LaundryOrder)
                                                  .costsByType
                                                  ?.weighedCost ==
                                              null)
                                      ? FontStyle.italic
                                      : null)),
                    ],
                  ),
                ),
                if (order.stripePaymentInfo != null &&
                    order.stripePaymentInfo!.chargeFeesOnCustomer == true)
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["stripeFees"]}',
                          style: txt.bodyMedium,
                        ),
                        Text(
                            order.stripePaymentInfo!.stripeFees.toPriceString(),
                            style: txt.bodyMedium),
                      ],
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["deliveryCost"]}',
                        style: txt.bodyMedium,
                      ),
                      Flexible(
                          child: ShippingCostComponent(
                        shippingCost: _getShippingCost(),
                      ))
                    ],
                  ),
                ),
                if (order.refundAmount != null && order.refundAmount! > 0)
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
                          "-" + order.refundAmount!.toPriceString(),
                          style: txt.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${_i18n()["totalCost"]}',
                          style: txt.headlineMedium),
                      Text(order.totalCost?.toPriceString() ?? "_",
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

  num _getShippingCost() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return (order as RestaurantOrder).shippingCost;
      case OrderType.Laundry:
        return (order as LaundryOrder).shippingCost;

      default:
        return 0;
    }
  }

  String _getOrderCost() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return (order as RestaurantOrder).itemsCost.toPriceString();
      case OrderType.Laundry:
        return ((order as LaundryOrder).cost).toPriceString();

      default:
        return "-";
    }
  }
}
