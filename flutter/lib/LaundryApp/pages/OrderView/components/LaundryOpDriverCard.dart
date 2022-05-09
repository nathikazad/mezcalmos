import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOpOrderDriverCard extends StatelessWidget {
  const LaundryOpOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Driver : "),
          SizedBox(
            height: 5,
          ),
          Card(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (_isDriverExist())
                    ? Row(children: [
                        CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(_getDriver()!.image),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          _getDriver()!.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              _handleMessageRouting();
                            },
                            icon: Icon(Icons.sms_rounded))
                      ])
                    : Text(
                        "Still no driver assigned to this order",
                        style: Get.textTheme.bodyText1,
                      )),
          ),
        ],
      ),
    );
  }

  bool _isDriverExist() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver != null;
    } else {
      return order.dropoffDriver != null;
    }
  }

  DeliveryDriverUserInfo? _getDriver() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver;
    } else {
      return order.dropoffDriver;
    }
  }

  void _handleMessageRouting() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      _laundryPickupDriverMessageRoute();
    } else {
      _laundryDropOffDriverMessageRoute();
    }
  }

  void _laundryDropOffDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

  void _laundryPickupDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order).pickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
