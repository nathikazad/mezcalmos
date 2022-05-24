import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderDriverCard extends StatelessWidget {
  const LaundryOrderDriverCard({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getRightDriver() != null) {
      return Card(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        CachedNetworkImageProvider(_getRightDriver()!.image)),
                Positioned(
                  right: -30,
                  bottom: 8,
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
                    _getRightDriver()!.name,
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
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.textsms_rounded,
                  color: primaryBlueColor,
                ))
          ],
        ),
      ));
    } else {
      return Container();
    }
  }

  String? _getTime() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup &&
        order.estimatedPickupFromCustomerTime != null) {
      return "Pick-up time : ${DateFormat("dd MMMM yyyy, hh:mm a").format(order.estimatedPickupFromCustomerTime!)}";
    } else if (order.estimatedDropoffAtCustomerTime != null) {
      return "Dropoff time : ${DateFormat("dd MMMM yyyy, hh:mm a").format(order.estimatedDropoffAtCustomerTime!)}";
    } else {
      return null;
    }
  }

  DeliveryDriverUserInfo? _getRightDriver() {
    if (order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return order.pickupDriver;
    } else if (order.getCurrentPhase() == LaundryOrderPhase.Dropoff) {
      return order.dropoffDriver;
    } else {
      return null;
    }
  }
}
