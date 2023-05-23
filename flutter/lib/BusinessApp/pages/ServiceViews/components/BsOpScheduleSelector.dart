import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpScheduleSelector extends StatelessWidget {
  const BsOpScheduleSelector({
    super.key,
    required this.onScheduleSelected,
    required this.schedule,
    required this.scheduleType,
    this.validator,
  });
  final Function(Schedule?) onScheduleSelected;
  final Schedule? schedule;
  final ScheduleType scheduleType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    bool checkIfAnyOpen(Schedule? value) {
      return !(value!.openHours.values
          .toList()
          .any((element) => element.isOpen));
    }

    return FormField<Schedule>(
        initialValue: schedule,
        validator: (Schedule? value) {
          if (value == null) {
            return _i18n()["scheduleError"];
          }

          /// This condition checks if the schedule has any [isOpen=true] timing
          else if (checkIfAnyOpen(value)) {
            return _i18n()["scheduleError"];
          }
          return null;
        },
        builder: (FormFieldState<Schedule> state) {
          return InkWell(
            onTap: () async {
              final Schedule? returnedSchedule =
                  await BsOpSchedulePickerView.navigate(
                schedule: schedule,
                scheduleType: scheduleType,
              );
              state.didChange(returnedSchedule);
              onScheduleSelected.call(returnedSchedule);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${scheduleType == ScheduleType.Scheduled ? _i18n()["weeklySchedule"] : _i18n()["schedule"]}",
                      style: context.textTheme.bodyLarge,
                    ),
                    if (schedule == null || checkIfAnyOpen(schedule))
                      Icon(
                        Icons.keyboard_arrow_right,
                      ),
                  ],
                ),
                if (schedule == null || checkIfAnyOpen(schedule))
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(
                          Icons.info_outline,
                          color: primaryBlueColor,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          _i18n()["scheduleHint"],
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: primaryBlueColor),
                        ),
                      ),
                    ],
                  ),
                smallSepartor,
                if (schedule != null && !checkIfAnyOpen(schedule))
                  Stack(
                    children: [
                      Card(
                        child: Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 8,
                            ),
                            child: Column(
                              children: [
                                ...schedule!.openHours.entries.map(
                                    (MapEntry<Weekday, OpenHours> entries) {
                                  final String from = convertToAmPm(
                                      entries.value.from.first.toInt(),
                                      entries.value.from.last.toInt());
                                  final String to = convertToAmPm(
                                      entries.value.to.first.toInt(),
                                      entries.value.to.last.toInt());
                                  final String time = "$from - $to";
                                  return entries.value.isOpen
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "${entries.key.name}${(scheduleType == ScheduleType.Scheduled ? "s" : "")}",
                                                  style: context
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Text(
                                                  time,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink();
                                }),
                              ],
                            )),
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: InkWell(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 14,
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Container(
                  padding: const EdgeInsets.only(top: 2, left: 12),
                  child: Text(state.errorText ?? "",
                      style: context.theme.inputDecorationTheme.errorStyle),
                ),
              ],
            ),
          );
        });
  }
}
