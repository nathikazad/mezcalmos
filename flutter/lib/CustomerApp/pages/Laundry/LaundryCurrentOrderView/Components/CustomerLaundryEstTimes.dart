import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

//
dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundryCurrentOrderView"]["Components"]["CustomerLaundryOrderEst"];
//

class CustomerLaundryOrderEst extends StatelessWidget {
  const CustomerLaundryOrderEst({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getEstimatedText() != null) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_i18n()["estTimes"]}',
                  style: Get.textTheme.bodyText1
                      ?.copyWith(color: Colors.grey.shade800),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      child: Icon(_getIcon(), color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          _getEstimatedText()!,
                          style: Get.textTheme.bodyText1,
                          maxLines: 2,
                        ))
                  ],
                )
              ],
            )),
      );
    } else
      return SizedBox();
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:

      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return "${_i18n()["pickup"]}: ${order.estimatedPickupFromCustomerTime!.getEstimatedTime()}";
        }
        break;
      case LaundryOrderStatus.PickedUpFromCustomer:

      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedLaundryReadyTime != null) {
          return "${_i18n()["laundryReady"]}: ${order.estimatedLaundryReadyTime!.getEstimatedTime()}";
        }

        break;
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.ReadyForDelivery:

      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return "${_i18n()["delivery"]}: ${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
        }

        break;
      default:
        return null;
    }
    return null;
  }

  IconData _getIcon() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:

      case LaundryOrderStatus.OtwPickupFromCustomer:
        return Icons.delivery_dining;

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
