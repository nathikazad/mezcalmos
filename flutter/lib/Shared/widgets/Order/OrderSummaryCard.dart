import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  OrderSummaryCard(
      {Key? key, required this.order, this.margin, this.isWebVersion})
      : super(key: key);
  final Order order;
  bool? isWebVersion = false;

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
              style: txt.bodyText1!
                  .copyWith(fontSize: (isWebVersion = true) ? 16 : null),
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
                        style: txt.bodyText2!.copyWith(
                            fontSize: (isWebVersion == true) ? 14 : null,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(_getOrderCost(),
                          style: txt.bodyText2?.copyWith(
                              fontSize: (isWebVersion == true) ? 14 : null,
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
                          style: txt.bodyText2!.copyWith(
                              fontSize: (isWebVersion == true) ? 14 : null),
                        ),
                        Text(
                            order.stripePaymentInfo!.stripeFees.toPriceString(),
                            style: txt.bodyText2!.copyWith(
                                fontSize: (isWebVersion == true) ? 14 : null)),
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
                        style: txt.bodyText2!.copyWith(
                            fontSize: (isWebVersion == true) ? 14 : null),
                      ),
                      Flexible(
                          child: ShippingCostComponent(
                        textStyle: isWebVersion == true
                            ? GoogleFonts.montserrat(fontSize: 14)
                            : null,
                        isWebVersion: isWebVersion,
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
                          style: txt.bodyText2!.copyWith(
                              fontSize: (isWebVersion == true) ? 14 : null),
                        ),
                        Text(
                          order.refundAmount!.toPriceString(),
                          style: txt.bodyText2!.copyWith(
                              fontSize: (isWebVersion == true) ? 14 : null),
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${_i18n()["totalCost"]}',
                      style: txt.bodyText1!
                          .copyWith(fontSize: isWebVersion == true ? 16 : null),
                    ),
                    Text(
                      order.totalCost?.toPriceString() ??
                          order.cost.toPriceString(),
                      style: txt.bodyText1!.copyWith(
                          fontSize: isWebVersion == true ? 16 : 14.sp),
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
