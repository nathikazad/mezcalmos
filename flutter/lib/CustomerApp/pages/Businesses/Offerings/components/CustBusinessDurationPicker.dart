import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustIconButton.dart';

class CustBusinessDurationPicker extends StatelessWidget {
  const CustBusinessDurationPicker({
    super.key,
    required this.costUnits,
    required this.onNewCostUnitSelected,
    required this.onNewDurationSelected,
    this.validator,
    required this.label,
    required this.value,
    this.unitValue,
  });

  final Map<TimeUnit, num> costUnits;
  final String label;
  final String? Function(TimeUnit?)? validator;
  final void Function(Map<TimeUnit, num>) onNewCostUnitSelected;
  final void Function(int) onNewDurationSelected;
  final int value;
  final TimeUnit? unitValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormField<TimeUnit>(
            initialValue: costUnits.keys.first,
            validator: validator,
            builder: (FormFieldState<TimeUnit> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.textTheme.bodyLarge,
                  ),
                  smallSepartor,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Card(
                          elevation: 0,
                          child: Builder(builder: (context) {
                            int durationCount = value;
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Row(
                                children: [
                                  CustIconButton(
                                    onPressed: () {
                                      setState(() {
                                        durationCount--;
                                      });
                                      onNewDurationSelected.call(durationCount);
                                    },
                                    isEnabled: durationCount > 1,
                                    icon: Icons.remove,
                                  ),
                                  Expanded(
                                    child: Text(
                                      durationCount.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  CustIconButton(
                                    onPressed: () {
                                      setState(() {
                                        durationCount++;
                                      });
                                      onNewDurationSelected.call(durationCount);
                                    },
                                    isEnabled: true,
                                    icon: Icons.add,
                                  ),
                                ],
                              );
                            });
                          }),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Card(
                          elevation: 0,
                          child: StatefulBuilder(
                            builder: (context, setState) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: DropdownButtonFormField<TimeUnit>(
                                  value: unitValue,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                  ),
                                  items: costUnits.entries.map((entry) {
                                    final TimeUnit costKey = entry.key;
                                    return DropdownMenuItem<TimeUnit>(
                                      value: costKey,
                                      child: Text(
                                        '${costKey.toFirebaseFormatString()}',
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (selectedValue) {
                                    onNewCostUnitSelected.call({
                                      selectedValue!: costUnits[selectedValue]!
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  state.errorText == null
                      ? SizedBox.shrink()
                      : Container(
                          padding: const EdgeInsets.only(top: 2, left: 12),
                          child: Text(state.errorText ?? "",
                              style: context
                                  .theme.inputDecorationTheme.errorStyle),
                        ),
                ],
              );
            }),
      ],
    );
  }
}
