import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

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
      margin: margin ?? const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: txt.bodyLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
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
                    margin: const EdgeInsets.only(bottom: 5),
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
                  margin: const EdgeInsets.only(bottom: 10),
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
                    margin: const EdgeInsets.only(bottom: 10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${_i18n()["totalCost"]}',
                      style: txt.bodyLarge,
                    ),
                    Text(
                      order.totalCost?.toPriceString() ?? "_",
                      style: txt.bodyLarge!.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
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
        return (order as LaundryOrder)
                .costsByType
                ?.weighedCost
                .toPriceString() ??
            '${_i18n()["toBeCalc"]}';

      default:
        return "-";
    }
  }
}
