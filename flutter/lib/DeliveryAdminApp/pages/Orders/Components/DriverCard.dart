import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["components"]["driverOrderCard"];

class DriverCard extends StatefulWidget {
  const DriverCard({
    Key? key,
    required this.driver,
    required this.assignDriverCallback,
    required this.order,
  }) : super(key: key);

  final Order order;
  final DeliveryDriverUserInfo? driver;
  final Future<void> Function({
    required DeliveryDriver deliveryDriver,
    required bool changeDriver,
  }) assignDriverCallback;

  @override
  State<DriverCard> createState() => _DriverCardState();
}

class _DriverCardState extends State<DriverCard> {
  RxBool loading = RxBool(false);
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
            Container(
              child: (loading.isFalse)
                  ? Card(
                      color: (navigateAndGetDriver() != null ||
                              widget.driver != null)
                          ? Colors.white
                          : Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1.5,
                          color: (widget.driver != null)
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
                          child: (widget.driver != null)
                              ? driverInfoComponent(textTheme, context)
                              : noDriverComponent(context, textTheme),
                        ),
                      ),
                    )
                  : Card(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
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
      arguments: widget.order,
    );
    if (newDriver != null) {
      loading.value = true;
      // ignore: unawaited_futures
      widget
          .assignDriverCallback(
            deliveryDriver: newDriver,
            changeDriver: false,
          )
          .whenComplete(() => loading.value = false);
    }
  }

  Future<void> _getNewDriverWhenDriverIsNotNull() async {
    /// Navigate to kDriversListRoute and get DeliveryDriver.
    final DeliveryDriver? newDriver = await Get.toNamed<dynamic>(
      kDriversListRoute,
      arguments: widget.order,
    ) as DeliveryDriver?;
    mezDbgPrint(
        '_getNewDriverWhenDriverIsNotNull: newDriver ${newDriver.toString()}');
    if (newDriver != null) {
      loading.value = true;
      // ignore: unawaited_futures
      widget
          .assignDriverCallback(
            deliveryDriver: newDriver,
            changeDriver: true,
          )
          .whenComplete(() => loading.value = false);
    }
  }

  void Function()? navigateAndGetDriver() {
    if (widget.driver == null) {
      mezDbgPrint('navigateAndGetDriver driver ');
      if (widget.order.orderType == OrderType.Laundry) {
        if ((widget.order as LaundryOrder).laundry == null) {
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
      if (widget.order.orderType == OrderType.Laundry) {
        if ((widget.order as LaundryOrder).laundry == null) {
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
          backgroundImage: CachedNetworkImageProvider(widget.driver!.image),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.driver!.name,
                style: textTheme.bodyText2,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        const Spacer(),
        if (widget.order.inProcess())
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
                  widget.order.orderType == OrderType.Restaurant
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
      () {
        if ((widget.order as RestaurantOrder)
                .serviceProviderDropOffDriverChatId !=
            null) {
          return Get.find<RestaurantOrderController>()
                  .orderHaveNewMessageNotifications(
                      (widget.order as RestaurantOrder)
                          .serviceProviderDropOffDriverChatId!)
              ? _newMessageRedDot(context)
              : Container();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _laundryMessagesRedDot(BuildContext context) {
    if ((widget.order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Pickup) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (widget.order as TwoWayDeliverableOrder)
                        .serviceProviderPickupDriverChatId!)
            ? _newMessageRedDot(context)
            : Container(),
      );
    } else if ((widget.order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (widget.order as TwoWayDeliverableOrder)
                        .serviceProviderDropOffDriverChatId!)
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
    if (widget.order.orderType == OrderType.Laundry) {
      // START OF LAUNDRY ORDER LOGIC (PHASES)
      if (((widget.order as LaundryOrder).getCurrentPhase() ==
          LaundryOrderPhase.Pickup)) {
        _laundryPickupDriverMessageRoute();
      } else {
        _laundryDropOffDriverMessageRoute();
      }
      // END OF LAUNDRY ORDER LOGIC
    } else if (widget.order.orderType == OrderType.Restaurant) {
      // RESTAURANT  ORDER LOGIC
      restaurantDriverMessageRoute();
    }
  }

// restaurant order driver message route function
  void restaurantDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: widget.order.orderId,
        orderType: OrderType.Restaurant,
        chatId: (widget.order as DeliverableOrder)
            .serviceProviderDropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order  dropoff driver message route function
  void _laundryDropOffDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: widget.order.orderId,
        orderType: OrderType.Laundry,
        chatId: (widget.order as DeliverableOrder)
            .serviceProviderDropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order pickup driver message route function
  void _laundryPickupDriverMessageRoute() {
    Get.toNamed<dynamic>(getMessagesRoute(
        orderId: widget.order.orderId,
        orderType: OrderType.Laundry,
        chatId: (widget.order as TwoWayDeliverableOrder)
            .serviceProviderPickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
