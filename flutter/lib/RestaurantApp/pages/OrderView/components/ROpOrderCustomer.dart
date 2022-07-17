import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
//     ['OrderView']['LaundryOpOrderView'];

class ROpOrderCustomer extends StatelessWidget {
  const ROpOrderCustomer({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        CachedNetworkImageProvider(order.customer.image),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.customer.name,
                          style: Get.theme.textTheme.bodyText1,
                        ),
                        Text(
                          order.to.address,
                          style: Get.theme.textTheme.bodyText2,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  MessageButton(
                      showRedDot: Get.find<ROpOrderController>()
                          .hasNewMessageNotification(order.orderId),
                      onTap: () {
                        Get.toNamed(getMessagesRoute(
                            orderId: order.orderId,
                            chatId: order.orderId,
                            recipientType: ParticipantType.Customer));
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
