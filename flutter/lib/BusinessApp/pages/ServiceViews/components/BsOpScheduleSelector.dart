import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';

class BsOpScheduleSelector extends StatelessWidget {
  const BsOpScheduleSelector({
    super.key,
    required this.onScheduleSelected,
    required this.schedule,
  });
  final Function(Schedule?) onScheduleSelected;
  final Schedule? schedule;

  @override
  Widget build(BuildContext context) {
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
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        entries.key.name,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
      ],
    );
  }
}
