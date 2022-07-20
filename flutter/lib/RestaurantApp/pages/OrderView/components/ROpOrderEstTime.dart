import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
//     ["OrderView"]["Components"]["ROpOrderEstTime"];

class ROpOrderEstTime extends StatefulWidget {
  const ROpOrderEstTime({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;

  @override
  State<ROpOrderEstTime> createState() => _ROpOrderEstTimeState();
}

class _ROpOrderEstTimeState extends State<ROpOrderEstTime> {
  ROpOrderController orderController = Get.find<ROpOrderController>();
  RxBool isClicked = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.watch_later,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Estimated food ready time",
                    style: Get.theme.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (widget.order.estimatedFoodReadyTime != null)
                    Text(
                      "${DateFormat("dd MMMM, hh:mm a ").format(widget.order.estimatedFoodReadyTime!.toLocal())}",
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
        onTap: () async {
          final Rxn<DateTime> selectedDate =
              Rxn(widget.order.estimatedFoodReadyTime);
          final Rxn<TimeOfDay> selectedTime = Rxn(TimeOfDay.fromDateTime(
              widget.order.estimatedFoodReadyTime ?? DateTime.now()));

          await showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Estimated finish time",
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
                      _confirmButton(selectedDate),
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
        },
        customBorder: CircleBorder(),
        child: Ink(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.order.estimatedFoodReadyTime != null)
                  ? Colors.grey.shade300
                  : Colors.transparent),
          child: (widget.order.estimatedFoodReadyTime != null)
              ? Icon(
                  Icons.edit_outlined,
                  size: 18,
                )
              : Text(
                  "Set",
                  style: Get.textTheme.bodyText1
                      ?.copyWith(color: primaryBlueColor),
                ),
        ));
  }

  Widget _confirmButton(Rxn<DateTime> selectedDate) {
    return InkWell(
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
                    style:
                        Get.textTheme.bodyText1?.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }

  InkWell _cancelButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.back(closeOverlays: true);
      },
      child: Ink(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: offRedColor, borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(
            "Cancel",
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
              width: 7,
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
        // ignore: unawaited_futures

        await getDatePicker(
          context,
          initialDate: selectedDate.value ?? DateTime.now(),
          firstDate: widget.order.orderTime,
          lastDate: DateTime(DateTime.now().year + 1),
        ).then((DateTime? value) {
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
            Icon(Ionicons.calendar_clear),
            SizedBox(
              width: 7,
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
    if (value.difference(widget.order.orderTime).inMinutes > 30) {
      orderController
          .setEstimatedFoodReadyTime(widget.order.orderId, value)
          .whenComplete(() {
        isClicked.value = false;
      }).then((ServerResponse value) {
        if (value.success) {
          Get.back(closeOverlays: true);
        }
      }).onError((Object? error, StackTrace stackTrace) {
        mezDbgPrint("Error seeting time =====>$error");
        mezDbgPrint("Error seeting time =====>$stackTrace");
      });
    } else {
      isClicked.value = false;
      Get.showSnackbar(GetSnackBar(
        snackPosition: SnackPosition.TOP,
        title: "Error",
        message: "Error text",
      ));
    }
  }
}
