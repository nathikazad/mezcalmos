import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpScheduleSelector extends StatefulWidget {
  const BsOpScheduleSelector({
    Key? key,
    required this.onScheduleSelected,
    required this.schedule,
    required this.scheduleType,
    this.validator,
  }) : super(key: key);

  final Function(Schedule?) onScheduleSelected;
  final Schedule? schedule;
  final ScheduleType scheduleType;
  final String? Function(String?)? validator;

  @override
  State<BsOpScheduleSelector> createState() => _BsOpScheduleSelectorState();
}

class _BsOpScheduleSelectorState extends State<BsOpScheduleSelector> {
  Schedule? _selectedSchedule;
  @override
  void initState() {
    super.initState();
    mezDbgPrint("widget.value =================>>>>>${widget.schedule}");
    _selectedSchedule = widget.schedule;
  }

  @override
  void didUpdateWidget(covariant BsOpScheduleSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selectedSchedule = widget.schedule;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<Schedule>(
      initialValue: _selectedSchedule,
      validator: (Schedule? value) {
        if (value == null) {
          return _i18n()["scheduleError"];
        }

        /// This condition checks if the schedule has any [isOpen=true] timing
        else if (value.atLeastOneDayIsOpen == false) {
          return _i18n()["scheduleError"];
        }
        return null;
      },
      builder: (FormFieldState<Schedule> state) {
        return InkWell(
          onTap: () async {
            final Schedule? returnedSchedule =
                await BsOpSchedulePickerView.navigate(
              schedule: widget.schedule,
            );
            mezDbgPrint("returnedSchedule: $returnedSchedule");
            state.didChange(returnedSchedule);
            widget.onScheduleSelected.call(returnedSchedule);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_i18n()["schedule"]}",
                    style: context.textTheme.bodyLarge,
                  ),
                  if (state.value == null ||
                      _selectedSchedule!.atLeastOneDayIsOpen == false)
                    Icon(
                      Icons.keyboard_arrow_right,
                    ),
                ],
              ),
              //  if (schedule == null || checkIfAnyOpen(schedule))
              if (_selectedSchedule == null ||
                  _selectedSchedule!.atLeastOneDayIsOpen == false)
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
              if (_selectedSchedule != null &&
                  _selectedSchedule!.atLeastOneDayIsOpen)
                Stack(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 8,
                        ),
                        child: Column(
                          children: [
                            smallSepartor,
                            ..._selectedSchedule!.openHours.entries
                                .map((MapEntry<Weekday, WorkingDay> entry) {
                              if (entry.value.isOpen) {
                                return Container(
                                  // margin: const EdgeInsets.only(bottom: 5),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 2),
                                            child: Icon(
                                              Icons.calendar_today,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Text(
                                              "${_i18n()["weekdays"][entry.key.toFirebaseFormatString()]}",
                                              style:
                                                  context.textTheme.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                      smallSepartor,
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              entry.value.openHours.length,
                                              (int hourIndex) {
                                            return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      size: 18),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    convertToAmPm(
                                                        entry
                                                            .value
                                                            .openHours[
                                                                hourIndex]
                                                            .from[0]
                                                            .toInt(),
                                                        entry
                                                            .value
                                                            .openHours[
                                                                hourIndex]
                                                            .from[1]
                                                            .toInt()),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    convertToAmPm(
                                                        entry
                                                            .value
                                                            .openHours[
                                                                hourIndex]
                                                            .to[0]
                                                            .toInt(),
                                                        entry
                                                            .value
                                                            .openHours[
                                                                hourIndex]
                                                            .to[1]
                                                            .toInt()),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ]);
                                          })),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: InkWell(
                        onTap: () async {
                          final Schedule? returnedSchedule =
                              await BsOpSchedulePickerView.navigate(
                            schedule: widget.schedule,
                          );
                          mezDbgPrint(
                              "returnedSchedule: ${_selectedSchedule!.toFirebaseFormattedJson()}}");
                          state.didChange(returnedSchedule);
                          widget.onScheduleSelected.call(returnedSchedule);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 16,
                          child: Icon(
                            Icons.mode_edit_outline_outlined,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 12),
                child: Text(
                  state.errorText ?? "",
                  style: context.theme.inputDecorationTheme.errorStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
