import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"];

class LaundryOrderFromToComponent extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  /// inside the delivery driver order(laundry order) screen bottom card
  const LaundryOrderFromToComponent(
      {Key? key, required this.order, this.onSlide})
      : super(key: key);
  final void Function(bool)? onSlide;
  final LaundryOrder order;

  @override
  State<LaundryOrderFromToComponent> createState() =>
      _LaundryOrderFromToComponentState();
}

class _LaundryOrderFromToComponentState
    extends State<LaundryOrderFromToComponent> {
  ServiceInfo? laundry;

  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
  }

  void getLaundry() {
    if (widget.order.laundry != null) {
      laundry = widget.order.laundry;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _getOrderStatus(),
                // "Ready for pickup",
                style: TextStyle(
                  color: Color.fromRGBO(103, 121, 254, 1),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text(
                "\$50",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 12),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    widget.onSlide?.call(isExpanded);
                  });
                },
                child: Icon(
                  !isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 85,
                  child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: 6,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: CachedNetworkImageProvider(
                              widget.order.laundry?.image ?? ''),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: CachedNetworkImageProvider(
                              widget.order.customer.image,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Color.fromRGBO(73, 73, 73, 1),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          // 'Today, 10:53 AM',
                          DateFormat('EEEE, hh:mm a')
                              .format(widget.order.orderTime),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      // direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          color: Color.fromRGBO(73, 73, 73, 1),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          // DateFormat('EEEE, hh:mm a')
                          //     .format(widget.order.orderTime),
                          '1h 45min',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 16.33),
                        Icon(
                          Icons.route_outlined,
                          color: Color.fromRGBO(73, 73, 73, 1),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          // widget.order.routeInformation?.distance
                          //         .distanceStringInKm ??
                          //     '',
                          '1.5km',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.article_rounded,
                  color: Color.fromRGBO(103, 121, 254, 1),
                  size: 30,
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: Duration(seconds: 10),
            curve: Curves.bounceIn,
            child: !isExpanded
                ? null
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                  width: 5,
                                ),
                              ),
                            ),
                            SizedBox(width: 14),
                            Text(
                              widget.order.customer.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 9),
                            Icon(
                              Icons.sms_sharp,
                              color: Color.fromRGBO(103, 121, 254, 1),
                              size: 24,
                            ),
                            Spacer(),
                            Text('02:30 PM'),
                            SizedBox(width: 7),

                            // if (widget.order.)
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(237, 237, 237, 1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Container(
                              height: 30,
                              width: 1.5,
                              color: Color.fromRGBO(103, 121, 254, 1),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 18,
                              color: Color.fromRGBO(103, 121, 254, 1),
                            ),
                            SizedBox(width: 14),
                            Text(
                              widget.order.laundry!.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 9),
                            Icon(
                              Icons.sms_sharp,
                              color: Color.fromRGBO(103, 121, 254, 1),
                              size: 24,
                            ),
                            Spacer(),
                            Text('02:45 PM'),
                            SizedBox(width: 7),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(237, 237, 237, 1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.edit,
                                size: 16,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );

    // return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff)
    //         ? fromToWidgets
    //         : fromToWidgets.reversed.toList());
  }

  String _getOrderStatus() {
    switch (widget.order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return "${_i18n()["orderStatus"]["readyForPickup"]}";
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return "${_i18n()["orderStatus"]["pickupOtw"]}";
      case LaundryOrderStatus.PickedUpFromCustomer:
        return "${_i18n()["orderStatus"]["pickedUp"]}";
      case LaundryOrderStatus.AtLaundry:
        return "${_i18n()["orderStatus"]["atLaundry"]}";
      case LaundryOrderStatus.ReadyForDelivery:
        return "${_i18n()["orderStatus"]["readyForDelivery"]}";
      case LaundryOrderStatus.OtwPickupFromLaundry:
        return "${_i18n()["orderStatus"]["deliveryOtw"]}";
      case LaundryOrderStatus.Delivered:
        return "${_i18n()["orderStatus"]["delivered"]}";
      case LaundryOrderStatus.CancelledByAdmin:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case LaundryOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      default:
        return '';
    }
  }
}
