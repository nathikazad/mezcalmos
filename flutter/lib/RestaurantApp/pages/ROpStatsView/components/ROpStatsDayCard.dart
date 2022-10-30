import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/controllers/ROpStatsViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

class ROpStatsDayCard extends StatelessWidget {
  const ROpStatsDayCard(
      {super.key, required this.viewController, required this.date});
  final ROpStatsViewController viewController;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (viewController.getDayOrders(date.toLocal()) != null)
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${(viewController.getDayOrders(date.toLocal()))?.length} Orders",
                            style: Get.textTheme.bodyText1,
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: primaryBlueColor,
                                size: 12.sp,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "${(viewController.getDayOrders(date.toLocal()))?.where((RestaurantOrder element) {
                                return element.status ==
                                    RestaurantOrderStatus.Delivered;
                              }).length} Delivered Orders"),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.cancel,
                                color: offRedColor,
                                size: 12.sp,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "${(viewController.getDayOrders(date.toLocal()))?.where((RestaurantOrder element) {
                                return element.status ==
                                        RestaurantOrderStatus
                                            .CancelledByCustomer ||
                                    element.status ==
                                        RestaurantOrderStatus.CancelledByAdmin;
                              }).length} Cancelled Orders"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (viewController.getDayCost(date.toLocal()) != null)
                    Text(
                      "${viewController.getDayCost(date.toLocal())?.toPriceString()}",
                      style: Get.textTheme.headline3,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
