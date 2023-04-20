import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustBusinessScheduleBuilder extends StatelessWidget {
  const CustBusinessScheduleBuilder({
    super.key,
    required this.schedule,
    required this.scheduleType,
  });

  /// Schedule will look like this
  ///
  /// (showing this for reference coz schedule is dynamic)
  ///
  /// ```
  /// {
  ///   "monday": {
  ///     // in 24hr format
  ///     "from": "10:0",
  ///     "to": "21:0",
  ///     "isOpen": true
  ///   },
  ///   "tuesday": {
  ///     // in 24hr format
  ///     "from": "12:0",
  ///     "to": "20:0",
  ///     "isOpen": true
  ///   },
  /// }
  /// ```
  final Schedule? schedule;
  final ScheduleType scheduleType;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("_BuildSchedule: $schedule $scheduleType");

    String scheduleTypeHeading() {
      switch (scheduleType) {
        case ScheduleType.Scheduled:
          return "Schedule";

        case ScheduleType.OnDemand:
          return "Availability";

        case ScheduleType.OneTime:
          return "Time";
      }
    }

    String formatTime(String timeString) {
      final List<String> parts = timeString.split(':');
      final int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);
      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        throw ArgumentError('Invalid time value: $timeString');
      }
      if (hour == 0) {
        return '12:${minute.toString().padLeft(2, '0')} AM';
      } else if (hour < 12) {
        return '${hour.toString()}:${minute.toString().padLeft(2, '0')} AM';
      } else if (hour == 12) {
        return '12:${minute.toString().padLeft(2, '0')} PM';
      } else if (hour > 12 && hour <= 23) {
        return '${(hour - 12).toString()}:${minute.toString().padLeft(2, '0')} PM';
      }
      throw ArgumentError('Invalid time value: $timeString');
    }

    Map<String, Map<String, dynamic>> changeScheduleOnTime() {
      var fakeSchedule = {
        "monday": {"from": "10:0", "to": "21:0", "isOpen": true},
        "tuesday": {"from": "12:0", "to": "20:0", "isOpen": true},
        "wednesday": {"from": "15:0", "to": "17:0", "isOpen": true},
      };
      final String firstKey = fakeSchedule.keys.first;
      final Map<String, dynamic> firstValue =
          fakeSchedule.values.first.cast<String, dynamic>();
      switch (scheduleType) {
        case ScheduleType.Scheduled:
          return fakeSchedule;
        case ScheduleType.OnDemand:
          return {"$firstKey": firstValue};
        case ScheduleType.OneTime:
          return {"$firstKey": firstValue};
      }
    }

    final Map<String, Map<String, dynamic>> tempSchedule =
        changeScheduleOnTime();

    // if (schedule == null || schedule.isEmpty()) {
    //   return Text("No Schedule Available");
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustBusinessHeading(
          text: scheduleTypeHeading(),
        ),
        for (int index = 0; index < tempSchedule.length; index++)
          Builder(
            builder: (context) {
              final String day = tempSchedule.keys.elementAt(index);
              final Map<String, dynamic> data = tempSchedule[day] ?? {};
              final String from = data['from'];
              final String to = data['to'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(tempSchedule.keys.elementAt(index)),
                        ),
                      ],
                    ),
                  ),
                  Text("${formatTime(from)}-${formatTime(to)}"),
                ],
              );
            },
          ),
      ],
    );
  }
}
