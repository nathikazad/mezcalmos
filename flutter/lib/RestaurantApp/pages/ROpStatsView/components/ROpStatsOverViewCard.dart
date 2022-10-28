import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpStatsView/controllers/ROpStatsViewController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';

class ROpStatsOverViewCard extends StatelessWidget {
  const ROpStatsOverViewCard(
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
                children: [
                  if (viewController.getDayOrders(date.toLocal()) != null)
                    Text(
                        "${(viewController.getDayOrders(date.toLocal()))?.length}. Orders"),
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
