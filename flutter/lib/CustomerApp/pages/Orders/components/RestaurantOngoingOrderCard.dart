import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderStatusCard.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

class RestaurantOngoingOrderCard extends StatelessWidget {
  const RestaurantOngoingOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    dynamic _i18n() =>
        Get.find<LanguageController>().strings["CustomerApp"]
            ["pages"]["ListOrdersScreen"]["components"]
        ["RestaurantOngoingOrderCard"];
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          switch (order.orderType) {
            case OrderType.Restaurant:
              Get.toNamed(getRestaurantOrderRoute(order.orderId));
              break;
            case OrderType.Taxi:
              Get.toNamed(getTaxiOrderRoute(order.orderId));
              break;
            default:
          }
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
                          backgroundImage: mLoadImage(
                                  assetInCaseFailed:
                                      'assets/images/customer/DeliveryAdmin/restaurant.png',
                                  url: order.serviceProvider?.image)
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
                  SizedBox(width: 10),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceProvider?.name ?? "Unavailable",
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
                  OrderStatusImage((order as RestaurantOrder).status),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${_i18n()["totalCost"]} : \$${order.cost.toStringAsFixed(0)} ",
                    ),
                    Spacer(),
                    Icon(
                      Ionicons.time_outline,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      getOrderStatus((order as RestaurantOrder).status),
                      style: txt.bodyText2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                    )
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
