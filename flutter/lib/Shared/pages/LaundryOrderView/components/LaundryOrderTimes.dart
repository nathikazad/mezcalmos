import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundryCurrentOrderView"]["Components"]["CustomerLaundryOrderEst"];
//

class LaundryOrderTimes extends StatelessWidget {
  const LaundryOrderTimes({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getEstimatedText() != null) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: secondaryLightBlueColor,
                      child: Icon(Icons.watch_later_rounded,
                          color: primaryBlueColor),
                    ),
                    Positioned(
                      right: -35,
                      child: CircleAvatar(
                        radius: 23,
                        child: Icon(
                          _getIcon(),
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 45,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getRightTitle()!.inCaps,
                          style: context.txt.bodyLarge,
                          maxLines: 1,
                        ),
                        Text(
                          _getEstimatedText()!.inCaps,
                          style: context.txt.bodyMedium,
                          maxLines: 1,
                        ),
                      ],
                    ))
              ],
            )),
      );
    } else
      return SizedBox();
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceived:

      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return "${order.estimatedPickupFromCustomerTime!.getEstimatedTime()}";
        }
        break;
      case LaundryOrderStatus.PickedUpFromCustomer:

      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedPackageReadyTime != null) {
          return "${order.estimatedPackageReadyTime!.getEstimatedTime()}";
        }

        break;
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.ReadyForDelivery:

      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedArrivalAtDropoff != null) {
          return "${order.estimatedArrivalAtDropoff!.getEstimatedTime()}";
        }

        break;
      default:
        return null;
    }
    return null;
  }

  String? _getRightTitle() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceived:

      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return "${_i18n()["pickup"]}";
        }
        break;
      case LaundryOrderStatus.PickedUpFromCustomer:

      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedPackageReadyTime != null) {
          return "${_i18n()["laundryReady"]}";
        }

        break;
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.ReadyForDelivery:

      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedArrivalAtDropoff != null) {
          return "${_i18n()["delivery"]}";
        }

        break;
      default:
        return null;
    }
    return null;
  }

  IconData _getIcon() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceived:

      case LaundryOrderStatus.OtwPickupFromCustomer:
        return Icons.route;

      case LaundryOrderStatus.PickedUpFromCustomer:
      case LaundryOrderStatus.AtLaundry:
        return Icons.local_laundry_service;

      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
        return Icons.delivery_dining;

      default:
        return Icons.local_laundry_service;
    }
  }
}
