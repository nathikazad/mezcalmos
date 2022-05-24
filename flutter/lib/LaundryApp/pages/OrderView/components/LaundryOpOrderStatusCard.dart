import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpOrderStatusCard']['status'];

class LaundryOpOrderStatusCard extends StatelessWidget {
  const LaundryOpOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                order.getOrderWidget(),
                Spacer(
                  flex: 2,
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: Column(
                    children: [
                      Text(
                        order.orderStatusTitle(),
                        style: txt.headline3,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (_getEstimatedText() != null)
                        Text(
                          _getEstimatedText()!,
                        )
                    ],
                  ),
                ),
                Spacer(),
                // messageButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return order.estimatedPickupFromCustomerTime!.getEstimatedTime();
        }

        break;
      case LaundryOrderStatus.PickedUpFromCustomer:
        if (order.estimatedDropoffAtServiceProviderTime != null) {
          return order.estimatedDropoffAtServiceProviderTime!
              .getEstimatedTime();
        }
        break;
      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedLaundryReadyTime != null) {
          return order.estimatedLaundryReadyTime!.getEstimatedTime();
        }

        break;
      case LaundryOrderStatus.OtwPickupFromLaundry:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return order.estimatedPickupFromServiceProviderTime!
              .getEstimatedTime();
        }

        break;
      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return order.estimatedDropoffAtCustomerTime!.getEstimatedTime();
        }

        break;
      default:
        return null;
    }
    return null;
  }
}
