import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/MezDateTimePicker.dart';
import 'package:sizer/sizer.dart';

class ROpSpecialItemTime extends StatefulWidget {
  const ROpSpecialItemTime({Key? key, required this.viewController})
      : super(key: key);
  final ItemViewController viewController;

  @override
  State<ROpSpecialItemTime> createState() => _ROpSpecialItemTimeState();
}

class _ROpSpecialItemTimeState extends State<ROpSpecialItemTime> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Item availability",
          style: Get.textTheme.bodyText1,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Card(
            elevation: 0,
            color: Colors.grey.shade200,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.watch_later,
                        size: 16.sp,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          _getFormattedString(),
                          style: Get.textTheme.bodyText2
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  )),
              onTap: () {
                showModalBottomSheet<List<DateTime>>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext ctx) {
                      return MezDateTimePicker(
                          startDate: DateTime.now(),
                          numberOfDaysInterval: 7,
                          periodTime: true,
                          serviceSchedule: widget
                              .viewController.restaurant.value!.schedule!);
                    }).then((List<DateTime>? value) {
                  if (value != null) {
                    mezDbgPrint("Value ========>$value");
                    widget.viewController.startDay.value = value.first;
                    widget.viewController.endDate.value = value.last;
                  }
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  String _getFormattedString() {
    String data = "Select your time";
    if (widget.viewController.startDay.value != null &&
        widget.viewController.endDate.value != null) {
      data =
          "${DateFormat.MMMEd(userLangCode).format(widget.viewController.startDay.value!).replaceAll(".", "")}, ${DateFormat("hh:mm a").format(widget.viewController.startDay.value!.toLocal())} - ${DateFormat("hh:mm a").format(widget.viewController.endDate.value!.toLocal())} ";
    }
    return data;
  }
}
