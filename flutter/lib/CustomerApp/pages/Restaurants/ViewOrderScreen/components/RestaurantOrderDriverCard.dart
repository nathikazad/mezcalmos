import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
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
                  child: Text(
                    order.dropoffDriver!.name,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                if (order.customerDropOffDriverChatId != null)
                  Obx(
                    () => MessageButton(
                        showRedDot: Get.find<OrderController>()
                            .hasNewMessageNotification(
                                order.customerDropOffDriverChatId!),
                        onTap: () {
                          Get.toNamed(getMessagesRoute(chatId: order.chatId
                              // recipientType: ParticipantType.DeliveryDriver,
                              // orderType: OrderType.Restaurant,
                              // orderId: order.orderId,
                              // chatId: order.customerDropOffDriverChatId!,
                              ));
                        }),
                  )
              ],
            ),
          )),
        ],
      );
    } else {
      return Container();
    }
  }
}
