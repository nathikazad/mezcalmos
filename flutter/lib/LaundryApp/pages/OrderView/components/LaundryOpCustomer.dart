import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['LaundryOpOrderView'];

class LaundryOpCustomer extends StatelessWidget {
  const LaundryOpCustomer({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_i18n()["customer"]}:",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        CachedNetworkImageProvider(order.customer.image),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Text(
                      order.customer.name,
                      style: Get.theme.textTheme.bodyText1,
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => MessageButton(
                        showRedDot: Get.find<OrderController>()
                            .hasNewMessageNotification(order.orderId),
                        onTap: () {
                          Get.toNamed(getMessagesRoute(
                              orderId: order.orderId,
                              orderType: OrderType.Laundry,
                              chatId: order.orderId,
                              recipientType: ParticipantType.Customer));
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageButton(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        Get.toNamed(getMessagesRoute(
            orderId: order.orderId,
            orderType: OrderType.Laundry,
            chatId: order.orderId,
            recipientType: ParticipantType.Customer));
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.textsms,
              color: primaryBlueColor,
            ),
          ),
          Obx(
            () => Get.find<OrderController>()
                    .hasNewMessageNotification(order.orderId)
                ? Positioned(
                    left: 27,
                    top: 10,
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
    );
  }
}
