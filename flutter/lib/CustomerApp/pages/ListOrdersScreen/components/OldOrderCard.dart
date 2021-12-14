import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OldOrderCard extends StatelessWidget {
  OldOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  Order order;

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: Get.width,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        mLoadImage(url: order.serviceProvider?.image).image),
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width * 0.37,
                                child: Text(
                                  order.serviceProvider?.name ?? "Taxi Order",
                                  overflow: TextOverflow.ellipsis,
                                  style: txt.headline3,
                                ),
                              ),
                              Container(
                                width: Get.width * 0.37,
                                child: Text(
                                  order.to.address,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: txt.subtitle1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        // TODO : Handle taxi order ... dropedOff
                        !order.isCanceled()
                            ? Icon(
                                Ionicons.bag_check,
                                color: Colors.green,
                                size: 50,
                              )
                            : Icon(
                                Ionicons.bag_remove,
                                color: Colors.red,
                                size: 50,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} : ${order.cost} \$",
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
