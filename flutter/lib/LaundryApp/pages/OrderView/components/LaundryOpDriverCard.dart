import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["OrderView"]["Components"]["LaundryOpOrderDriverCard"];

class LaundryOpOrderDriverCard extends StatelessWidget {
  const LaundryOpOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: (_isDriverExist())
              ? Row(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: 23,
                          backgroundImage:
                              CachedNetworkImageProvider(_getDriver()!.image)),
                      Positioned(
                        right: -30,
                        child: CircleAvatar(
                          radius: 23,
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
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getDriver()!.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        if (_getTime() != null) Text(_getTime()!)
                      ],
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => MessageButton(
                        showRedDot: Get.find<OrderController>()
                            .hasNewMessageNotification(_getCorrectChatId()),
                        onTap: () {
                          Get.toNamed(getMessagesRoute(
                              orderId: order.orderId,
                              orderType: OrderType.Laundry,
                              chatId: _getCorrectChatId(),
                              recipientType: ParticipantType.DeliveryDriver));
                        }),
                  )
                ])
              : Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFEDEDED),
                        ),
                        Positioned(
                          right: -30,
                          child: CircleAvatar(
                            radius: 23,
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
                      child: Text(
                        "${_i18n()["noDriver"]}",
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                  ],
                )),
    );
  }

  String? _getTime() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.estimatedPickupFromCustomerTime != null) {
      return "${_i18n()["pickUpTime"]}:\n${DateFormat.MMMd(userLangCode).format(order.estimatedPickupFromCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(order.estimatedPickupFromCustomerTime!.toLocal())}";
    } else if (order.estimatedDropoffAtCustomerTime != null) {
      return "${_i18n()["dropOffTime"]}:\n${DateFormat.MMMd(userLangCode).format(order.estimatedDropoffAtCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(order.estimatedDropoffAtCustomerTime!.toLocal())}";
    } else {
      return null;
    }
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
        orderType: OrderType.Laundry,
        chatId: order.serviceProviderDropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

  void _laundryPickupDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        orderType: OrderType.Laundry,
        chatId: order.serviceProviderPickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
