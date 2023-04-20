import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';

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
    mezDbgPrint("Schedule $schedule");

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

    if (schedule == null) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustBusinessHeading(
          text: scheduleTypeHeading(),
        ),
        MezServiceOpenHours(schedule: schedule!),
      ],
    );
  }
}
