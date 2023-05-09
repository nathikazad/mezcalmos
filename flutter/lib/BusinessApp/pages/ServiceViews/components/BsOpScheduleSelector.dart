import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';

class BsOpScheduleSelector extends StatelessWidget {
  const BsOpScheduleSelector({
    super.key,
    required this.onScheduleSelected,
    required this.schedule,
    this.validator,
  });
  final Function(Schedule?) onScheduleSelected;
  final Schedule? schedule;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<Schedule>(
        initialValue: schedule,
        validator: (Schedule? value) {
          if (value == null) {
            return "Please select a schedule";
          }

          /// This condition checks if the schedule has any [isOpen=true] timing
          else if (!(value.openHours.values
              .toList()
              .any((element) => element.isOpen))) {
            return "Please select a schedule";
          }
          return null;
        },
        builder: (FormFieldState<Schedule> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Schedule",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              Card(
                child: InkWell(
                  onTap: () async {
                    final Schedule? returnedSchedule =
                        await BsOpSchedulePickerView.navigate(
                      schedule: schedule,
                    );
                    state.didChange(returnedSchedule);
                    onScheduleSelected.call(returnedSchedule);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: schedule != null
                        ? Column(
                            children: [
                              ...schedule!.openHours.entries
                                  .map((MapEntry<Weekday, OpenHours> entries) {
                                final String from = convertToAmPm(
                                    entries.value.from.first.toInt(),
                                    entries.value.from.last.toInt());
                                final String to = convertToAmPm(
                                    entries.value.to.first.toInt(),
                                    entries.value.to.last.toInt());
                                final String time = "$from - $to";
                                return entries.value.isOpen
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              entries.key.name,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              time,
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink();
                              }),
                            ],
                          )
                        : Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  "Add schedule",
                                  style: context.textTheme.bodyLarge,
                                ),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 12),
                child: Text(state.errorText ?? "",
                    style: context.theme.inputDecorationTheme.errorStyle),
              ),
            ],
          );
        });
  }
}
