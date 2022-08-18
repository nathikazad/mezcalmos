import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderSummaryCard"];

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["orderSummary"]}',
              style: txt.bodyText1,
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
                        style: txt.bodyText2,
                      ),
                      Text('\$' + (order.itemsCost).toString(),
                          style: txt.bodyText2),
                    ],
                  ),
                ),
                if (order.stripePaymentInfo != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
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
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_i18n()["deliveryCost"]}',
                        style: txt.bodyText2,
                      ),
                      Flexible(
                          child: ShippingCostComponent(
                        shippingCost: order.shippingCost,
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
                          'Refund amount',
                          style: txt.bodyText2,
                        ),
                        Text(
                          order.refundAmount!.toPriceString(),
                          style: txt.bodyText2,
                        ),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${_i18n()["totalCost"]}',
                      style: txt.bodyText1,
                    ),
                    Text(
                      order.costToCustomer?.toPriceString() ??
                          order.cost.toPriceString(),
                      style: txt.bodyText1!.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Divider()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            alignment: Alignment.centerLeft,
            child: Text(
              '${_i18n()["deliveryLocation"]}',
              style: txt.bodyText1,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.place,
                  size: 18,
                  color: primaryBlueColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    order.to.address,
                    style: Get.textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
