import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class OrderLaundryCard extends StatelessWidget {
  const OrderLaundryCard({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.laundry?.image ?? ""),
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
                      order.laundry?.name ?? "",
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
                            order.laundry?.location.address ?? "",
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
            _messageButton(context)
          ],
        ),
      ),
    );
  }

  Widget _messageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed<void>(getMessagesRoute(
            orderId: order.orderId,
            chatId: order.orderId,
            recipientType: ParticipantType.DeliveryAdmin));
      },
      icon: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            //  margin: EdgeInsets.all(12),
            child: Icon(
              Icons.textsms,
              color: primaryBlueColor,
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
    );
  }
}
