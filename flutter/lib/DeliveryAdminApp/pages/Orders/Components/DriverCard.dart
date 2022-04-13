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

class DriverCard extends StatefulWidget {
  Order order;
  DeliveryDriverUserInfo? driver;
  Future Function(DeliveryDriver?) callBack;
  DriverCard(
      {Key? key,
      required this.driver,
      required this.callBack,
      required this.order})
      : super(key: key);

  @override
  State<DriverCard> createState() => _DriverCardState();
}

class _DriverCardState extends State<DriverCard> {
  bool? btnClicked;
  @override
  void initState() {
    // TODO: implement initState
    btnClicked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                '${_i18n()["driver"]}',
                style: textTheme.bodyText1,
              ),
            ),
            Card(
              color: (navigateAndGetDriver() != null || widget.driver != null)
                  ? Colors.white
                  : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1.5,
                    color: (widget.driver != null)
                        ? Colors.green
                        : Colors.redAccent,
                  )),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: navigateAndGetDriver(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: (btnClicked!)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (widget.driver != null)
                          ? driverInfoComponent(textTheme, context)
                          : noDriverComponent(context, textTheme),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Function()? navigateAndGetDriver() {
    if (widget.driver == null && btnClicked! == false) {
      if (widget.order.orderType == OrderType.Laundry) {
        if ((widget.order as LaundryOrder).laundry == null) {
          return null;
        } else {
          return () async {
            setState(() {
              btnClicked = true;
            });
            final DeliveryDriver? newDriver =
                await Get.toNamed(kDriversListRoute, arguments: widget.order)!
                    .then((value) async {
              if (value != null) {
                await widget.callBack(value).whenComplete(() {
                  setState(() {
                    btnClicked = false;
                  });
                });
              } else {
                setState(() {
                  btnClicked = false;
                });
              }
              return null;
            });
          };
        }
      } else {
        return () async {
          setState(() {
            btnClicked = true;
          });
          final DeliveryDriver? newDriver =
              await Get.toNamed(kDriversListRoute, arguments: widget.order)!
                  .then((value) async {
            if (value != null) {
              await widget.callBack(value).whenComplete(() {
                setState(() {
                  btnClicked = false;
                });
              });
            } else {
              setState(() {
                btnClicked = false;
              });
            }
            return null;
          });
        };
      }
    } else {
      return null;
    }
  }

  // ------ LOCAL COMPONENTS ---------//
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
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(widget.driver!.image),
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
                widget.driver!.name,
                style: textTheme.bodyText2,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        Spacer(),
        if (widget.order.inProcess())
          Material(
            color: Theme.of(context).primaryColorLight,
            shape: CircleBorder(),
            child: InkWell(
              onTap: () {
                getRightMessageRoute();
              },
              customBorder: CircleBorder(),
              child: Stack(
                children: [
                  _messageIcon(context),
                  if (widget.order.orderType == OrderType.Restaurant)
                    restaurantMessagesDot(context),
                  if (widget.order.orderType == OrderType.Laundry)
                    laundryMessagesRedDot(context)
                ],
              ),
            ),
          )
        // IconButton(
        //     onPressed: () {
        //       getRightMessageRoute();
        //     },
        //     icon: Icon(Icons.message_outlined)),
      ],
    );
  }

  Obx restaurantMessagesDot(BuildContext context) {
    return Obx(
      () => Get.find<RestaurantOrderController>()
              .orderHaveNewMessageNotifications(
                  (widget.order as DeliverableOrder).dropOffDriverChatId!)
          ? _newMessageRedDot(context)
          : Container(),
    );
  }

  Widget laundryMessagesRedDot(BuildContext context) {
    if ((widget.order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Pickup) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (widget.order as TwoWayDeliverableOrder)
                        .pickupDriverChatId!)
            ? _newMessageRedDot(context)
            : Container(),
      );
    } else if ((widget.order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return Obx(
        () => Get.find<LaundryOrderController>()
                .orderHaveNewMessageNotifications(
                    (widget.order as TwoWayDeliverableOrder)
                        .dropOffDriverChatId!)
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
      left: 0,
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
    Get.toNamed(getMessagesRoute(
        orderId: widget.order.orderId,
        chatId: (widget.order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order  dropoff driver message route function
  void _laundryDropOffDriverMessageRoute() {
    Get.toNamed(getMessagesRoute(
        orderId: widget.order.orderId,
        chatId: (widget.order as DeliverableOrder).dropOffDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }

// laundry order pickup driver message route function
  void _laundryPickupDriverMessageRoute() {
    Get.toNamed(getMessagesRoute(
        orderId: widget.order.orderId,
        chatId: (widget.order as TwoWayDeliverableOrder).pickupDriverChatId!,
        recipientType: ParticipantType.DeliveryDriver));
  }
}
