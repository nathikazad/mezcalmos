import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustIconButton.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustGuestPicker extends StatelessWidget {
  const CustGuestPicker({
    super.key,
    required this.onNewGuestSelected,
    required this.label,
    required this.icon,
    required this.value,
    this.lowestValue,
    this.highestValue,
  });

  final void Function(int) onNewGuestSelected;
  final String label;
  final IconData icon;
  final int value;
  final int? lowestValue;
  final int? highestValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        Card(
          elevation: 0,
          child: Builder(builder: (context) {
            int durationCount = value;
            return StatefulBuilder(builder: (context, setState) {
              return Row(
                children: [
                  CustIconButton(
                    onPressed: () {
                      setState(() {
                        durationCount--;
                      });
                      onNewGuestSelected.call(durationCount);
                    },
                    isEnabled: durationCount > (lowestValue ?? 1),
                    icon: Icons.remove,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          durationCount.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  CustIconButton(
                    onPressed: () {
                      setState(() {
                        durationCount++;
                      });
                      onNewGuestSelected.call(durationCount);
                    },
                    isEnabled: highestValue == null
                        ? true
                        : durationCount < (highestValue ?? 1),
                    icon: Icons.add,
                  ),
                ],
              );
            });
          }),
        ),
      ],
    );
  }
}
