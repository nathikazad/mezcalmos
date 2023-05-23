import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Offerings']['components'];

class CustBusinessScheduleBuilder extends StatefulWidget {
  const CustBusinessScheduleBuilder({
    Key? key,
    required this.schedule,
    required this.scheduleType,
    this.showTitle = true,
    this.showIcons = true,
  }) : super(key: key);

  final bool showTitle;
  final bool showIcons;
  final Schedule? schedule;
  final ScheduleType scheduleType;

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
    if (widget.schedule == null) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          Text(
            _i18n()[scheduleTypeHeading()]!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        if (widget.scheduleType == ScheduleType.OneTime)
          Builder(
            builder: (BuildContext context) {
              return SizedBox();
              //       final List<OpenHours>? openHours =
              //           widget.schedule!.openHours.values.toList();

              //       if (openHours?.isEmpty == true) {
              //         return SizedBox.shrink();
              //       }

              //       final OpenHours data = openHours[0];
              //       final bool isOpen = data.isOpen;
              //       final String fromHour = data.from[0].toString();
              //       final String fromMinute = data.from[1].toString();
              //       final String toHour = data.to[0].toString();
              //       final String toMinute = data.to[1].toString();

              //       return isOpen
              //           ? Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   '${_i18n()[data.day.toLowerCase()]['weekDays']}',
              //                   style: Theme.of(context).textTheme.titleLarge,
              //                 ),
              //                 Text(
              //                   "${formatTime(fromHour, fromMinute)}-${formatTime(toHour, toMinute)}",
              //                 ),
              //               ],
              //             )
              //           : SizedBox.shrink();
              //     },
              //   ),
              // if (widget.scheduleType != ScheduleType.OneTime)
              //   for (final openHours in widget.schedule!.openHours)
              //     Builder(
              //       builder: (BuildContext context) {
              //         final bool isOpen = openHours.isOpen;
              //         final String fromHour = openHours.from[0].toString();
              //         final String fromMinute = openHours.from[1].toString();
              //         final String toHour = openHours.to[0].toString();
              //         final String toMinute = openHours.to[1].toString();

              //         return isOpen
              //             ? Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   !widget.showIcons
              //                       ? Text(
              //                           widget.scheduleType == ScheduleType.Scheduled
              //                               ? _days(openHours.day)
              //                               : openHours.day,
              //                           style: TextStyle(fontWeight: FontWeight.w600),
              //                         )
              //                       : SizedBox(
              //                           child: Row(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.center,
              //                             children: [
              //                               Padding(
              //                                 padding: const EdgeInsets.only(top: 3),
              //                                 child: Icon(
              //                                   Icons.access_time_outlined,
              //                                   size: 20,
              //                                 ),
              //                               ),
              //                               Padding(
              //                                 padding:
              //                                     const EdgeInsets.only(left: 5.0),
              //                                 child: Text(
              //                                   '${_i18n()[openHours.day]}${(widget.scheduleType == ScheduleType.Scheduled ? 's' : '')}',
              //                                   style: TextStyle(
              //                                       fontWeight: FontWeight.w600),
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                   Text(
              //                     "${formatTime(fromHour, fromMinute)}-${formatTime(toHour, toMinute)}",
              //                   ),
              //                 ],
              //               )
              //             : SizedBox.shrink();
            },
          ),
      ],
    );
  }

  String _days(String day) {
    if (Get.find<LanguageController>().langFullName == 'English') {
      return '${day}s';
    } else {
      return 'Los ${day.toLowerCase()}';
    }
  }
}
