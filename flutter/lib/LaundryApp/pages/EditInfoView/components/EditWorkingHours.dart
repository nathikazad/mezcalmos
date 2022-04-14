import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

class EditWorkingHours extends StatelessWidget {
  const EditWorkingHours({Key? key, required this.schedule}) : super(key: key);
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    // mezDbgPrint(schedule);
    if (schedule.openHours[0]?.isOpen != null) {
      return Column(
        children: List.generate(
            schedule.openHours.length,
            (int index) => Text(schedule.openHours[index]?.isOpen.toString() ??
                "nuuuuuuullll")),
      );
    } else {
      return Text("GGGGGG");
    }
  }
}
