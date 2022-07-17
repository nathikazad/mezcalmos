import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:sizer/sizer.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
//     ['OrderView']['Components']['ROpOrderSummaryCard'];

class ROpOrderSummaryCard extends StatelessWidget {
  final RestaurantOrder order;
  const ROpOrderSummaryCard({Key? key, required this.order}) : super(key: key);

  // TODO FIX LANG

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Order summary',
              style: Get.textTheme.bodyText1,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Order Cost',
                      style: Get.textTheme.bodyText2,
                    ),
                    Text((order.itemsCost).toPriceString(),
                        style: Get.textTheme.bodyText2),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Delivery cost',
                      style: Get.textTheme.bodyText2,
                    ),
                    Flexible(
                        child: ShippingCostComponent(
                      shippingCost: order.shippingCost,
                    ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total cost',
                      style: Get.textTheme.bodyText1,
                    ),
                    Text(
                      (order.itemsCost + order.shippingCost).toPriceString(),
                      style: Get.textTheme.bodyText1!.copyWith(fontSize: 14.sp),
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
              'Delivery location',
              style: Get.textTheme.bodyText1,
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
                    order.restaurant.location.address,
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
