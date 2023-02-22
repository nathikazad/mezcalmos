import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/controllers/LaundryOpOrderViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["OrderView"]["Components"]["LaundryOpOrderDriverCard"];

class LaundryOpOrderDriverCard extends StatelessWidget {
  const LaundryOpOrderDriverCard({Key? key, required this.viewController})
      : super(key: key);
  final LaundryOpOrderViewController viewController;
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
                          style: Get.textTheme.bodyLarge,
                        ),
                        if (_getTime() != null) Text(_getTime()!)
                      ],
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => MessageButton(
                        chatId: _getCorrectChatId(),
                        onTap: () {
                          MezRouter.toNamed(SharedRoutes.getMessagesRoute(
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
                      fit: FlexFit.tight,
                      child: Text(
                        "${_i18n()["noDriver"]}",
                        style: Get.textTheme.bodyLarge,
                      ),
                    ),
                    MezIconButton(
                      icon: Icons.add,
                      onTap: () {
                        SharedServiceProviderRoutes.navigateToPickDriver(
                            deliveryOrderId:
                                viewController.order.deliveryOrderId,
                            showForwardButton: false);
                      },
                    )
                  ],
                )),
    );
  }

  String? _getTime() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        viewController.order.estimatedPickupFromCustomerTime != null) {
      return "${_i18n()["pickUpTime"]}:\n${DateFormat.MMMd(userLangCode).format(viewController.order.estimatedPickupFromCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(viewController.order.estimatedPickupFromCustomerTime!.toLocal())}";
    } else if (viewController.order.estimatedDropoffAtCustomerTime != null &&
        viewController.order.status != LaundryOrderStatus.PickedUpFromLaundry) {
      return "${_i18n()["dropOffTime"]}:\n${DateFormat.MMMd(userLangCode).format(viewController.order.estimatedDropoffAtCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(viewController.order.estimatedDropoffAtCustomerTime!.toLocal())}";
    } else {
      return null;
    }
  }

  bool _isDriverExist() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.pickupDriver != null;
    } else {
      return viewController.order.dropoffDriver != null;
    }
  }

  int _getCorrectChatId() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.serviceProviderPickupDriverChatId!;
    } else {
      return viewController.order.serviceProviderDropOffDriverChatId!;
    }
  }

  DeliveryDriverUserInfo? _getDriver() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return viewController.order.pickupDriver;
    } else {
      return viewController.order.dropoffDriver;
    }
  }

  void _handleMessageRouting() {
    if (viewController.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      _laundryPickupDriverMessageRoute();
    } else {
      _laundryDropOffDriverMessageRoute();
    }
  }

  void _laundryDropOffDriverMessageRoute() {
    MezRouter.toNamed<dynamic>(SharedRoutes.getMessagesRoute(
        orderId: viewController.order.orderId,
        orderType: OrderType.Laundry,
        chatId: viewController.order.serviceProviderDropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

  void _laundryPickupDriverMessageRoute() {
    MezRouter.toNamed<dynamic>(SharedRoutes.getMessagesRoute(
        orderId: viewController.order.orderId,
        orderType: OrderType.Laundry,
        chatId: viewController.order.serviceProviderPickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
