import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class DriverCard extends StatelessWidget {
  final Order order;
  DeliveryDriverUserInfo? driver;
  Function(DeliveryDriver?) callBack;
  DriverCard(
      {Key? key,
      required this.driver,
      required this.callBack,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Driver',
              style: textTheme.bodyText1,
            ),
          ),
          Card(
            color: (navigateAndGetDriver() != null || driver != null)
                ? Colors.white
                : Colors.grey.shade400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 1.5,
                  color: (driver != null) ? Colors.green : Colors.redAccent,
                )),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: navigateAndGetDriver(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: (driver != null)
                    ? driverInfoComponent(textTheme, context)
                    : noDriverComponent(context, textTheme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Function()? navigateAndGetDriver() {
    if (driver == null) {
      if (order.orderType == OrderType.Laundry) {
        if ((order as LaundryOrder).laundry == null) {
          mezDbgPrint('No laundry');
          return null;
        } else {
          return () async {
            DeliveryDriver? newDriver =
                await Get.toNamed(kDriversListRoute, arguments: order)
                    as DeliveryDriver;
            callBack(newDriver);
          };
        }
      } else {
        return () async {
          DeliveryDriver? newDriver =
              await Get.toNamed(kDriversListRoute, arguments: order)
                  as DeliveryDriver;
          callBack(newDriver);
        };
      }
    } else {
      return null;
    }
  }

  // ------ LOCAL COMPONENTS ---------//

// CARD CONTENT WHEN THERE IS NO DRIVER (DRIVER == NULL)
  Widget noDriverComponent(BuildContext context, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.moped_rounded,
          color: Theme.of(context).primaryColorLight,
          size: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Pick a driver',
          style: textTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_forward)
      ],
    );
  }

// CARD CONTENT WHEN THERE IS DRIVER ASSIGNED, DRIVER INFO AND MESSAGE BUTTON (DRIVER != NULL)
  Widget driverInfoComponent(TextTheme textTheme, BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(driver!.image),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driver!.name,
                style: textTheme.bodyText2,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        Spacer(),
        if (order.inProcess())
          IconButton(
              onPressed: () {
                getRightMessageRoute();
              },
              icon: Icon(Icons.message_outlined)),
      ],
    );
  }

// ------ FUNCTIONS ---------//
// function to assign the right routing function depending on order type and order phase
  getRightMessageRoute() {
    if (order.orderType == OrderType.Laundry) {
      // START OF LAUNDRY ORDER LOGIC (PHASES)
      if (((order as LaundryOrder).getCurrentPhase() ==
          LaundryOrderPhase.Pickup)) {
        _laundryPickupDriverMessageRoute();
      } else {
        _laundryDropOffDriverMessageRoute();
      }
      // END OF LAUNDRY ORDER LOGIC
    } else if (order.orderType == OrderType.Restaurant) {
      // RESTAURANT  ORDER LOGIC
      restaurantDriverMessageRoute();
    }
  }

// restaurant order driver message route function
  restaurantDriverMessageRoute() {
    Get.toNamed(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order  dropoff driver message route function
  _laundryDropOffDriverMessageRoute() {
    Get.toNamed(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order pickup driver message route function
  _laundryPickupDriverMessageRoute() {
    Get.toNamed(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as TwoWayDeliverableOrder).pickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
