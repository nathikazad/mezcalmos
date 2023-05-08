import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return FormField<PeriodOfTime>(
        initialValue: timePeriod,
        validator: (PeriodOfTime? value) {
          if (value == null) {
            return "Please select a time";
          }
          return null;
        },
        builder: (FormFieldState<PeriodOfTime> state) {
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
                      state.didChange(value);
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
