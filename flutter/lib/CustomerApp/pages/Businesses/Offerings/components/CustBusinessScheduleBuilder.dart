import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustBusinessScheduleBuilder extends StatefulWidget {
  const CustBusinessScheduleBuilder({
    super.key,
    required this.schedule,
    required this.scheduleType,
  });

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
        return "Schedule";

      case ScheduleType.OnDemand:
        return "Availability";

      case ScheduleType.OneTime:
        return "Time";
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
        Text(
          scheduleTypeHeading(),
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        for (int index = 0; index < widget.schedule!.openHours.length; index++)
          Builder(
            builder: (context) {
              final String day =
                  widget.schedule!.openHours.keys.elementAt(index).name;
              final OpenHours data =
                  widget.schedule!.openHours.values.elementAt(index);
              final String fromHour = data.from[0].toString();
              final String fromMinute = data.from[1].toString();

              final String toHour = data.to[0].toString();
              final String toMinute = data.to[1].toString();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(day),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${formatTime(fromHour, fromMinute)}-${formatTime(toHour, toMinute)}",
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}
