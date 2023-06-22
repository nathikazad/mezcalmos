import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Offerings']['components'];

class CustBusinessScheduleBuilder extends StatefulWidget {
  const CustBusinessScheduleBuilder({
    Key? key,
    required this.schedule,
    required this.scheduleType,
    this.showTitle = true,
    this.showIcons = true,
    this.icon = Icons.access_time_outlined,
    this.isService = false,
    required this.period,
  }) : super(key: key);

  final bool showTitle;
  final bool showIcons;
  final bool isService;
  final IconData icon;
  final Schedule? schedule;
  final ScheduleType scheduleType;
  final PeriodOfTime? period;

  @override
  State<CustBusinessScheduleBuilder> createState() =>
      _CustBusinessScheduleBuilderState();
}

class _CustBusinessScheduleBuilderState
    extends State<CustBusinessScheduleBuilder> {
  String scheduleTypeHeading() {
    switch (widget.scheduleType) {
      case ScheduleType.Scheduled:
        return "schedule";

      case ScheduleType.OnDemand:
        return "availability";

      case ScheduleType.OneTime:
        return "time";
    }
  }

  String formatTime(String hour, String minute) {
    final int h = int.parse(hour);
    final int m = int.parse(minute);
    if (h < 0 || h > 23 || m < 0 || m > 59) {
      throw ArgumentError('Invalid time value');
    }
    if (h == 0) {
      return '12:${m.toString().padLeft(2, '0')} AM';
    } else if (h < 12) {
      return '${h.toString()}:${m.toString().padLeft(2, '0')} AM';
    } else if (h == 12) {
      return '12:${m.toString().padLeft(2, '0')} PM';
    } else if (h > 12 && h <= 23) {
      return '${(h - 12).toString()}:${m.toString().padLeft(2, '0')} PM';
    }
    throw ArgumentError('Invalid time value');
  }

  @override
  Widget build(BuildContext context) {
    if (widget.period != null && widget.scheduleType == ScheduleType.OneTime) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showTitle)
            Text(
              widget.isService
                  ? '${_i18n()['availability']}'
                  : _i18n()[scheduleTypeHeading()]!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          oneTimeBuilder(widget.period),
        ],
      );
    }
    if (widget.schedule == null) {
      return SizedBox.shrink();
    }
    final Map<String, WorkingDay> concatenatedSchedule =
        widget.schedule?.concatenatedVersion() ?? {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          Text(
            widget.isService
                ? '${_i18n()['availability']}'
                : _i18n()[scheduleTypeHeading()]!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        if (widget.schedule != null)
          ...concatenatedSchedule.entries
              .map((MapEntry<String, WorkingDay> workingDays) {
            return Builder(
              builder: (BuildContext context) {
                final bool isOpen = workingDays.value.isOpen;
                final isLastDay =
                    concatenatedSchedule.entries.last.key == workingDays.key;
                return isOpen
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              !widget.showIcons
                                  ? Text(
                                      _daysTranslate(workingDays.key),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                                  : SizedBox(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Icon(
                                              Icons.access_time_outlined,
                                              size: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              _daysTranslate(workingDays.key),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              Column(
                                children: [
                                  ...workingDays.value.openHours.map((element) {
                                    final String fromHour =
                                        element.from.first.toString();
                                    final String fromMinute =
                                        element.from.last.toString();
                                    final String toHour =
                                        element.to.first.toString();
                                    final String toMinute =
                                        element.to.last.toString();
                                    return Text(
                                      "${formatTime(fromHour, fromMinute)} - ${formatTime(toHour, toMinute)}",
                                    );
                                  }).toList(),
                                ],
                              ),
                            ],
                          ),
                          if (!isLastDay) Divider(),
                        ],
                      )
                    : SizedBox.shrink();
              },
            );
          }).toList()
      ],
    );
  }

  Widget oneTimeBuilder(PeriodOfTime? period) {
    return period != null
        ? Column(
            children: [
              // Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 4,
                        ),
                        child: Icon(
                          Icons.access_time_outlined,
                          size: 20,
                        ),
                      ),
                      Text(
                        "${period.start.toDayName().inCaps} ${period.start.day} ${DateFormat.MMMM().format(period.start)}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                      "${period.formatTime(period.start)} - ${period.formatTime(period.end)}"),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }

  String _daysTranslate(String day) {
    // Means day is combined
    if (day.contains("-")) {
      final List<String> twoDays = day.split("-");
      if (widget.scheduleType == ScheduleType.Scheduled) {
        return "${_i18n()["weekDays"][twoDays[0].toLowerCase()]}s - ${_i18n()["weekDays"][twoDays[1].toLowerCase()]}s";
      }
      return "${_i18n()["weekDays"][twoDays[0].toLowerCase()]} - ${_i18n()["weekDays"][twoDays[1].toLowerCase()]}";
    } else {
      if (widget.scheduleType == ScheduleType.Scheduled) {
        return "${_i18n()["weekDays"][day.toLowerCase()]}s";
      }
      return "${_i18n()["weekDays"][day.toLowerCase()]}s";
    }
  }
}
