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
      margin: margin ?? const EdgeInsets.only(top: 9),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: txt.bodyText1?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  //margin: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["orderCost"]}',
                        style: txt.bodyText2,
                      ),
                      Text(_getOrderCost(),
                          style: txt.bodyText2?.copyWith(
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
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["stripeFees"]}',
                          style: txt.bodyText2,
                        ),
                        Text(
                            order.stripePaymentInfo!.stripeFees.toPriceString(),
                            style: txt.bodyText2),
                      ],
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["deliveryCost"]}',
                        style: txt.bodyText2,
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
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_i18n()["refundAmount"]}',
                          style: txt.bodyText2,
                        ),
                        Text(
                          "-" + order.refundAmount!.toPriceString(),
                          style: txt.bodyText2,
                        ),
                      ],
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["totalCost"]}',
                        style: txt.bodyText1?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        order.totalCost?.toPriceString() ?? "_",
                        style: txt.bodyText1!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
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
