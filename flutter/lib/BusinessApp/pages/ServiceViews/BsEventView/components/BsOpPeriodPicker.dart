import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/widgets/MezPeriodPicker/MezPeriodPicker.dart';

class BsOpPeriodPicker extends StatelessWidget {
  const BsOpPeriodPicker({
    super.key,
    required this.timePeriod,
    required this.serviceSchedule,
    required this.onNewPeriodSelected,
    this.label = "Select time",
  });

  final PeriodOfTime? timePeriod;
  final void Function(PeriodOfTime) onNewPeriodSelected;
  final Schedule serviceSchedule;
  final String label;

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
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              InkWell(
                onTap: () {
                  showModalBottomSheet<PeriodOfTime>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext ctx) {
                        return MezPeriodPicker(
                          startDate: DateTime.now(),
                          numberOfDaysInterval: 7,
                          periodOfTime: null,
                          serviceSchedule: serviceSchedule,
                        );
                      }).then((PeriodOfTime? value) {
                    state.didChange(value);
                    if (value != null) {
                      onNewPeriodSelected.call(value);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(timePeriod?.toNormalString() ?? label),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right),
                    ],
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
