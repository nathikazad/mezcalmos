import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderStatusCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

import '../../../router.dart';

class RestaurantPastOrderCard extends StatelessWidget {
  RestaurantPastOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  Order order;

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(getRestaurantOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              mLoadImage(url: order.serviceProvider?.image)
                                  .image),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.green.shade400,
                              child: Icon(
                                Icons.food_bank,
                                size: 20,
                                // size: 18.sp,
                                color: Colors.white,
                              )))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceProvider!.name,
                          overflow: TextOverflow.ellipsis,
                          style: txt.headline3,
                          maxLines: 2,
                        ),
                        Text(
                          order.to.address,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: txt.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  !order.isCanceled()
                      ? Icon(
                          Ionicons.bag_check,
                          color: Colors.green,
                          size: 40,
                        )
                      : Icon(
                          Ionicons.bag_remove,
                          color: Colors.red,
                          size: 40,
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
                      " ${i18n.strings["customer"]["restaurant"]["cart"]["totalCost"]} : \$${order.cost.toStringAsFixed(0)}  ",
                    ),
                    (MediaQuery.of(context).size.width > 320)
                        ? Flexible(
                            child: Text(
                              getOrderStatus(
                                      (order as RestaurantOrder).status) +
                                  DateFormat(': hh:mm a')
                                      .format(order.orderTime.toLocal()),
                              style: txt.bodyText1!.copyWith(fontSize: 11.sp),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          )
                        : Text(
                            getOrderStatus((order as RestaurantOrder).status),
                            style: txt.bodyText1,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
