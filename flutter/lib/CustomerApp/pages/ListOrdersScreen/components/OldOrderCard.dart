import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OldOrderCard extends StatelessWidget {
  const OldOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        mLoadImage(url: order.serviceProvider?.image).image),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.serviceProvider?.name ?? "Taxi Order",
                      style: txt.headline3,
                    ),
                    Text(order.to.address,
                        style: txt.subtitle1,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
                Spacer(),
                // if not canceled , it means it was delivered!
                !order.isCanceled()
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      )
                    : Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 50,
                      ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total cost : ${order.cost} \$",
                  ),
                  Text(
                    "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
