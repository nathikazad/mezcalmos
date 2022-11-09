import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
      OrderInfoCardState.Maximized.obs;

  RxBool isSettingPickUpTime = false.obs;
  RxBool isSettingDropoffTime = false.obs;
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
      child: Obx(
        () => AnimatedOrderInfoCard(
          // customer
          customerImage: widget.order.customer.image,
          subtitle: (_showFoodReadyTime())
              ? "${_i18n()["foodReady"]} ${widget.order.estimatedFoodReadyTime!.getEstimatedTime()}"
              : null,
          secondSubtitle: _getDeliveryTime(),
          customerName: widget.order.customer.name,
          enableExpand: (widget.order.inProcess()) ? _isTimesSetted() : true,
          customerTimeWidgets: _dateTimeSetter(DeliveryAction.DropOff, context),
          onCustomerMsgClick: () {
            if (widget.order.customerDropOffDriverChatId != null) {
              MezRouter.toNamed(
                getMessagesRoute(
                    orderType: OrderType.Restaurant,
                    chatId: widget.order.customerDropOffDriverChatId!,
                    orderId: widget.order.orderId,
                    recipientType: ParticipantType.Customer),
              );
            }
          },
          // landry
          serviceProviderImage: widget.order.restaurant.image,
          serviceProviderName: widget.order.restaurant.name,
          serviceProviderTimeWidgets:
              _dateTimeSetter(DeliveryAction.Pickup, context),
          onServiceMsgClick: () {
            if (widget.order.serviceProviderDropOffDriverChatId != null) {
              MezRouter.toNamed(
                getMessagesRoute(
                    orderType: OrderType.Restaurant,
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
      ),
    );
  }

  String? _getDeliveryTime() {
    if (widget.order.isScheduled()) {
      return "${_i18n()["dvTime"]}: ${widget.order.deliveryTime!.toLocal().toDayName()}, ${DateFormat("hh:mm a").format(widget.order.deliveryTime!.toLocal())}";
    }
    return null;
  }

  bool _isTimesSetted() {
    return widget.order.estimatedDropoffAtCustomerTime != null &&
        widget.order.estimatedPickupFromServiceProviderTime != null;
  }

// get order status readable title
  String _getOrderStatus() {
    switch (widget.order.status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case RestaurantOrderStatus.OrderReceieved:
        if (widget.order.isScheduled()) {
          return '${_i18n()["orderStatus"]["scheduled"]}';
        } else {
          return '${_i18n()["orderStatus"]["waiting"]}';
        }
      case RestaurantOrderStatus.PreparingOrder:
        return '${_i18n()["orderStatus"]["waiting"]}';

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

  bool _showFoodReadyTime() {
    return widget.order.estimatedFoodReadyTime != null &&
        (widget.order.status == RestaurantOrderStatus.OrderReceieved ||
            widget.order.status == RestaurantOrderStatus.PreparingOrder);
  }

// @here
  List<Widget> _dateTimeSetter(
      DeliveryAction deliveryAction, BuildContext context) {
    Future<DateTime?> _dateTimePicker({DateTime? initialDate}) async {
      final DateTime? pickedDate = await getDatePicker(
        context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: widget.order.estimatedFoodReadyTime ?? DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 3),
        ),
      );

      if (pickedDate != null) {
        final TimeOfDay? pickedTime = await getTimePicker(
          context,
          initialTime: TimeOfDay.fromDateTime(
            widget.order.estimatedFoodReadyTime?.toLocal() ?? DateTime.now(),
          ),
        );
        if (pickedTime != null) {
          final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
          if (_finalDt.isAfter(widget.order.estimatedFoodReadyTime?.toLocal() ??
              DateTime.now())) {
            return _finalDt;
          } else
            MezSnackbar('${_i18n()['oops']}', '${_i18n()['wrongTime']}');
        }
      }

      return null;
    }

    List<Widget> _getRightContainer(
      DateTime? dt, {
      required void Function(DateTime) onNewDateTimeSet,
      required RxBool isSettingTime,
    }) {
      if (dt != null) {
        return [
          Text(DateFormat('EE, hh:mm a').format(dt)),
          SizedBox(width: 7),
          InkWell(
            onTap: isSettingTime.value
                ? null
                : () async {
                    isSettingTime.value = true;
                    final DateTime? _dt =
                        await _dateTimePicker(initialDate: dt);
                    if (_dt != null)
                      onNewDateTimeSet(_dt);
                    else
                      isSettingTime.value = false;
                  },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: isSettingTime.value
                  ? null
                  : BoxDecoration(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      shape: BoxShape.circle,
                    ),
              child: Center(
                child: isSettingTime.value
                    ? Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircularProgressIndicator(
                          color: Colors.grey.shade600,
                          strokeWidth: 1.8,
                        ),
                      )
                    : Icon(
                        Icons.edit,
                        size: 15,
                        color: Colors.grey.shade600,
                      ),
              ),
            ),
          )
        ];
      } else {
        return [
          InkWell(
            onTap: isSettingTime.value
                ? null
                : () async {
                    isSettingTime.value = true;
                    final DateTime? _dt = await _dateTimePicker();
                    if (_dt != null)
                      onNewDateTimeSet(_dt);
                    else
                      isSettingTime.value = false;
                  },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: isSettingTime.value
                  ? null
                  : BoxDecoration(
                      color: Color.fromRGBO(226, 18, 51, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
              child: Center(
                child: isSettingTime.value
                    ? ThreeDotsLoading(dotsColor: Colors.black)
                    : Text(
                        '${_i18n()['set']} ${deliveryAction == DeliveryAction.DropOff ? "${_i18n()['dropoff']}" : "${_i18n()['pickup']}"} ${_i18n()['time']}',
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
        isSettingTime: deliveryAction == DeliveryAction.Pickup
            ? isSettingPickUpTime
            : isSettingDropoffTime,
        onNewDateTimeSet: (DateTime newDt) async {
          // DropOff
          if (deliveryAction == DeliveryAction.DropOff) {
            if (widget.order.estimatedPickupFromServiceProviderTime != null &&
                !widget.order.estimatedPickupFromServiceProviderTime!
                    .isBefore(newDt)) {
              MezSnackbar(
                "${_i18n()['oops']}",
                "${_i18n()['pickupTimeError']}",
              );
              return;
            }
            // PickUp
          } else {
            if (widget.order.estimatedDropoffAtCustomerTime != null &&
                !widget.order.estimatedDropoffAtCustomerTime!.isAfter(newDt)) {
              MezSnackbar(
                "${_i18n()['oops']}",
                "${_i18n()['pickupTimeError']}",
              );

              return;
            }
          }
          if (deliveryAction == DeliveryAction.Pickup) {
            isSettingPickUpTime.value = true;
          } else {
            isSettingDropoffTime.value = true;
          }
          // ignore: unawaited_futures
          Get.find<OrderController>()
              .setEstimatedTime(
            widget.order.orderId,
            newDt.toUtc(),
            DeliveryDriverType.DropOff,
            deliveryAction,
            OrderType.Restaurant,
          )
              .then((ServerResponse _resp) {
            mezDbgPrint("Responsoooooo ===> $_resp");
            if (_resp.success) {
              if (deliveryAction == DeliveryAction.Pickup)
                widget.order.estimatedPickupFromServiceProviderTime = newDt;
              else
                widget.order.estimatedDropoffAtCustomerTime = newDt;
            }
          }).whenComplete(() {
            if (deliveryAction == DeliveryAction.Pickup) {
              isSettingPickUpTime.value = false;
            } else {
              isSettingDropoffTime.value = false;
            }
          });
        },
      );
    }

    return [];
  }
}
