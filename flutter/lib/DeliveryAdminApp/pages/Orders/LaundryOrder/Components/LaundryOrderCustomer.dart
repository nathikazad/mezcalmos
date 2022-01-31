import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderCustomer extends StatelessWidget {
  final LaundryOrder order;
  LaundryOrderCustomer({Key? key, required this.order}) : super(key: key);
  LanguageController lang = Get.find<LanguageController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            lang.strings['deliveryAdminApp']['laundry']['customer'],
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(order.customer.image),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  order.customer.name,
                  style: txt.bodyText1,
                ),
                Spacer(),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      // Get.toNamed(getRestaurantMessagesRoute(order.orderId));
                    },
                    customBorder: CircleBorder(),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Icon(
                            Icons.textsms,
                            color: Colors.white,
                          ),
                        ),
                        Obx(
                          () => controller.orderHaveNewMessageNotifications(
                                  order.orderId)
                              ? Positioned(
                                  left: 27,
                                  top: 10,
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
