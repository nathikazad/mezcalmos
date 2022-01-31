import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/BuildOrderButtons.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/OrderMapTracking.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class LaundryOrderScreen extends StatefulWidget {
  const LaundryOrderScreen({Key? key}) : super(key: key);

  @override
  State<LaundryOrderScreen> createState() => _LaundryOrderScreenState();
}

class _LaundryOrderScreenState extends State<LaundryOrderScreen> {
  ///--------------- Controllers ------------------------//
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();

  ///--------------- Controllers ------------------------//

  /// ------------------ variables ------------------//
  Rxn<LaundryOrder> order = Rxn();

  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription? _orderListener;

  /// ------------------ variables ------------------//

  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
        } else {
          Get.back();
        }
      });
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back, withOrder: true),
        body: Obx(() {
          if (order.value == null) {
            // Order Loading ..
            Get.back();
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LaundryOrderStatusCard(
                      order: order.value!,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    orderCustomer(txt, context),
                    if (order.value?.inProcess() ?? false)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: buildOrderButtons(order),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    orderSummary(txt, context),
                    SizedBox(
                      height: 10,
                    ),
                    deliveryLocation(txt, context),
                    SizedBox(
                      height: 10,
                    ),
                    orderNotes(txt)
                  ],
                ),
              ),
            );
          }
        }));
  }

//  Card shows the customer image and name and message button
//
  Widget orderCustomer(TextTheme txt, BuildContext context) {
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
                      CachedNetworkImageProvider(order.value!.customer.image),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  order.value!.customer.name,
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
                          () => controller
                                  .orderHaveNewMessageNotifications(orderId)
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

// Card that shows the notes assigned with the orders
  Widget orderNotes(TextTheme txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${lang.strings['customer']['restaurant']['menu']['notes']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text(
              order.value!.notes!,
            ),
          ),
        ),
      ],
    );
  }

// Card that shows the delivery location of the order
  Widget deliveryLocation(TextTheme txt, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${lang.strings['customer']['restaurant']['cart']['deliveryLocation']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.value!.to.address, maxLines: 1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

// Card that shows the order summary (prices and total costs)
  Widget orderSummary(TextTheme txt, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${lang.strings['customer']['restaurant']['cart']['orderSummary']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang.strings['deliveryAdminApp']['laundry']
                          ['orderWeight'],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.value!.weight != null)
                          ? order.value!.weight.toString() + ' kg'
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${lang.strings["customer"]["restaurant"]["cart"]["orderCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.value!.cost != 0)
                          ? '\$' + order.value!.cost.toStringAsFixed(0)
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${lang.strings["customer"]["restaurant"]["cart"]["deliveryCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "\$5",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Divider(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.value!.cost != 0)
                          ? '\$' + (order.value!.cost + 5).toString()
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
