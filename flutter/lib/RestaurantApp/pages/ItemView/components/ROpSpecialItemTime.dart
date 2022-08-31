import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezDateTimePicker/MezDateTimePicker.dart';

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
        Card(
          color: Colors.grey.shade200,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: (widget.viewController.startDay.value != null &&
                      widget.viewController.endDate.value != null)
                  ? Column(
                      children: [
                        Text(
                            "From : ${DateFormat("hh:mm a").format(widget.viewController.startDay.value!)}"),
                        Text(
                            "To : ${DateFormat("hh:mm a").format(widget.viewController.endDate.value!)}"),
                      ],
                    )
                  : Text("Select special time"),
            ),
            onTap: () {
              showModalBottomSheet<List<DateTime>>(
                  context: context,
                  builder: (BuildContext ctx) {
                    return MezDateTimePicker(
                        startDate: DateTime.now(),
                        numberOfDaysInterval: 7,
                        periodTime: true,
                        serviceSchedule:
                            widget.viewController.restaurant.value!.schedule!);
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
      ],
    );
  }
}
