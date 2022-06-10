import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

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
            height: 25,
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                            order.dropoffDriver!.image)),
                    Positioned(
                      right: -35,
                      child: CircleAvatar(
                        radius: 25,
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
                      //  if (_getTime() != null) Text("${_getTime()}"),
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
          SizedBox(height: 15),
        ],
      );
    } else {
      return Container();
    }
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

  String? _getTime() {
    if (order.estimatedDropoffAtCustomerTime != null) {
      return "Dropoff time : ${DateFormat("dd MMMM yyyy, hh:mm a").format(order.estimatedDropoffAtCustomerTime!)}";
    } else {
      return null;
    }
  }
}
