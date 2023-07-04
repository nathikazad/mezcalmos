import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezServiceOpenHours"];

class MezServiceOpenHours extends StatelessWidget {
  const MezServiceOpenHours({Key? key, required this.schedule, this.textStyle})
      : super(key: key);
  final Schedule schedule;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "${_i18n()["openHours"]}",
            style: context.txt.bodyLarge,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Column(
          children:
              List.generate(schedule.openHours.entries.length, (int index) {
            final MapEntry<Weekday, WorkingDay> entry =
                schedule.openHours.entries.elementAt(index);
            final bool isLastElement =
                index == schedule.openHours.entries.length - 1;

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: isLastElement
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.calendar_today,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          "${_i18n()["weekDays"][entry.key.toFirebaseFormatString()]}",
                          style: textStyle?.copyWith(
                                  fontWeight: FontWeight.w600) ??
                              context.txt.titleLarge,
                        ),
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(entry.value.openHours.length,
                                  (int hourIndex) {
                                return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.watch_later_outlined,
                                          size: 18),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        convertToAmPm(
                                           entry.value.openHours[hourIndex].from[0]
                                                .toInt(),
                                          entry.value.openHours[hourIndex].from[1]
                                                .toInt()),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        convertToAmPm(
                                           entry.value.openHours[hourIndex].to[0]
                                                .toInt(),
                                            entry.value.openHours[hourIndex].to[1]
                                                .toInt()),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]);
                              }))),
                    ],
                  ),
                ),
              ],
            );
          }),
        )
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
