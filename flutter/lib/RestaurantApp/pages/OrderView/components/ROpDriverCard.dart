import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpDriverCard"];

class ROpDriverCard extends StatelessWidget {
  const ROpDriverCard({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: (order.dropoffDriver != null)
              ? Row(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: CachedNetworkImageProvider(
                              order.dropoffDriver!.image)),
                      Positioned(
                        right: -30,
                        bottom: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: primaryBlueColor, shape: BoxShape.circle),
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
                    child: Text(
                      order.dropoffDriver!.name,
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  Spacer(),
                  if (order.serviceProviderDropOffDriverChatId != null)
                    MessageButton(
                      onTap: () {
                        Get.toNamed(getMessagesRoute(
                            chatId: order.serviceProviderDropOffDriverChatId!,
                            orderId: order.orderId));
                      },
                      showRedDot: Get.find<ROpOrderController>()
                          .hasNewMessageNotification(
                              order.serviceProviderDropOffDriverChatId!),
                    )
                ])
              : Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                        ),
                        Positioned(
                          right: -30,
                          bottom: 3,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: primaryBlueColor,
                                shape: BoxShape.circle),
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
                      child: Text(
                        '${_i18n()["noDriver"]}',
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                  ],
                )),
    );
  }
}
