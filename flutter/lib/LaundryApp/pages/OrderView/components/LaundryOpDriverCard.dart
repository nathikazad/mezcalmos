import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage: CachedNetworkImageProvider(
                                    _getDriver()!.image)),
                            Positioned(
                              right: -30,
                              bottom: 3,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: primaryBlueColor,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.delivery_dining,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            _getDriver()!.name,
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        Spacer(),
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(getMessagesRoute(
                                      orderId: order.orderId,
                                      chatId: _getCorrectChatId(),
                                      recipientType:
                                          ParticipantType.DeliveryDriver));
                                },
                                icon: Icon(
                                  Icons.textsms_rounded,
                                  color: Theme.of(context).primaryColorLight,
                                )),
                            Obx(
                              () => Get.find<OrderController>()
                                      .hasNewMessageNotification(
                                          _getCorrectChatId())
                                  ? _newMessageRedDot(context)
                                  : Container(),
                            )
                          ],
                        ),
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

  String _getCorrectChatId() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.serviceProviderPickupDriverChatId!;
    } else {
      return order.serviceProviderDropOffDriverChatId!;
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
        chatId: order.serviceProviderDropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

  void _laundryPickupDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: order.serviceProviderPickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

  Widget _newMessageRedDot(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xfff6efff), width: 2),
            color: const Color(0xffff0000)),
      ),
    );
  }
}
