import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Laundry"]
        ["LaundryCurrentOrderView"]["Components"]["CustomerLaundryOrderEst"];

class CustomerLaundryOrderEst extends StatelessWidget {
  const CustomerLaundryOrderEst({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getEstimatedText() != null) {
      return Card(
        margin: const EdgeInsets.only(top: 15),
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
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                              radius: 23,
                              child: Icon(
                                _getIcon(),
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
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
      case cModels.LaundryOrderStatus.OrderReceived:

      case cModels.LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return "${order.estimatedPickupFromCustomerTime!.getEstimatedTime()}";
        }
        break;

      case cModels.LaundryOrderStatus.AtLaundry:
        if (order.estimatedPackageReadyTime != null) {
          return "${order.estimatedPackageReadyTime!.getEstimatedTime()}";
        }

        break;
      case cModels.LaundryOrderStatus.OtwPickupFromLaundry:
      case cModels.LaundryOrderStatus.ReadyForDelivery:

      case cModels.LaundryOrderStatus.PickedUpFromLaundry:
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
      case cModels.LaundryOrderStatus.OrderReceived:

      case cModels.LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return "${_i18n()["pickup"]}";
        }
        break;
      case cModels.LaundryOrderStatus.PickedUpFromCustomer:

      case cModels.LaundryOrderStatus.AtLaundry:
        if (order.estimatedPackageReadyTime != null) {
          return "${_i18n()["laundryReady"]}";
        }

        break;
      case cModels.LaundryOrderStatus.OtwPickupFromLaundry:
      case cModels.LaundryOrderStatus.ReadyForDelivery:

      case cModels.LaundryOrderStatus.PickedUpFromLaundry:
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
      case cModels.LaundryOrderStatus.OrderReceived:

      case cModels.LaundryOrderStatus.OtwPickupFromCustomer:
        return Icons.route;

      case cModels.LaundryOrderStatus.PickedUpFromCustomer:
      case cModels.LaundryOrderStatus.AtLaundry:
        return Icons.local_laundry_service;

      case cModels.LaundryOrderStatus.OtwPickupFromLaundry:
      case cModels.LaundryOrderStatus.PickedUpFromLaundry:
        return Icons.delivery_dining;

      default:
        return Icons.local_laundry_service;
    }
  }
}
