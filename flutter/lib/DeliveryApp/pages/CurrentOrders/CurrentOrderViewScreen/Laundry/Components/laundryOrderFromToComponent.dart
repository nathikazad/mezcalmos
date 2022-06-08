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
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"];

class LaundryOrderFromToComponent extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  /// inside the delivery driver order(laundry order) screen bottom card
  final OnOrderInfoCardStateChange? onCardStateChange;
  final LaundryOrder order;

  const LaundryOrderFromToComponent({
    Key? key,
    required this.order,
    this.onCardStateChange,
  }) : super(key: key);

  @override
  State<LaundryOrderFromToComponent> createState() =>
      _LaundryOrderFromToComponentState();
}

class _LaundryOrderFromToComponentState
    extends State<LaundryOrderFromToComponent> {
  final Rx<OrderInfoCardState> orderInfoCardState =
      OrderInfoCardState.Minimized.obs;

  ServiceInfo? laundry;

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
    return Container(
      padding: EdgeInsets.all(8),
      child: AnimatedOrderInfoCard(
        // customer
        customerImage: widget.order.customer.image,
        customerName: widget.order.customer.name,
        customerTimeWidgets: _dateTimeSetter(DeliveryAction.Pickup),
        onCustomerMsgClick: () {
          if (widget.order.getCustomerDriverChatId() != null) {
            Get.toNamed<void>(
              getMessagesRoute(
                  chatId: widget.order.getCustomerDriverChatId()!,
                  orderId: widget.order.orderId,
                  recipientType: ParticipantType.Customer),
            );
          }
        },
        // landry
        serviceProviderImage: widget.order.laundry!.image,
        serviceProviderName: widget.order.laundry!.name,
        serviceProviderTimeWidgets: _dateTimeSetter(DeliveryAction.DropOff),
        onServiceMsgClick: () {
          if (widget.order.getServiceDriverChatId() != null) {
            Get.toNamed(getMessagesRoute(
                chatId: widget.order.getServiceDriverChatId()!,
                orderId: widget.order.orderId,
                recipientType: ParticipantType.DeliveryAdmin));
          }
        },
        // order
        formattedOrderStatus: _getOrderStatus(),
        order: widget.order,
        // card Settings
        initialCardState: orderInfoCardState.value,
        onCardStateChange: (OrderInfoCardState nwState) {
          orderInfoCardState.value = nwState;
          widget.onCardStateChange?.call(nwState);
        },
      ),
    );
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
        return "Laundry done, picking up ..";
      case LaundryOrderStatus.PickedUpFromLaundry:
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

    if (widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return _getRightContainer(
        deliveryAction == DeliveryAction.Pickup
            ? widget.order.estimatedPickupFromCustomerTime?.toLocal()
            : widget.order.estimatedDropoffAtServiceProviderTime?.toLocal(),
        onNewDateTimeSet: (DateTime newDt) async {
          final ServerResponse _resp =
              await Get.find<OrderController>().setEstimatedTime(
            widget.order.orderId,
            newDt,
            DeliveryDriverType.Pickup,
            deliveryAction,
            OrderType.Laundry,
          );

          if (_resp.success) {
            if (deliveryAction == DeliveryAction.Pickup)
              widget.order.estimatedPickupFromCustomerTime = newDt;
            else
              widget.order.estimatedDropoffAtServiceProviderTime = newDt;

            setState(() {});
          }
        },
      );
    } else if (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff) {
      mezDbgPrint(" PHASE ==> LaundryOrderPhase.Dropoff");
      mezDbgPrint(" ACTION ==> $deliveryAction");
      return _getRightContainer(
        deliveryAction == DeliveryAction.Pickup
            ? widget.order.estimatedPickupFromServiceProviderTime?.toLocal()
            : widget.order.estimatedDropoffAtCustomerTime?.toLocal(),
        onNewDateTimeSet: (DateTime newDt) async {
          mezDbgPrint("newTime ==> $newDt");

          final ServerResponse _resp =
              await Get.find<OrderController>().setEstimatedTime(
            widget.order.orderId,
            newDt,
            DeliveryDriverType.DropOff,
            deliveryAction,
            OrderType.Laundry,
          );

          mezDbgPrint("resp::success ===> ${_resp.data}");

          if (_resp.success) {
            if (deliveryAction == DeliveryAction.Pickup)
              widget.order.estimatedPickupFromServiceProviderTime = newDt;
            else
              widget.order.estimatedDropoffAtCustomerTime = newDt;

            setState(() {});
          }
        },
      );
    } else
      return [];
  }
}
