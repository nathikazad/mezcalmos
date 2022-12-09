import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpDriverCard"];

class ROpDriverCard extends StatefulWidget {
  const ROpDriverCard({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpDriverCard> createState() => _ROpDriverCardState();
}

class _ROpDriverCardState extends State<ROpDriverCard> {
  RxBool showSet = RxBool(false);
  Rxn<Restaurant> restaurant = Rxn();
  @override
  void initState() {
    _checkSelfDelivery();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RestaurantInfoController>(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: (widget.order.dropoffDriver != null &&
                  widget.order.deliveryMode !=
                      DeliveryMode.SelfDeliveryByRestaurant)
              ? Row(children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: CachedNetworkImageProvider(
                              widget.order.dropoffDriver!.image)),
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
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.dropoffDriver!.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        Text(
                          (widget.order.selfDelivery)
                              ? '${_i18n()["selfDelivery"]}'
                              : '${_i18n()["forwarded"]}',
                          style: Get.textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  if (widget.order.inProcess() &&
                      widget.order.dropoffDriver != null &&
                      widget.order.selfDelivery)
                    MezIconButton(
                      onTap: () {
                        // Get.toNamed(getROpPickDriverRoute(
                        //     orderId: widget.order.orderId));
                      },
                      icon: Icons.edit,
                    ),
                  if (widget.order.serviceProviderDropOffDriverChatId != null)
                    Obx(
                      () => MessageButton(
                        onTap: () {
                          MezRouter.toNamed(getMessagesRoute(
                              chatId: widget
                                  .order.serviceProviderDropOffDriverChatId!,
                              recipientType: ParticipantType.DeliveryDriver,
                              orderId: widget.order.orderId));
                        },
                        showRedDot: Get.find<ROpOrderController>()
                            .hasNewMessageNotification(widget
                                .order.serviceProviderDropOffDriverChatId!
                                .toString()),
                      ),
                    )
                ])
              : (widget.order.selfDelivery)
                  ? _selfDeliveryWidget()
                  : _noDriverYet()),
    );
  }

  Future<void> _checkSelfDelivery() async {
    restaurant.value =
        await get_restaurant_by_id(id: widget.order.restaurantId);

    showSet.value = restaurant.value!.selfDelivery;
  }

  Widget _selfDeliveryWidget() {
    return Obx(
      () {
        if (restaurant.value != null) {
          return Row(children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundImage: CachedNetworkImageProvider(
                        restaurant.value!.info.image)),
                Positioned(
                  right: -30,
                  bottom: 0,
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
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.value!.info.name,
                    style: Get.textTheme.bodyText1,
                  ),
                  Text(
                    '${_i18n()["selfDelivery"]}',
                    style: Get.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            if (widget.order.inProcess() &&
                (widget.order.dropoffDriver != null))
              MezIconButton(
                onTap: () async {
                  // final bool? forwardToMezCalmos = await Get.toNamed(
                  //         getROpPickDriverRoute(orderId: widget.order.orderId))
                  //     as bool?;
                  // if (forwardToMezCalmos != null &&
                  //     forwardToMezCalmos == false) {
                  //   showSet.value = false;
                  // }
                },
                icon: Icons.edit,
              ),
          ]);
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget _noDriverYet() {
    return Row(
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
          fit: FlexFit.tight,
          child: Text(
            '${_i18n()["noDriver"]}',
            style: Get.textTheme.bodyText1,
          ),
        ),
        Obx(() {
          if (showSet.isTrue) {
            return InkWell(
                onTap: () async {
                  final bool? forwardToMezCalmos = await Get.toNamed(
                      getROpPickDriverRoute(
                          serviceProviderId: widget.order.restaurantId,
                          orderId: widget.order.orderId)) as bool?;
                  if (forwardToMezCalmos != null &&
                      forwardToMezCalmos == false) {
                    showSet.value = false;
                  }
                },
                child: Ink(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (widget.order.estimatedFoodReadyTime != null)
                          ? Colors.grey.shade300
                          : Colors.transparent),
                  child: (widget.order.estimatedFoodReadyTime != null)
                      ? Icon(
                          Icons.edit_outlined,
                          size: 18,
                        )
                      : Text(
                          '${_i18n()["set"]}',
                          style: Get.textTheme.bodyText1
                              ?.copyWith(color: primaryBlueColor),
                        ),
                ));
          } else {
            return SizedBox();
          }
        })
      ],
    );
  }
}
