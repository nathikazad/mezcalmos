import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsOpDateTimePicker extends StatelessWidget {
  const BsOpDateTimePicker(
      {super.key,
      required this.time,
      required this.onNewPeriodSelected,
      this.validator,
      this.startTime,
      this.fillColor,
      required this.label});

  final DateTime? time;
  final void Function(DateTime) onNewPeriodSelected;
  final String? Function(DateTime?)? validator;
  final String label;
  final DateTime? startTime;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormField<DateTime>(
            initialValue: time,
            validator: validator,
            builder: (FormFieldState<DateTime> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.textTheme.bodyLarge,
                  ),
                  smallSepartor,
                  InkWell(
                    onTap: () {
                      DateTime sdate = startTime ?? time ?? DateTime.now();
                      getDatePicker(context,
                              initialDate: sdate,
                              firstDate: sdate,
                              lastDate: sdate.add(Duration(days: 30)))
                          .then((DateTime? date) {
                        if (date != null) {
                          getTimePicker(context, initialTime: TimeOfDay.now())
                              .then((TimeOfDay? time) {
                            if (time != null) {
                              DateTime newDate = DateTime(date.year, date.month,
                                  date.day, time.hour, time.minute);
                              mezDbgPrint("newDate: $newDate");
                              state.didChange(newDate);
                              onNewPeriodSelected.call(newDate);
                            }
                          });
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: fillColor ?? Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.watch_later,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(state.value?.getEstimatedTime() ?? label),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  state.errorText == null
                      ? SizedBox.shrink()
                      : Container(
                          padding: const EdgeInsets.only(top: 2, left: 12),
                          child: Text(state.errorText ?? "",
                              style: context
                                  .theme.inputDecorationTheme.errorStyle),
                        ),
                ],
              );
            }),
      ],
    );
  }
}
