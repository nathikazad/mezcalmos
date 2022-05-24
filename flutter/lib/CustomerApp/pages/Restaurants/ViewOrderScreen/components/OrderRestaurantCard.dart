import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class OrderRestaurantCard extends StatelessWidget {
  const OrderRestaurantCard({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.restaurant.image),
              radius: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurant.name,
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 18,
                          color: primaryBlueColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            order.restaurant.location.address,
                            style: Get.textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Spacer(),
            _messageIcon(context)
          ],
        ),
      ),
    );
  }

  Widget _orderMessageButton(BuildContext context) {
    return Stack(
      children: <Widget>[
        _messageIcon(context),
        Obx(
          () => Get.find<OrderController>()
                  .orderHaveNewMessageNotifications(order.orderId)
              ? _newMessageRedDot(context)
              : Container(),
        )
      ],
    );
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
          color: const Color(0xffff0000),
        ),
      ),
    );
  }

  Widget _messageIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed<void>(
          getMessagesRoute(
            chatId: order.orderId,
            orderId: order.orderId,
            recipientType: ParticipantType.Restaurant,
          ),
        );
      },
      icon: Icon(
        Icons.textsms,
        color: primaryBlueColor,
      ),
    );
  }
}
