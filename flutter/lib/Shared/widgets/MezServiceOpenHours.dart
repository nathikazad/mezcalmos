import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

class MezServiceOpenHours extends StatelessWidget {
  const MezServiceOpenHours({Key? key, required this.schedule})
      : super(key: key);
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Open hours",
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            child: Column(
                children: schedule
                    .concatenatedVersion()
                    .entries
                    .map((MapEntry<String, OpenHours> v) {
          return Container(
            margin: const EdgeInsets.all(3),
            child: Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${v.key}",
                  style: Get.textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text("${v.value.from.join(":")} - ${v.value.to.join(":")}",
                    style: Get.textTheme.bodyText2)
              ],
            ),
          );
        }).toList())),
      ],
    );
  }
}
