import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/PickDriverView/PickDriverView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MessageButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpDriverCard"];

class ROpDriverCard extends StatefulWidget {
  const ROpDriverCard({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpDriverCard> createState() => _ROpDriverCardState();
}

class _ROpDriverCardState extends State<ROpDriverCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${_i18n()["driver"]}',
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (widget.order.dropoffDriver != null)
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
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.order.dropoffDriver!.name,
                                style: context.txt.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        if (widget.order.inProcess() &&
                            widget.order.dropoffDriver != null &&
                            widget.order.isSelfDelivery())
                          MezIconButton(
                            onTap: () {
                              PickDriverView.navigate(
                                  deliveryOrderId:
                                      widget.order.deliveryOrderId!,
                                  showForwardButton: false);
                            },
                            icon: Icons.edit,
                          ),
                        if (widget.order.serviceProviderDropOffDriverChatId !=
                            null)
                          MessageButton(
                            onTap: () {
                              BaseMessagingScreen.navigate(
                                  chatId: widget.order
                                      .serviceProviderDropOffDriverChatId!);
                            },
                            chatId: widget
                                .order.serviceProviderDropOffDriverChatId!,
                          ),
                      ])
                    : _noDriverYet()),
          ),
        ],
      ),
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
            style: context.txt.bodyLarge,
          ),
        ),
        if (widget.order.isSelfDelivery() && widget.order.inProcess())
          InkWell(
              onTap: () {
                PickDriverView.navigate(
                    deliveryOrderId: widget.order.deliveryOrderId!,
                    showForwardButton: true);
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
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
              ))
      ],
    );
  }
}
