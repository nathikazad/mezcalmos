import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
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
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            '${_i18n()["totalCost"]}',
            style: txt.bodyText1,
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${_i18n()["deliveryCost"]}',
                      style: txt.bodyText1,
                    ),
                    Text('\$' + order.shippingCost.toString(),
                        style: txt.bodyText1!),
                  ],
                ),
                const Divider(thickness: 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${_i18n()["total"]}',
                      style: txt.bodyText1,
                    ),
                    Text(
                      '\$' + (order.cost).toStringAsFixed(0),
                      style: txt.bodyText1!.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            '${_i18n()["deliveryLocation"]}',
            style: txt.bodyText1,
          ),
        ),
        Card(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.place,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(width: 5.w),
                Flexible(
                  child: Text(
                    order.to.address,
                    style: txt.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
