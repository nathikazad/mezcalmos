import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class RestaurantOrderFromToComponent extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  const RestaurantOrderFromToComponent({
    Key? key,
    required this.order,
    this.onCardStateChange,
  }) : super(key: key);
  final OnOrderInfoCardStateChange? onCardStateChange;
  final RestaurantOrder order;

  @override
  State<RestaurantOrderFromToComponent> createState() =>
      _RestaurantOrderFromToComponentState();
}

class _RestaurantOrderFromToComponentState
    extends State<RestaurantOrderFromToComponent> {
  ServiceInfo? restaurant;
  final Rx<OrderInfoCardState> orderInfoCardState =
      OrderInfoCardState.Minimized.obs;
  @override
  void initState() {
    super.initState();
  }

  void getRestaurant() {
    restaurant = widget.order.restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: AnimatedOrderInfoCard(
        // customer
        customerImage: widget.order.customer.image,
        customerName: widget.order.customer.name,
        customerTimeWidgets: _dateTimeSetter(DeliveryAction.DropOff),
        onCustomerMsgClick: () {
          if (widget.order.customerDropOffDriverChatId != null) {
            Get.toNamed(
              getMessagesRoute(
                  chatId: widget.order.customerDropOffDriverChatId!,
                  orderId: widget.order.orderId,
                  recipientType: ParticipantType.Customer),
            );
          }
        },
        // landry
        serviceProviderImage: widget.order.restaurant.image,
        serviceProviderName: widget.order.restaurant.name,
        serviceProviderTimeWidgets: _dateTimeSetter(DeliveryAction.Pickup),
        onServiceMsgClick: () {
          if (widget.order.serviceProviderDropOffDriverChatId != null) {
            Get.toNamed(
              getMessagesRoute(
                  chatId: widget.order.serviceProviderDropOffDriverChatId!,
                  orderId: widget.order.orderId,
                  recipientType: ParticipantType.DeliveryAdmin),
            );
          }
        },
        // order
        formattedOrderStatus: _getOrderStatus(),
        order: widget.order,
        // card Settings
        isCustomerRowFirst: false,
        showMsgIconInOneLine: !widget.order.inProcess(),
        initialCardState: orderInfoCardState.value,
        onCardStateChange: (OrderInfoCardState nwState) {
          orderInfoCardState.value = nwState;
          widget.onCardStateChange?.call(nwState);
        },
      ),
    );
  }

// get order status readable title
  String _getOrderStatus() {
    switch (widget.order.status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case RestaurantOrderStatus.OrderReceieved:
        return '${_i18n()["orderStatus"]["waiting"]}';
      case RestaurantOrderStatus.PreparingOrder:
        return '${_i18n()["orderStatus"]["preparing"]}';
      case RestaurantOrderStatus.ReadyForPickup:
        return '${_i18n()["orderStatus"]["readyForPickup"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["orderStatus"]["deliveryOtw"]}';
      case RestaurantOrderStatus.Delivered:
        return '${_i18n()["orderStatus"]["delivered"]} ';
      default:
        return '';
    }
  }

  bool isInPickUpPhase() {
    return widget.order.status == RestaurantOrderStatus.OrderReceieved ||
        widget.order.status == RestaurantOrderStatus.ReadyForPickup ||
        widget.order.status == RestaurantOrderStatus.PreparingOrder;
  }

  List<Widget> _dateTimeSetter(DeliveryAction deliveryAction) {
    Future<DateTime?> _dateTimePicker() async {
      final DateTime? pickedDate = await getDatePicker(
        context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(hours: 12),
        ),
      );

      if (pickedDate != null) {
        final TimeOfDay? pickedTime = await getTimePicker(
          context,
          initialTime: TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
        );
        if (pickedTime != null) {
          final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
          if (_finalDt.isAfter(DateTime.now())) {
            return _finalDt;
          } else
            MezSnackbar('Oops', 'You picked a wrong time!');
        }
      }

      return null;
    }

    List<Widget> _getRightContainer(DateTime? dt,
        {required void Function(DateTime) onNewDateTimeSet}) {
      if (dt != null) {
        return [
          Text(DateFormat('hh:mm a').format(dt)),
          SizedBox(width: 7),
          InkWell(
            onTap: () async {
              final DateTime? _dt = await _dateTimePicker();
              if (_dt != null) onNewDateTimeSet(_dt);
            },
            child: Container(
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
          )
        ];
      } else {
        return [
          InkWell(
            onTap: () async {
              final DateTime? _dt = await _dateTimePicker();
              if (_dt != null) onNewDateTimeSet(_dt);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(226, 18, 51, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  'Set ${deliveryAction == DeliveryAction.DropOff ? "dropoff" : "pickup"} time',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          )
        ];
      }
    }

    if (widget.order.inProcess()) {
      return _getRightContainer(
        deliveryAction == DeliveryAction.Pickup
            ? widget.order.estimatedPickupFromServiceProviderTime?.toLocal()
            : widget.order.estimatedDropoffAtCustomerTime?.toLocal(),
        onNewDateTimeSet: (DateTime newDt) async {
          // DropOff
          if (deliveryAction == DeliveryAction.DropOff) {
            if (widget.order.estimatedPickupFromServiceProviderTime != null &&
                !widget.order.estimatedPickupFromServiceProviderTime!
                    .isBefore(newDt)) {
              MezSnackbar(
                  "Oops", "The Pickup time should be before the dropoff time.");
            }
            // PickUp
          } else {
            if (widget.order.estimatedDropoffAtCustomerTime != null &&
                !widget.order.estimatedDropoffAtCustomerTime!.isAfter(newDt)) {
              MezSnackbar(
                  "Oops", "The Pickup time should be before the dropoff time.");
            }
          }
          final ServerResponse _resp =
              await Get.find<OrderController>().setEstimatedTime(
            widget.order.orderId,
            newDt.toUtc(),
            DeliveryDriverType.DropOff,
            deliveryAction,
            OrderType.Restaurant,
          );
          mezDbgPrint("Responsoooooo ===> $_resp");
          if (_resp.success) {
            if (deliveryAction == DeliveryAction.Pickup)
              widget.order.estimatedPickupFromServiceProviderTime = newDt;
            else
              widget.order.estimatedDropoffAtCustomerTime = newDt;

            setState(() {});
          }
        },
      );
    }

    return [];
  }
}
