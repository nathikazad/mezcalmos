import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

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
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: (widget.order.isAtLaundry() ||
              widget.order.estimatedLaundryReadyTime != null)
          ? Colors.white
          : Colors.grey.shade500,
      child: (isClicked)
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
                        if (widget.order.estimatedLaundryReadyTime != null)
                          Text(
                            "${DateFormat("dd MMMM yyyy, hh:mm a ").format(widget.order.estimatedLaundryReadyTime!.toLocal())}",
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
    );
  }

  Widget _editSetButton(BuildContext context) {
    return InkWell(
        onTap: (widget.order.isAtLaundry())
            ? () async {
                final DateTime? selectedDate =
                    widget.order.estimatedLaundryReadyTime;

                await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: widget.order.orderTime,
                    lastDate: DateTime(2050),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary:
                                primaryBlueColor, // header background color
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
                    }).then((DateTime? date) {
                  if (date != null) {
                    showTimePicker(
                            context: context,
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: primaryBlueColor,
                                    onPrimary:
                                        Colors.white, // header text color
                                    onSurface: Colors.black, // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary:
                                          primaryBlueColor, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialTime: TimeOfDay(
                                hour: widget.order.orderTime.hour,
                                minute: widget.order.orderTime.minute))
                        .then((TimeOfDay? time) {
                      if (time != null) {
                        _setOrderEstTime(DateTime(date.year, date.month,
                            date.day, time.hour, time.minute));
                      }
                    });
                  }
                });
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

  void _setOrderEstTime(DateTime value) {
    setState(() {
      isClicked = true;
    });
    orderController
        .setEstimatedLaundryReadyTime(widget.order.orderId, value)
        .whenComplete(() {
      setState(() {
        isClicked = false;
      });
    });
  }
}
