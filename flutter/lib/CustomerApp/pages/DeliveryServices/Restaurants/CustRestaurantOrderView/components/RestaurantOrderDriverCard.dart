import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
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
    if (order.driverInfo != null && order.inProcess()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              '${_i18n()["driver"]}',
              style: context.txt.bodyLarge,
            ),
          ),
          SizedBox(
            height: 4,
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
                            order.driverInfo!.image)),
                    Positioned(
                      right: -35,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                              radius: 23,
                              child: Icon(
                                Icons.delivery_dining,
                                size: 30,
                                color: Colors.white,
                              )),
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
                    order.driverInfo!.name,
                    style: context.txt.bodyLarge,
                  ),
                ),
                if (order.customerDriverChatId != null)
                  MessageButton(
                    onTap: () {
                      BaseMessagingScreen.navigate(
                          chatId: order.customerDriverChatId!);
                    },
                    chatId: order.customerDriverChatId!,
                  ),
              ],
            ),
          )),
        ],
      );
    } else if (order.selfDeliveryDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              '${_i18n()["driver"]}',
              style: context.txt.bodyLarge,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                        radius: 23,
                        backgroundImage:
                            CachedNetworkImageProvider(order.restaurant.image)),
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
                        order.restaurant.name,
                        style: context.txt.bodyLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${_i18n()["selfDeliveryTitle"]}'),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
