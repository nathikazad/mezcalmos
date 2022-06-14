import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
        ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]
    ["RestaurantOrderDriverCard"];

class RestaurantOrderDriverCard extends StatelessWidget {
  const RestaurantOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    if (order.dropoffDriver != null && order.inProcess()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                        radius: 23,
                        backgroundImage: CachedNetworkImageProvider(
                            order.dropoffDriver!.image)),
                    Positioned(
                      right: -35,
                      child: CircleAvatar(
                        radius: 23,
                        child: Icon(
                          Icons.delivery_dining,
                          size: 30,
                          color: Colors.white,
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
                        order.dropoffDriver!.name,
                        style: Get.textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (_getTime() != null) Text(_getTime()!)
                    ],
                  ),
                ),
                if (order.customerDropOffDriverChatId != null)
                  MessageButton(
                      showRedDot: Get.find<OrderController>()
                          .hasNewMessageNotification(
                              order.customerDropOffDriverChatId!),
                      onTap: () {
                        Get.toNamed(getMessagesRoute(
                          recipientType: ParticipantType.DeliveryDriver,
                          orderId: order.orderId,
                          chatId: order.customerDropOffDriverChatId!,
                        ));
                      })
              ],
            ),
          )),
        ],
      );
    } else {
      return Container();
    }
  }

  String? _getTime() {
    final String userLangCode =
        Get.find<LanguageController>().userLanguageKey.toLanguageCode();
    if (order.estimatedDropoffAtCustomerTime != null) {
      return "${_i18n()["dropOffTime"]}: \n ${DateFormat.MMMd(userLangCode).format(order.estimatedDropoffAtCustomerTime!.toLocal())} ${DateFormat("hh:mm a").format(order.estimatedDropoffAtCustomerTime!.toLocal())}";
    } else {
      return null;
    }
  }
}
