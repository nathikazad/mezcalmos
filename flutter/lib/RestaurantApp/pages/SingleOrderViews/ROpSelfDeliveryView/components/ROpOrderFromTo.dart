import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/RestaurantApp/pages/SingleOrderViews/ROpSelfDeliveryView/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class ROpOrderFromTo extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  const ROpOrderFromTo({
    Key? key,
    required this.order,
    this.onCardStateChange,
  }) : super(key: key);
  final OnOrderInfoCardStateChange? onCardStateChange;
  final RestaurantOrder order;

  @override
  State<ROpOrderFromTo> createState() => _ROpOrderFromToState();
}

class _ROpOrderFromToState extends State<ROpOrderFromTo> {
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
        () => ROpAnimatedOrderCard(
          // customer
          customerImage: widget.order.customer.image,

          customerName: widget.order.customer.name,
          enableExpand: (widget.order.inProcess()) ? _isTimesSetted() : true,
          customerTimeWidgets: _dateTimeSetter(DeliveryAction.DropOff, context),
          onCustomerMsgClick: () {
            BaseMessagingScreen.navigate(chatId: widget.order.orderId);
          },
          // landry
          serviceProviderImage: widget.order.restaurant.image,
          serviceProviderName: widget.order.restaurant.name,

          onServiceMsgClick: () {},
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
    return widget.order.selfDeliveryDetails?.estDeliveryTime != null;
  }

// get order status readable title
  String _getOrderStatus() {
    switch (widget.order.status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case RestaurantOrderStatus.OrderReceived:
        if (widget.order.isScheduled()) {
          return '${_i18n()["orderStatus"]["scheduled"]}';
        } else {
          return '${_i18n()["orderStatus"]["waiting"]}';
        }
      case RestaurantOrderStatus.Preparing:
        return '${_i18n()["orderStatus"]["waiting"]}';

      case RestaurantOrderStatus.Ready:
        return '${_i18n()["orderStatus"]["justReady"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["orderStatus"]["deliveryOtw"]}';
      case RestaurantOrderStatus.Delivered:
        return '${_i18n()["orderStatus"]["delivered"]} ';
      default:
        return '';
    }
  }

  bool isInPickUpPhase() {
    return widget.order.status == RestaurantOrderStatus.OrderReceived ||
        widget.order.status == RestaurantOrderStatus.Ready ||
        widget.order.status == RestaurantOrderStatus.Preparing;
  }

  bool _showFoodReadyTime() {
    return widget.order.estimatedFoodReadyTime != null &&
        (widget.order.status == RestaurantOrderStatus.OrderReceived ||
            widget.order.status == RestaurantOrderStatus.Preparing);
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
        widget.order.selfDeliveryDetails?.estDeliveryTime?.toLocal(),
        isSettingTime: isSettingDropoffTime,
        onNewDateTimeSet: (DateTime newDt) async {
          // DropOff

          if (widget.order.selfDeliveryDetails?.estDeliveryTime != null &&
              !widget.order.selfDeliveryDetails!.estDeliveryTime!
                  .isAfter(newDt)) {
            MezSnackbar(
              "${_i18n()['oops']}",
              "${_i18n()['pickupTimeError']}",
            );

            return;
          }

          isSettingDropoffTime.value = true;

          // ignore: unawaited_futures
          // TODO handle @m66are handle commented part

          // Get.find<ROpOrderController>()
          //     .setEstimatedSelfDeliveryTime(
          //   widget.order,
          //   newDt.toUtc(),
          // )
          //     .whenComplete(() {
          //   isSettingDropoffTime.value = false;
          // });
        },
      );
    }

    return [];
  }
}
