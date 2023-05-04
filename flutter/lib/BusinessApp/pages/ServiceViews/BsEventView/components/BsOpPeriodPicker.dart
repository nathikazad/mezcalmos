import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezPeriodPicker/MezPeriodPicker.dart';

class BsOpPeriodPicker extends StatelessWidget {
  const BsOpPeriodPicker({
    super.key,
    required this.timePeriod,
    required this.onNewPeriodSelected,
  });

  final PeriodOfTime? timePeriod;
  final void Function(PeriodOfTime) onNewPeriodSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
        ),
        smallSepartor,
        Card(
          child: InkWell(
            onTap: () {
              showModalBottomSheet<PeriodOfTime>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext ctx) {
                    return MezPeriodPicker(
                      startDate: DateTime.now(),
                      numberOfDaysInterval: 7,
                      periodOfTime: null,
                      serviceSchedule: scheduleFromData(defaultSchedule),
                    );
                  }).then((PeriodOfTime? value) {
                if (value != null) {
                  onNewPeriodSelected.call(value);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.watch_later),
                  SizedBox(width: 5),
                  Text(timePeriod?.toNormalString() ?? "Time")
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
