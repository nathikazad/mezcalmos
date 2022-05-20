import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderStatusCard'];

class LaundryOrderStatusCard extends StatelessWidget {
  const LaundryOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getOrderWidget(order.status),
                Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getOrderStatus(order.status),
                        style: txt.headline3,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (getEstimatedText() != null)
                        Text(
                          getEstimatedText()!,
                          style: txt.headline3,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                // const Spacer(),
                // messageButton(context),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(
            getOrderHelperText(order.status),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  String? getEstimatedText() {
    switch (order.status) {
      case LaundryOrderStatus.OtwPickupFromCustomer:
        if (order.estimatedPickupFromCustomerTime != null) {
          return getEstimatedTime(order.estimatedPickupFromCustomerTime!);
        }

        break;
      case LaundryOrderStatus.PickedUpFromCustomer:
        if (order.estimatedDropoffAtServiceProviderTime != null) {
          return getEstimatedTime(order.estimatedDropoffAtServiceProviderTime!);
        }
        break;
      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedLaundryReadyTime != null) {
          return getEstimatedTime(order.estimatedLaundryReadyTime!);
        }

        break;
      case LaundryOrderStatus.OtwPickupFromLaundry:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return getEstimatedTime(
              order.estimatedPickupFromServiceProviderTime!);
        }

        break;
      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return getEstimatedTime(order.estimatedDropoffAtCustomerTime!);
        }

        break;
      default:
        return null;
    }
    return null;
  }

  Widget messageButton(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColorLight,
      shape: CircleBorder(),
      child: InkWell(
        onTap: () {
          Get.toNamed<void>(getMessagesRoute(
              orderId: order.orderId,
              chatId: order.orderId,
              recipientType: ParticipantType.DeliveryAdmin));
        },
        customBorder: CircleBorder(),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12),
              child: Icon(
                Icons.textsms,
                color: Colors.white,
              ),
            ),
            Obx(
              () => Get.find<OrderController>()
                      .orderHaveNewMessageNotifications(order.orderId)
                  ? Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xfff6efff), width: 2),
                            color: const Color(0xffff0000)),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

Widget getOrderWidget(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByCustomer:
    case LaundryOrderStatus.CancelledByAdmin:
      return Container(
        padding: const EdgeInsets.all(5),
        decoration:
            BoxDecoration(color: Color(0xFFF9D8D6), shape: BoxShape.circle),
        child: Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.OrderReceieved:
    case LaundryOrderStatus.AtLaundry:
      return Container(
        child: Icon(
          Icons.local_laundry_service,
          size: 40,
          color: customerAppColor,
        ),
      );
    case LaundryOrderStatus.OtwPickupFromCustomer:
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return Container(
        child: Icon(
          Icons.delivery_dining,
          size: 40,
          color: customerAppColor,
        ),
      );
    case LaundryOrderStatus.PickedUpFromCustomer:
    case LaundryOrderStatus.Delivered:
      return Container(
        padding: const EdgeInsets.all(5),
        decoration:
            BoxDecoration(color: lightCustomerAppColor, shape: BoxShape.circle),
        child: Icon(
          Icons.check,
          size: 25,
          color: customerAppColor,
        ),
      );

    case LaundryOrderStatus.ReadyForDelivery:
      return Container(
        // padding: const EdgeInsets.only(right: 7.0),
        child: Icon(
          Icons.dry_cleaning_rounded,
          size: 40,
          color: customerAppColor,
        ),
      );
  }
}

String getOrderStatus(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
    case LaundryOrderStatus.CancelledByCustomer:
      return _i18n()['canceled'];

    case LaundryOrderStatus.OrderReceieved:
      return _i18n()['orderReceived'];
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return _i18n()['otwPickUp'];
    case LaundryOrderStatus.PickedUpFromCustomer:
      return _i18n()['pickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return _i18n()['atLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return _i18n()['readyForDelivery'];
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return _i18n()['otwDelivery'];
    case LaundryOrderStatus.Delivered:
      return _i18n()['delivered'];
    default:
      return 'Unknown Status';
  }
}

String getOrderHelperText(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return _i18n()['cancelByAdmin'];

    case LaundryOrderStatus.CancelledByCustomer:
      return _i18n()['cancelByUser'];

    case LaundryOrderStatus.OrderReceieved:
      return _i18n()['received'];
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return _i18n()['orderHelperOtwPickup'];
    case LaundryOrderStatus.PickedUpFromCustomer:
      return _i18n()['orderHelperPickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return _i18n()['orderHelperAtLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return _i18n()['orderHelperReady'];
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return _i18n()['orderHelperOtwDelivery'];
    case LaundryOrderStatus.Delivered:
      return _i18n()['orderHelperDelivered'];
    default:
      return 'Unknown Status';
  }
}
