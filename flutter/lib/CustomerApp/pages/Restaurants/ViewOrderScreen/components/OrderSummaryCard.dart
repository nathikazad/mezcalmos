import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Order summary',
              style: txt.headline3,
            ),
            Divider(
              thickness: 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order cost',
                  style: txt.bodyText2,
                ),
                Text(
                  order.cost.toStringAsFixed(2) + "\$",
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery cost',
                  style: txt.bodyText2,
                ),
                Text(
                  4.toStringAsFixed(2) + "\$",
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totale cost',
                  style: txt.bodyText1,
                ),
                Text(
                  (order.cost + 4).toStringAsFixed(2) + "\$",
                  style: txt.bodyText1,
                ),
              ],
            ),
            Divider(
              thickness: 0.2,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Delivery location',
                style: txt.bodyText1,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
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
        ),
      ),
    );
  }
}
