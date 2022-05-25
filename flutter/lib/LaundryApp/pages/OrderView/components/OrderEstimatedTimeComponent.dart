import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';

class OrderEstimatedTimeComponent extends StatefulWidget {
  const OrderEstimatedTimeComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  State<OrderEstimatedTimeComponent> createState() =>
      _OrderEstimatedTimeComponentState();
}

class _OrderEstimatedTimeComponentState
    extends State<OrderEstimatedTimeComponent> {
  OrderController orderController = Get.find<OrderController>();
  RxBool isClicked = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        color: (widget.order.isAtLaundry() ||
                widget.order.estimatedLaundryReadyTime != null)
            ? Colors.white
            : Colors.grey.shade300,
        child: (isClicked.value)
            ? Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: primaryBlueColor, shape: BoxShape.circle),
                      child: Icon(
                        Icons.watch_later,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Estimated finish time",
                            style: Get.theme.textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (widget.order.estimatedLaundryReadyTime != null)
                                ? "${DateFormat("dd MMMM yyyy, hh:mm a ").format(widget.order.estimatedLaundryReadyTime!.toLocal())}"
                                : "No estimated timed is added",
                            style: Get.theme.textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    _editSetButton(context)
                  ],
                ),
              ),
      ),
    );
  }

  Widget _editSetButton(BuildContext context) {
    return InkWell(
        onTap: (!widget.order.isAtLaundry())
            ? () async {
                final Rxn<DateTime> selectedDate =
                    Rxn(widget.order.estimatedLaundryReadyTime);
                final Rxn<TimeOfDay> selectedTime = Rxn(TimeOfDay.fromDateTime(
                    widget.order.estimatedLaundryReadyTime ?? DateTime.now()));

                await showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Estimated laundry ready time",
                              style: Get.textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            _dateSelector(context, selectedDate),
                            SizedBox(
                              height: 20,
                            ),
                            _timeSelector(context, selectedTime, selectedDate),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                if (selectedDate.value != null) {
                                  _setOrderEstTime(selectedDate.value!);
                                }
                              },
                              child: Ink(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    gradient: bluePurpleGradient,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Obx(
                                  () => Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: (isClicked.value)
                                        ? Transform.scale(
                                            scale: 0.3,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            "Confirm",
                                            style: Get.textTheme.bodyText1
                                                ?.copyWith(color: Colors.white),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            _cancelButton(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    });

                // await showDatePicker(
                //     context: context,
                //     initialDate: selectedDate ?? DateTime.now(),
                //     firstDate: widget.order.orderTime,
                //     lastDate: DateTime(2050),
                //     builder: (BuildContext context, Widget? child) {
                //       return Theme(
                //         data: Theme.of(context).copyWith(
                //           colorScheme: ColorScheme.light(
                //             primary:
                //                 primaryBlueColor, // header background color
                //             onPrimary: Colors.white, // header text color
                //             onSurface: Colors.black, // body text color
                //           ),
                //           textButtonTheme: TextButtonThemeData(
                //             style: TextButton.styleFrom(
                //               primary: primaryBlueColor, // button text color
                //             ),
                //           ),
                //         ),
                //         child: child!,
                //       );
                //     }).then((DateTime? date) {
                //   if (date != null) {
                //     showTimePicker(
                //             context: context,
                //             builder: (BuildContext context, Widget? child) {
                //               return Theme(
                //                 data: Theme.of(context).copyWith(
                //                   colorScheme: ColorScheme.light(
                //                     primary: primaryBlueColor,
                //                     onPrimary:
                //                         Colors.white, // header text color
                //                     onSurface: Colors.black, // body text color
                //                   ),
                //                   textButtonTheme: TextButtonThemeData(
                //                     style: TextButton.styleFrom(
                //                       primary:
                //                           primaryBlueColor, // button text color
                //                     ),
                //                   ),
                //                 ),
                //                 child: child!,
                //               );
                //             },
                //             initialTime: TimeOfDay(
                //                 hour: widget.order.orderTime.hour,
                //                 minute: widget.order.orderTime.minute))
                //         .then((TimeOfDay? time) {
                //       if (time != null) {
                //         _setOrderEstTime(DateTime(date.year, date.month,
                //             date.day, time.hour, time.minute));
                //       }
                //     });
                //   }
                // });
              }
            : null,
        customBorder: CircleBorder(),
        child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.order.estimatedLaundryReadyTime != null)
                  ? Colors.grey.shade300
                  : Colors.transparent),
          child: (widget.order.estimatedLaundryReadyTime != null)
              ? Icon(
                  Icons.edit_outlined,
                  size: 18,
                )
              : Text("Set"),
        ));
  }

  InkWell _cancelButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.back(closeOverlays: true);
      },
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: offRedColor, borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(
            "cancel",
            style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _timeSelector(BuildContext context, Rxn<TimeOfDay> selectedTime,
      Rxn<DateTime> selectedDate) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showTimePicker(
                context: context,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: primaryBlueColor,
                        onPrimary: Colors.white, // header text color
                        onSurface: Colors.black, // body text color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          primary: primaryBlueColor, // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
                initialTime: TimeOfDay(
                    hour: widget.order.orderTime.hour,
                    minute: widget.order.orderTime.minute))
            .then((TimeOfDay? value) {
          if (value != null) {
            selectedTime.value = value;
            selectedDate.value = new DateTime(
                selectedDate.value!.year,
                selectedDate.value!.month,
                selectedDate.value!.day,
                selectedTime.value!.hour,
                selectedTime.value!.minute);
          }
        });
      },
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(Icons.watch_later_rounded),
            SizedBox(
              width: 5,
            ),
            Obx(
              () => Text(
                  "${DateFormat("hh:mm a ").format(selectedDate.value?.toLocal() ?? DateTime.now())}"),
            ),
            Spacer(),
            Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }

  Widget _dateSelector(BuildContext context, Rxn<DateTime> selectedDate) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        await showDatePicker(
            context: context,
            initialDate: selectedDate.value ?? DateTime.now(),
            firstDate: widget.order.orderTime,
            lastDate: DateTime(2050),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: primaryBlueColor, // header background color
                    onPrimary: Colors.white, // header text color
                    onSurface: Colors.black, // body text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: primaryBlueColor, // button text color
                    ),
                  ),
                ),
                child: child!,
              );
            }).then((DateTime? value) {
          if (value != null) {
            selectedDate.value = value;
          }
        });
      },
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(Icons.calendar_month_rounded),
            SizedBox(
              width: 5,
            ),
            Obx(
              () => Text(
                  "${DateFormat("dd MMMM yyyy").format(selectedDate.value?.toLocal() ?? DateTime.now())}"),
            ),
            Spacer(),
            Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }

  void _setOrderEstTime(DateTime value) {
    isClicked.value = true;

    orderController
        .setEstimatedLaundryReadyTime(widget.order.orderId, value)
        .whenComplete(() {
      isClicked.value = false;
    }).then((ServerResponse value) {
      if (value.success) {
        Get.back();
      }
    });
  }
}
