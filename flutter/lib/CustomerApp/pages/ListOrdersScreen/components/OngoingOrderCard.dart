import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class OngoingOrderCard extends StatelessWidget {
  const OngoingOrderCard({
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
                        NetworkImage(order.serviceProvider!.image)),
                SizedBox(width: 5.w),
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.serviceProvider!.name,
                        style: txt.headline3,
                      ),
                      Text(
                        order.to.address,
                        style: txt.subtitle1,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(getRestaurantOrderRoute(order.orderId));
                    },
                    customBorder: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: Icon(
                        Icons.launch,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
