import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAvatar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpOrderCustomer"];

class ROpOrderCustomer extends StatelessWidget {
  const ROpOrderCustomer({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["customer"]}',
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
                  if (order.customer.image.isURL)
                    MezAvatar(
                      raduis: 25,
                      imageUrl: order.customer.image,
                      showDefaultImageOnError: true,
                      imagePlaceholderAsset: aDefaultAvatar,
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
                    onTap: () {
                      MezRouter.toNamed(SharedRoutes.getMessagesRoute(
                          chatId: order.chatId,
                          recipientType: ParticipantType.DeliveryDriver,
                          orderId: order.orderId));
                    },
                    chatId: order.chatId,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
