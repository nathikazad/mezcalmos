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
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

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
      OrderInfoCardState.Maximized.obs;

  ServiceInfo? laundry;
  // This will lock the setEstimatedTime button click and show loading instead.
  RxBool isSettingPickUpTime = false.obs;
  RxBool isSettingDropoffTime = false.obs;
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
      child: Obx(
        () => AnimatedOrderInfoCard(
          // customer
          customerImage: widget.order.customer.image,
          customerName: widget.order.customer.name,
          enableExpand: (widget.order.inProcess()) ? _isTimesSetted() : true,
          customerTimeWidgets: _dateTimeSetter(
            (widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup)
                ? DeliveryAction.Pickup
                : DeliveryAction.DropOff,
            context,
          ),
          onCustomerMsgClick: () {
            if (widget.order.getCustomerDriverChatId() != null) {
              Get.toNamed<void>(
                getMessagesRoute(
                    orderType: OrderType.Laundry,
                    chatId: widget.order.getCustomerDriverChatId()!,
                    orderId: widget.order.orderId,
                    recipientType: ParticipantType.Customer),
              );
            }
          },
          // landry
          serviceProviderImage: widget.order.laundry!.image,
          serviceProviderName: widget.order.laundry!.name,
          serviceProviderTimeWidgets: _dateTimeSetter(
            (widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup)
                ? DeliveryAction.DropOff
                : DeliveryAction.Pickup,
            context,
          ),
          onServiceMsgClick: () {
            if (widget.order.getServiceDriverChatId() != null) {
              Get.toNamed<void>(getMessagesRoute(
                  orderType: OrderType.Laundry,
                  chatId: widget.order.getServiceDriverChatId()!,
                  orderId: widget.order.orderId,
                  recipientType: ParticipantType.DeliveryAdmin));
            }
          },
          // order
          formattedOrderStatus: _getOrderStatus(),
          subtitle: getSubTitle(),
          order: widget.order,
          // card Settings
          isCustomerRowFirst:
              widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup,
          showMsgIconInOneLine:
              widget.order.getCurrentPhase() == LaundryOrderPhase.Neither,
          initialCardState: orderInfoCardState.value,
          onCardStateChange: (OrderInfoCardState nwState) {
            orderInfoCardState.value = nwState;
            widget.onCardStateChange?.call(nwState);
          },
        ),
      ),
    );
  }

  bool _isTimesSetted() {
    if (widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return widget.order.estimatedPickupFromCustomerTime != null &&
          widget.order.estimatedDropoffAtServiceProviderTime != null;
    } else if (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff) {
      return widget.order.estimatedDropoffAtCustomerTime != null &&
          widget.order.estimatedPickupFromServiceProviderTime != null;
    } else
      return false;
  }

  String? getSubTitle() {
    String _getFormattedTime(DateTime dt) {
      final Duration _duration =
          DateTime.now().difference(widget.order.estimatedLaundryReadyTime!);

      if (_duration.inMinutes > 59) {
        return "1 hour +";
      } else if (_duration.inMinutes < 1) {
        return "${_duration.inSeconds.abs()} seconds";
      } else {
        return "${_duration.inMinutes.abs()} minutes";
      }
    }

    return widget.order.status == LaundryOrderStatus.AtLaundry
        ? (widget.order.estimatedLaundryReadyTime != null
            ? "Estimated ready time:\n${widget.order.estimatedLaundryReadyTime!.getEstimatedTime()}"
            : null)
        : null;
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

  List<Widget> _dateTimeSetter(
      DeliveryAction deliveryAction, BuildContext context) {
    Future<DateTime?> _dateTimePicker({DateTime? initialDate}) async {
      mezDbgPrint("called :: _dateTimeSetter ");
      final DateTime? pickedDate = await getDatePicker(
        context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 3),
        ),
      );

      if (pickedDate != null) {
        final TimeOfDay? pickedTime = await getTimePicker(
          context,
          initialTime: TimeOfDay.fromDateTime(
            initialDate ?? DateTime.now(),
          ),
        );
        if (pickedTime != null) {
          final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
          if (_finalDt.isAfter(DateTime.now())) {
            return _finalDt;
          } else {
            MezSnackbar('${_i18n()["oops"]}', '${_i18n()["wrongTime"]}');
            _controllLoadingAnimation(
              shouldStartAnimation: false,
              action: deliveryAction,
            );
          }
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
              padding: EdgeInsets.all(4),
              decoration: isSettingTime.value
                  ? null
                  : BoxDecoration(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      shape: BoxShape.circle,
                    ),
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
                      size: 16,
                      color: Colors.grey.shade600,
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
                        '${_i18n()["set"]} ${deliveryAction == DeliveryAction.DropOff ? "${_i18n()["dropoff"]}" : "${_i18n()["pickup"]}"} ${_i18n()["time"]}',
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
        isSettingTime: deliveryAction == DeliveryAction.Pickup
            ? isSettingPickUpTime
            : isSettingDropoffTime,
        onNewDateTimeSet: (DateTime newDt) async {
          switch (deliveryAction) {
            case DeliveryAction.Pickup:
              if (widget.order.estimatedDropoffAtServiceProviderTime != null &&
                  widget.order.estimatedDropoffAtServiceProviderTime!
                      .isBefore(newDt)) {
                MezSnackbar(
                  "Oops",
                  "Pickup time should be before dropOff time!",
                );
                _controllLoadingAnimation(
                  shouldStartAnimation: false,
                  action: deliveryAction,
                );
                return;
              }

              break;
            case DeliveryAction.DropOff:
              if (widget.order.estimatedPickupFromCustomerTime != null &&
                  widget.order.estimatedPickupFromCustomerTime!
                      .isAfter(newDt)) {
                MezSnackbar(
                  "Oops",
                  "Pickup time should be before dropOff time!",
                );
                _controllLoadingAnimation(
                  shouldStartAnimation: false,
                  action: deliveryAction,
                );
                return;
              }

              break;
          }

          _controllLoadingAnimation(
            shouldStartAnimation: true,
            action: deliveryAction,
          );

          // ignore: unawaited_futures
          Get.find<OrderController>()
              .setEstimatedTime(
            widget.order.orderId,
            newDt,
            DeliveryDriverType.Pickup,
            deliveryAction,
            OrderType.Laundry,
          )
              .then((ServerResponse _resp) {
            mezDbgPrint("resp::success ===> ${_resp.data}");

            if (_resp.success) {
              if (deliveryAction == DeliveryAction.Pickup)
                widget.order.estimatedPickupFromCustomerTime = newDt;
              else
                widget.order.estimatedDropoffAtServiceProviderTime = newDt;
            }
            setState(() {});
          }).whenComplete(() {
            _controllLoadingAnimation(
              shouldStartAnimation: false,
              action: deliveryAction,
            );
          });
        },
      );
    } else if (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff) {
      mezDbgPrint(" PHASE ==> LaundryOrderPhase.Dropoff");
      mezDbgPrint(" ACTION ==> $deliveryAction");

      return _getRightContainer(
        deliveryAction == DeliveryAction.Pickup
            ? widget.order.estimatedPickupFromServiceProviderTime?.toLocal()
            : widget.order.estimatedDropoffAtCustomerTime?.toLocal(),
        isSettingTime: deliveryAction == DeliveryAction.Pickup
            ? isSettingPickUpTime
            : isSettingDropoffTime,
        onNewDateTimeSet: (DateTime newDt) async {
          switch (deliveryAction) {
            case DeliveryAction.Pickup:
              if (widget.order.estimatedDropoffAtCustomerTime != null &&
                  widget.order.estimatedDropoffAtCustomerTime!
                      .isBefore(newDt)) {
                MezSnackbar(
                  "Oops",
                  "Pickup time should be before dropOff time!",
                );
                _controllLoadingAnimation(
                  shouldStartAnimation: false,
                  action: deliveryAction,
                );
                return;
              }
              break;
            case DeliveryAction.DropOff:
              if (widget.order.estimatedPickupFromServiceProviderTime != null &&
                  widget.order.estimatedPickupFromServiceProviderTime!
                      .isAfter(newDt)) {
                MezSnackbar(
                  "Oops",
                  "Pickup time should be before dropOff time!",
                );
                _controllLoadingAnimation(
                  shouldStartAnimation: false,
                  action: deliveryAction,
                );
                return;
              }
              break;
          }

          _controllLoadingAnimation(
            shouldStartAnimation: true,
            action: deliveryAction,
          );
          // ignore: unawaited_futures
          Get.find<OrderController>()
              .setEstimatedTime(
            widget.order.orderId,
            newDt,
            DeliveryDriverType.DropOff,
            deliveryAction,
            OrderType.Laundry,
          )
              .then((ServerResponse _resp) {
            mezDbgPrint("resp::success ===> ${_resp.data}");

            if (_resp.success) {
              if (deliveryAction == DeliveryAction.Pickup)
                widget.order.estimatedPickupFromServiceProviderTime = newDt;
              else
                widget.order.estimatedDropoffAtCustomerTime = newDt;
              setState(() {});
            }
          }).whenComplete(() {
            _controllLoadingAnimation(
              shouldStartAnimation: false,
              action: deliveryAction,
            );
          });
        },
      );
    } else
      return [];
  }

  void _controllLoadingAnimation(
      {required bool shouldStartAnimation, required DeliveryAction action}) {
    if (action == DeliveryAction.DropOff) {
      isSettingDropoffTime.value = shouldStartAnimation;
    } else {
      isSettingPickUpTime.value = shouldStartAnimation;
    }
  }
}
