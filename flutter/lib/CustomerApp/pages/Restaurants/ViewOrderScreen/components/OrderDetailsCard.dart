import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:sizer/sizer.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                'Order details',
                style: txt.headline3,
              ),
            ),
            const Divider(thickness: 0.3),
            const SizedBox(height: 10),
            Text(
              'Order shipping adress : ',
              style: txt.bodyText1,
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(
                  Icons.place,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(width: 5.w),
                Text(
                  order.to.address,
                  style: txt.bodyText2,
                ),
              ],
            ),
            const Divider(thickness: 0.2),
            Text(
              'Order Date : ',
              style: txt.bodyText1,
            ),
            SizedBox(height: 10.h),
            Row(
              children: <Widget>[
                Icon(
                  Icons.watch_later,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(width: 5.w),
                Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(order.orderTime),
                  style: txt.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
