import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["components"]["driverOrderCard"];

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.driver,
    required this.assignDriverCallback,
    required this.order,
    this.driverUserInfoAndUpdateStatus,
  }) : super(key: key);

  final Order order;
  final DeliveryDriverUserInfo? driver;
  final void Function({
    required DeliveryDriver deliveryDriver,
    required bool changeDriver,
  }) assignDriverCallback;

  final DriverUserInfoAndUpdateStatus? driverUserInfoAndUpdateStatus;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                '${_i18n()["driver"]}',
                style: textTheme.bodyText1,
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1200),
              child: (driverUserInfoAndUpdateStatus == null ||
                      (driverUserInfoAndUpdateStatus != null &&
                          driverUserInfoAndUpdateStatus ==
                              DriverUserInfoAndUpdateStatus.staring))
                  ? Card(
                      color: (navigateAndGetDriver() != null || driver != null)
                          ? Colors.white
                          : Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1.5,
                          color: (driver != null)
                              ? Colors.green
                              : Colors.redAccent,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: navigateAndGetDriver(),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: (driver != null)
                              ? driverInfoComponent(textTheme, context)
                              : noDriverComponent(context, textTheme),
                        ),
                      ),
                    )
                  :
                  // else if (driverUserInfoAndUpdateStatus ==
                  //     DriverUserInfoAndUpdateStatus.uploading)
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getNewDriverWhenDriverIsNull() async {
    final DeliveryDriver? newDriver = await Get.toNamed<dynamic>(
      kDriversListRoute,
      arguments: order,
    );
    if (newDriver != null)
      assignDriverCallback(
        deliveryDriver: newDriver,
        changeDriver: false,
      );
  }

  Future<void> _getNewDriverWhenDriverIsNotNull() async {
    /// Navigate to kDriversListRoute and get DeliveryDriver.
    final DeliveryDriver? newDriver = await Get.toNamed<dynamic>(
      kDriversListRoute,
      arguments: order,
    ) as DeliveryDriver?;
    mezDbgPrint(
        '_getNewDriverWhenDriverIsNotNull: newDriver ${newDriver.toString()}');
    if (newDriver != null)
      assignDriverCallback(
        deliveryDriver: newDriver,
        changeDriver: true,
      );
  }

  void Function()? navigateAndGetDriver() {
    if (driver == null) {
      mezDbgPrint('navigateAndGetDriver driver ');
      if (order.orderType == OrderType.Laundry) {
        if ((order as LaundryOrder).laundry == null) {
          return null;
        } else {
          return () async {
            await _getNewDriverWhenDriverIsNull();
          };
        }
      } else {
        return () async {
          await _getNewDriverWhenDriverIsNull();
        };
      }
    } else {
      // TODO: @hamza change driver funcitonality
      if (order.orderType == OrderType.Laundry) {
        if ((order as LaundryOrder).laundry == null) {
          return null;
        } else {
          return () async {
            await _getNewDriverWhenDriverIsNotNull();
          };
        }
      } else {
        return () async {
          await _getNewDriverWhenDriverIsNotNull();
        };
      }
    }
  }

  // ------ LOCAL COMPONENTS ---------//
  Widget noDriverComponent(BuildContext context, TextTheme textTheme) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.moped_rounded,
          color: Theme.of(context).primaryColorLight,
          size: 50,
        ),
        SizedBox(width: 10),
        Text(
          '${_i18n()["noDriver"]}',
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
      children: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(driver!.image),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                driver!.name,
                style: textTheme.bodyText2,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        const Spacer(),
        if (order.inProcess())
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF70A9A9A9),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 18,
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        getRightMessageRoute();
                      },
                      icon: Icon(
                        Icons.textsms_rounded,
                        color: Get.theme.primaryColorLight,
                      )),
                  order.orderType == OrderType.Restaurant
                      ? _restaurantMessagesDot(context)
                      : _laundryMessagesRedDot(context),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget _restaurantMessagesDot(BuildContext context) {
    return Obx(
      () => Get.find<RestaurantOrderController>()
              .orderHaveNewMessageNotifications(
                  (order as DeliverableOrder).dropOffDriverChatId!)
          ? _newMessageRedDot(context)
          : Container(),
    );
  }

  Widget _laundryMessagesRedDot(BuildContext context) {
    if ((order as LaundryOrder).getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (order as TwoWayDeliverableOrder).pickupDriverChatId!)
            ? _newMessageRedDot(context)
            : Container(),
      );
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (order as TwoWayDeliverableOrder).dropOffDriverChatId!)
            ? _newMessageRedDot(context)
            : Container(),
      );
    } else {
      mezDbgPrint("NOOOOOTHING  ----------->>>> )))))))))))))))))))))))))))");
      return Container();
    }
  }

  Widget _messageIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Icon(
        Icons.textsms,
        color: Colors.white,
      ),
    );
  }

  Widget _newMessageRedDot(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xfff6efff), width: 2),
            color: const Color(0xffff0000)),
      ),
    );
  }

// ------ FUNCTIONS ---------//
  void getRightMessageRoute() {
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
  void restaurantDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order  dropoff driver message route function
  void _laundryDropOffDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order pickup driver message route function
  void _laundryPickupDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: order.orderId,
        chatId: (order as TwoWayDeliverableOrder).pickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
