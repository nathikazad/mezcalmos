import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';

class LaundryOrderCustomer extends StatelessWidget {
  final LaundryOrder order;

  const LaundryOrderCustomer({Key? key, required this.order}) : super(key: key);

  /// LanguageController
  static dynamic _i18n() =>
      Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
          ["Orders"]["LaundryOrder"]["Components"]["LaundryOrderCustomer"];

  /// LaundryOrderController
  static final LaundryOrderController controller =
      Get.find<LaundryOrderController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            _i18n()['customer'],
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            width: double.infinity,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(order.customer.image),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Text(
                    order.customer.name,
                    style: txt.bodyText1,
                  ),
                ),
                const Spacer(),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed<void>(
                        getMessagesRoute(
                          chatId: order.orderId,
                          orderId: order.orderId,
                          orderType: OrderType.Laundry,
                          recipientType: ParticipantType.Customer,
                        ),
                      );
                    },
                    customBorder: CircleBorder(),
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFAC59FC),
                          child: Image.asset(
                            'assets/images/deliveryAdmin/message.png',
                          ),
                        ),
                        Obx(
                          () => controller.orderHaveNewMessageNotifications(
                                  order.orderId)
                              ? Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xfff6efff),
                                            width: 2),
                                        color: const Color(0xffff0000)),
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
