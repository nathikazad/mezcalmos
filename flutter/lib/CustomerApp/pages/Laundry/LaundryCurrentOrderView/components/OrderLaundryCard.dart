import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

class OrderLaundryCard extends StatelessWidget {
  const OrderLaundryCard({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.serviceProvider.image),
              radius: 23,
            ),
            SizedBox(
              width: 7,
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.serviceProvider.name,
                      style: context.txt.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          size: 18,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 8,
                            child: Text(order.dropOffLocation.address,
                                maxLines: 1)),
                      ],
                    )
                  ],
                )),
            MessageButton(
              onTap: () {
                BaseMessagingScreen.navigate(chatId: order.chatId);
              },
              chatId: order.chatId,
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        BaseMessagingScreen.navigate(chatId: order.orderId);
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
          // Obx(
          //   () => Get.find<OrderController>()
          //           .orderHaveNewMessageNotifications(order.orderId)
          //       ? Positioned(
          //           right: 0,
          //           top: 0,
          //           child: Container(
          //             width: 13,
          //             height: 13,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 border: Border.all(
          //                     color: const Color(0xfff6efff), width: 2),
          //                 color: const Color(0xffff0000)),
          //           ),
          //         )
          //       : Container(),
          // )
        ],
      ),
    );
  }
}
