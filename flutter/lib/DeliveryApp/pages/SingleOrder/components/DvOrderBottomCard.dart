import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/components/AnimatedOrderInfoCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/controllers/DvOrderViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class DvOrderBottomCard extends StatefulWidget {
  /// shows order from info (service provider name image and adress) and destination info  (customer name image and adress)
  const DvOrderBottomCard({
    Key? key,
    required this.viewcontroller,
    this.onCardStateChange,
  }) : super(key: key);
  final OnOrderInfoCardStateChange? onCardStateChange;
  final DvOrderViewcontroller viewcontroller;

  @override
  State<DvOrderBottomCard> createState() => _DvOrderBottomCardState();
}

class _DvOrderBottomCardState extends State<DvOrderBottomCard> {
  final Rx<OrderInfoCardState> orderInfoCardState =
      OrderInfoCardState.Maximized.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Obx(
        () => AnimatedOrderInfoCard(
          // customer
          customerImage: widget.viewcontroller.order.customerInfo.image,
          subtitle: (_showFoodReadyTime())
              ? "${_i18n()["packageReady"]} ${widget.viewcontroller.order.estimatedPackageReadyTime!.getEstimatedTime()}"
              : null,
          secondSubtitle: _getDeliveryTime(),
          customerName: widget.viewcontroller.order.customerInfo.name,
          enableExpand: (widget.viewcontroller.order.inProcess())
              ? _isTimesSetted()
              : true,
          customerTimeWidget: widget.viewcontroller.inPickupPhase
              ? _pickUpTimeSetter()
              : _dropOffTimeSetter(),

          onCustomerMsgClick: () {
            MezRouter.toNamed(
              getMessagesRoute(
                  orderType: widget.viewcontroller.order.orderType,
                  chatId: widget.viewcontroller.order.chatWithCustomerId,
                  orderId: widget.viewcontroller.order.id,
                  recipientType: ParticipantType.Customer),
            );
          },
          // landry
          serviceProviderImage: widget.viewcontroller.order.serviceInfo.image,
          serviceProviderName: widget.viewcontroller.order.serviceInfo.name,
          serviceProviderTimeWidget: widget.viewcontroller.inPickupPhase
              ? _dropOffTimeSetter()
              : _pickUpTimeSetter(),
          onServiceMsgClick: () {
            if (widget.viewcontroller.order.chatWithServiceProviderId != null) {
              MezRouter.toNamed(
                getMessagesRoute(
                    orderType: widget.viewcontroller.order.orderType,
                    chatId:
                        widget.viewcontroller.order.chatWithServiceProviderId!,
                    orderId: widget.viewcontroller.order.id,
                    recipientType: ParticipantType.DeliveryAdmin),
              );
            }
          },
          // order
          formattedOrderStatus: _getOrderStatus(),

          order: widget.viewcontroller.order,

          // card Settings
          isCustomerRowFirst: widget.viewcontroller.inPickupPhase,
          showMsgIconInOneLine: !widget.viewcontroller.order.inProcess(),
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
    if (widget.viewcontroller.order.isScheduled()) {
      // todo @m66are fix this
      //  return "${_i18n()["dvTime"]}: ${widget.viewcontroller.order.deliveryTime!.toLocal().toDayName()}, ${DateFormat("hh:mm a").format(widget.viewcontroller.order.deliveryTime!.toLocal())}";
    }
    return null;
  }

  bool _isTimesSetted() {
    return widget.viewcontroller.order.estimatedArrivalAtPickupTime != null &&
        widget.viewcontroller.order.estimatedArrivalAtDropoffTime != null;
  }

// get order status readable title
  String _getOrderStatus() {
    switch (widget.viewcontroller.order.status) {
      case DeliveryOrderStatus.CancelledByCustomer:
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case DeliveryOrderStatus.OrderReceived:
        if (widget.viewcontroller.order.isScheduled()) {
          return '${_i18n()["orderStatus"]["scheduled"]}';
        } else {
          return '${_i18n()["orderStatus"]["waiting"]}';
        }

      case DeliveryOrderStatus.PackageReady:
        return '${_i18n()["orderStatus"]["justReady"]}';
      case DeliveryOrderStatus.AtPickup:
        return 'At pickup';
      case DeliveryOrderStatus.AtDropoff:
        return 'At dropoff';
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return '${_i18n()["orderStatus"]["deliveryOtw"]}';
      case DeliveryOrderStatus.OnTheWayToPickup:
        return '${_i18n()["orderStatus"]["pickupOtw"]}';
      case DeliveryOrderStatus.Delivered:
        return '${_i18n()["orderStatus"]["delivered"]} ';
      default:
        return '';
    }
  }

  bool _showFoodReadyTime() {
    return widget.viewcontroller.order.estimatedPackageReadyTime != null &&
        (widget.viewcontroller.order.status ==
                DeliveryOrderStatus.OrderReceived ||
            widget.viewcontroller.order.status ==
                DeliveryOrderStatus.PackageReady);
  }

  Widget _pickUpTimeSetter() {
    return (widget.viewcontroller.pickuSetted)
        ? Row(
            children: [
              Text(DateFormat('EE, hh:mm a')
                  .format(widget.viewcontroller.pickupTime!)),
              const SizedBox(
                width: 5,
              ),
              MezIconButton(
                onTap: () async {
                  mezDbgPrint("Clicked ");
                  DateTime? newTime = await _pickDateAndTime(
                      context: context,
                      firstDate: widget
                          .viewcontroller.order.estimatedPackageReadyTime);
                  if (newTime != null) {
                    await widget.viewcontroller.setPickupTime(newTime);
                  }
                },
                icon: Icons.edit_rounded,
                padding: EdgeInsets.all(3),
                iconSize: 20,
              )
            ],
          )
        : _pickupTimeSetButton();
  }

  Widget _dropOffTimeSetter() {
    return (widget.viewcontroller.dropoffSetted)
        ? Row(
            children: [
              Text(DateFormat('EE, hh:mm a')
                  .format(widget.viewcontroller.dropoffTime!)),
              const SizedBox(
                width: 5,
              ),
              MezIconButton(
                onTap: () async {
                  mezDbgPrint("Clicked ");
                  mezDbgPrint(widget.viewcontroller.inPickupPhase);
                  if (widget.viewcontroller.pickuSetted) {
                    DateTime? newTime = await _pickDateAndTime(
                        context: context,
                        firstDate: widget
                            .viewcontroller.order.estimatedArrivalAtPickupTime);
                    if (newTime != null) {
                      await widget.viewcontroller.setDropoffTime(newTime);
                    }
                  } else {
                    showErrorSnackBar(
                        errorTitle: "No pick up time",
                        errorText: "Please set pick up time first");
                  }
                },
                icon: Icons.edit_rounded,
                padding: EdgeInsets.all(3),
                iconSize: 20,
              )
            ],
          )
        : _dropOffTimeSetButton();
  }

  InkWell _dropOffTimeSetButton() {
    return InkWell(
      onTap: () async {
        mezDbgPrint("Clicked");
        mezDbgPrint(widget.viewcontroller.pickuSetted);
        if (widget.viewcontroller.pickuSetted) {
          DateTime? newTime = await _pickDateAndTime(
              context: context,
              initalDate: widget.viewcontroller.pickupTime?.toLocal(),
              firstDate: widget.viewcontroller.pickupTime?.toLocal());
          if (newTime != null) {
            await widget.viewcontroller.setDropoffTime(newTime);
          }
        } else {
          mezDbgPrint("Pick up not setted");

          showErrorSnackBar(
              errorTitle: "No pick up time",
              errorText: "Please set pick up time first");
        }
      },
      borderRadius: BorderRadius.circular(5),
      child: Ink(
        decoration: BoxDecoration(
            color: (widget.viewcontroller.isSettingDropoffTime.isTrue)
                ? Colors.transparent
                : secondaryLightBlueColor,
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(5),
        child: (widget.viewcontroller.isSettingDropoffTime.isTrue)
            ? CircularProgressIndicator()
            : Text(
                "${_i18n()['set']} ${_i18n()['dropoff']} ${_i18n()['time']}",
                style: Get.textTheme.bodyMedium?.copyWith(
                    color: primaryBlueColor, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  InkWell _pickupTimeSetButton() {
    return InkWell(
      onTap: () async {
        DateTime? newTime = await _pickDateAndTime(
            context: context,
            firstDate:
                widget.viewcontroller.order.estimatedArrivalAtPickupTime);
        if (newTime != null) {
          await widget.viewcontroller.setPickupTime(newTime);
        }
      },
      borderRadius: BorderRadius.circular(5),
      child: Ink(
        decoration: BoxDecoration(
            color: (widget.viewcontroller.isSettingPickUpTime.isTrue)
                ? Colors.transparent
                : secondaryLightBlueColor,
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(5),
        child: (widget.viewcontroller.isSettingPickUpTime.isTrue)
            ? CircularProgressIndicator()
            : Text(
                "${_i18n()['set']} ${_i18n()['pickup']} ${_i18n()['time']}",
                style: Get.textTheme.bodyMedium?.copyWith(
                    color: primaryBlueColor, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

Future<DateTime?> _pickDateAndTime({
  required BuildContext context,
  DateTime? initalDate,
  DateTime? firstDate,
}) async {
  // get date
  final DateTime? pickedDate = await getDatePicker(
    context,
    initialDate: initalDate ?? DateTime.now().toLocal(),
    firstDate: firstDate ?? DateTime.now().toLocal(),
    lastDate: DateTime.now().add(
      Duration(days: 3),
    ),
  );
// get time
  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await getTimePicker(
      context,
      initialTime: TimeOfDay.fromDateTime(
        firstDate?.toLocal() ?? DateTime.now().toLocal(),
      ),
    );
    // combine date and time and validate then return
    if (pickedTime != null) {
      final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
      if (_finalDt.isAfter(firstDate?.toLocal() ?? DateTime.now().toLocal())) {
        return _finalDt;
      } else
        showErrorSnackBar(
            errorTitle: '${_i18n()['oops']}',
            errorText: '${_i18n()['wrongTime']}');
    }
  }
  return null;
}

// // @here
//   List<Widget> _dateTimeSetter(
//       DeliveryDirection deliveryAction, BuildContext context) {
//     Future<DateTime?> _dateTimePicker({DateTime? initialDate}) async {
//       final DateTime? pickedDate = await getDatePicker(
//         context,
//         initialDate: initialDate ?? DateTime.now(),
//         firstDate: widget.viewcontroller.order.estimatedPackageReadyTime ?? DateTime.now(),
//         lastDate: DateTime.now().add(
//           Duration(days: 3),
//         ),
//       );

//       if (pickedDate != null) {
//         final TimeOfDay? pickedTime = await getTimePicker(
//           context,
//           initialTime: TimeOfDay.fromDateTime(
//             widget.viewcontroller.order.estimatedPackageReadyTime?.toLocal() ?? DateTime.now(),
//           ),
//         );
//         if (pickedTime != null) {
//           final DateTime _finalDt = pickedDate.copyWithTimeOfDay(pickedTime);
//           if (_finalDt.isAfter(
//               widget.viewcontroller.order.estimatedPackageReadyTime?.toLocal() ??
//                   DateTime.now())) {
//             return _finalDt;
//           } else
//             MezSnackbar('${_i18n()['oops']}', '${_i18n()['wrongTime']}');
//         }
//       }

//       return null;
//     }

//     List<Widget> _getRightContainer(
//       DateTime? dt, {
//       required void Function(DateTime) onNewDateTimeSet,
//       required RxBool isSettingTime,
//     }) {
//       if (dt != null) {
//         return [
//           Text(DateFormat('EE, hh:mm a').format(dt)),
//           SizedBox(width: 7),
//           InkWell(
//             onTap: isSettingTime.value
//                 ? null
//                 : () async {
//                     isSettingTime.value = true;
//                     final DateTime? _dt =
//                         await _dateTimePicker(initialDate: dt);
//                     if (_dt != null)
//                       onNewDateTimeSet(_dt);
//                     else
//                       isSettingTime.value = false;
//                   },
//             child: Container(
//               padding: const EdgeInsets.all(4),
//               decoration: isSettingTime.value
//                   ? null
//                   : BoxDecoration(
//                       color: Color.fromRGBO(237, 237, 237, 1),
//                       shape: BoxShape.circle,
//                     ),
//               child: Center(
//                 child: isSettingTime.value
//                     ? Container(
//                         height: 16,
//                         width: 16,
//                         decoration: BoxDecoration(shape: BoxShape.circle),
//                         child: CircularProgressIndicator(
//                           color: Colors.grey.shade600,
//                           strokeWidth: 1.8,
//                         ),
//                       )
//                     : Icon(
//                         Icons.edit,
//                         size: 15,
//                         color: Colors.grey.shade600,
//                       ),
//               ),
//             ),
//           )
//         ];
//       } else {
//         return [
//           InkWell(
//             onTap: isSettingTime.value
//                 ? null
//                 : () async {
//                     isSettingTime.value = true;
//                     final DateTime? _dt = await _dateTimePicker();
//                     if (_dt != null)
//                       onNewDateTimeSet(_dt);
//                     else
//                       isSettingTime.value = false;
//                   },
//             child: Container(
//               padding: EdgeInsets.all(5),
//               decoration: isSettingTime.value
//                   ? null
//                   : BoxDecoration(
//                       color: Color.fromRGBO(226, 18, 51, 1),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//               child: Center(
//                 child: isSettingTime.value
//                     ? ThreeDotsLoading(dotsColor: Colors.black)
//                     : Text(
//                         '${_i18n()['set']} ${deliveryAction == DeliveryAction.DropOff ? "${_i18n()['dropoff']}" : "${_i18n()['pickup']}"} ${_i18n()['time']}',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 13,
//                         ),
//                       ),
//               ),
//             ),
//           )
//         ];
//       }
//     }

//     if (widget.viewcontroller.order.inProcess()) {
//       return _getRightContainer(
//         deliveryAction == DeliveryDirection.To_customer
//             ? widget.viewcontroller.order.estimatedArrivalAtPickupTime?.toLocal()
//             : widget.viewcontroller.order.estimatedArrivalAtDropoffTime?.toLocal(),
//         isSettingTime: deliveryAction == DeliveryDirection.To_customer
//             ? isSettingPickUpTime
//             : isSettingDropoffTime,
//         onNewDateTimeSet: (DateTime newDt) async {
//           // DropOff
//           if (deliveryAction == DeliveryDirection.To_customer) {
//             if (widget.viewcontroller.order.estimatedArrivalAtPickupTime != null &&
//                 !widget.viewcontroller.order.estimatedArrivalAtPickupTime!.isBefore(newDt)) {
//               MezSnackbar(
//                 "${_i18n()['oops']}",
//                 "${_i18n()['pickupTimeError']}",
//               );
//               return;
//             }
//             // PickUp
//           } else {
//             if (widget.viewcontroller.order.estimatedArrivalAtDropoffTime != null &&
//                 !widget.viewcontroller.order.estimatedArrivalAtDropoffTime!.isAfter(newDt)) {
//               MezSnackbar(
//                 "${_i18n()['oops']}",
//                 "${_i18n()['pickupTimeError']}",
//               );

//               return;
//             }
//           }

//           if (deliveryAction == DeliveryDirection.To_customer) {
//             isSettingPickUpTime.value = true;

//             try {
//               mezDbgPrint("Setting pickup time ======>>> ⏰⏰⏰⏰⏰⏰  ");
//               await dv_update_est_pickup_time(
//                   orderId: widget.viewcontroller.order.id, time: newDt);
//             } catch (e, stk) {
//               mezDbgPrint(e);
//               mezDbgPrint(stk);
//             } finally {
//               isSettingPickUpTime.value = false;
//             }
//           } else {
//             isSettingDropoffTime.value = true;
//             mezDbgPrint("Setting dropOff time ======>>> ⏰⏰⏰⏰⏰⏰  ");
//             try {
//               await dv_update_est_dropoff_time(
//                   orderId: widget.viewcontroller.order.id, time: newDt);
//             } catch (e, stk) {
//               mezDbgPrint(e);
//               mezDbgPrint(stk);
//             } finally {
//               isSettingDropoffTime.value = false;
//             }
//           }
//         },
//       );
//     }

//     return [];
//   }
// }
