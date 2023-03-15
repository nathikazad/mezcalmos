import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/order/mutations/hsRestaurantOrderMutations.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpOrderView']["components"]["ROpOrderEstTime"];

class RestaurantOrderEstTime extends StatefulWidget {
  const RestaurantOrderEstTime({Key? key, required this.order})
      : super(key: key);
  final RestaurantOrder order;

  @override
  State<RestaurantOrderEstTime> createState() => _RestaurantOrderEstTimeState();
}

class _RestaurantOrderEstTimeState extends State<RestaurantOrderEstTime> {
  final Rxn<TimeOfDay> selectedTime = Rxn();
  final Rxn<DateTime> selectedDate = Rxn();

  @override
  void initState() {
    selectedDate.value = widget.order.estimatedFoodReadyTime?.toLocal() ??
        DateTime.now().toLocal();
    selectedTime.value = TimeOfDay.fromDateTime(
        widget.order.estimatedFoodReadyTime?.toLocal() ??
            DateTime.now().toLocal());
    super.initState();
  }

  RxBool isClicked = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
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
                    '${_i18n()["title"]}',
                    style: Get.theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (widget.order.estimatedFoodReadyTime != null)
                    Text(
                      "${DateFormat("dd MMMM, hh:mm a ").format(widget.order.estimatedFoodReadyTime!.toLocal())}",
                      style: Get.theme.textTheme.bodyMedium,
                    ),
                ],
              ),
            ),
            Spacer(),
            if (widget.order.inProcess()) _editSetButton(context)
          ],
        ),
      ),
    );
  }

  Widget _editSetButton(BuildContext context) {
    return InkWell(
        onTap: () async {
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
                        "${_i18n()["title"]}",
                        style: context.txt.bodyLarge,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      _dateSelector(context),
                      SizedBox(
                        height: 20,
                      ),
                      _timeSelector(
                        context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _confirmButton(),
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
                  '${_i18n()["set"]}',
                  style:
                      context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
                ),
        ));
  }

  Widget _confirmButton() {
    return MezButton(
      label: "${_i18n()["confirm"]}",
      onClick: () async {
        await _setOrderEstTime(selectedDate.value!);

        await MezRouter.back();

        customSnackBar(
            title: 'Done',
            subTitle: 'Estimated food ready time saved',
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
      },
      withGradient: true,
    );
  }

  InkWell _cancelButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        MezRouter.back();
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
            "${_i18n()["cancel"]}",
            style: context.txt.bodyLarge?.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _timeSelector(
    BuildContext context,
  ) {
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
                          foregroundColor:
                              primaryBlueColor, // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
                initialTime: TimeOfDay(
                    hour: selectedDate.value?.toLocal().hour ??
                        widget.order.orderTime.toLocal().hour,
                    minute: selectedDate.value?.toLocal().minute ??
                        widget.order.orderTime.toLocal().minute))
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

  Widget _dateSelector(
    BuildContext context,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        // ignore: unawaited_futures

        await getDatePicker(
          context,
          initialDate:
              selectedDate.value?.toLocal() ?? DateTime.now().toLocal(),
          firstDate: widget.order.orderTime,
          lastDate: DateTime(DateTime.now().year + 1),
        ).then((DateTime? value) {
          if (value != null) {
            selectedDate.value = DateTime(
                value.toLocal().year,
                value.toLocal().month,
                value.toLocal().day,
                value.toLocal().hour,
                value.toLocal().minute);
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
                  "${DateFormat("dd MMMM yyyy").format(selectedDate.value?.toLocal() ?? DateTime.now().toLocal())}"),
            ),
            Spacer(),
            Icon(Icons.chevron_right_rounded)
          ],
        ),
      ),
    );
  }

  Future<void> _setOrderEstTime(DateTime value) async {
    isClicked.value = true;

    if (value.difference(widget.order.orderTime.toLocal()).inMinutes.abs() >
            5 &&
        value.difference(DateTime.now().toLocal()).inMinutes.abs() > 5) {
      try {
        await set_food_est_ready_time(
            orderId: widget.order.orderId,
            deliveryOrderId: widget.order.deliveryOrderId!,
            time: value);
      } catch (e, stk) {
        mezDbgPrint(e);
        mezDbgPrint(stk);
      }
    } else {
      isClicked.value = false;
      MezSnackbar('${_i18n()["error"]}', '${_i18n()["minTimes"]}',
          position: SnackPosition.TOP);
    }
  }
}
