import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezServiceOpenHours"];

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
            "${_i18n()["openHours"]}",
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
            margin: const EdgeInsets.symmetric(vertical: 3),
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
                  getDayName(v.key).capitalizeDays,
                  style: Get.textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                    "${convertToAmPm(v.value.from[0], v.value.from[1])} : ${convertToAmPm(v.value.to[0], v.value.to[1])}"),
              ],
            ),
          );
        }).toList())),
      ],
    );
  }

  String getDayName(String key) {
    return key
        .toLowerCase()
        .split("-")
        .map((String element) {
          return "${_i18n()["weekDays"]["$element"]}";
        })
        .toList()
        .join("-");
  }
}

String convertToAmPm(int hours, int minutes) {
  String minutesFormattedString;
  String formattedString;
  if (minutes < 10) {
    minutesFormattedString = "0$minutes";
  } else {
    minutesFormattedString = "$minutes";
  }
  if (hours <= 12) {
    formattedString = "$hours:$minutesFormattedString AM";
  } else {
    formattedString = "${hours - 12}:$minutesFormattedString PM";
  }
  return formattedString;
}
