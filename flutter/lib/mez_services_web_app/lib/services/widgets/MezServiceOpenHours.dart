import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Schedule.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

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
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
        ),
        SizedBox(
          height: (MezCalmosResizer.isMobile(context) ||
                  MezCalmosResizer.isSmallMobile(context))
              ? 5
              : 10,
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
                  color: Color.fromRGBO(73, 73, 73, 1),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  getDayName(v.key).capitalizeDays,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(73, 73, 73, 1))),
                ),
                Spacer(),
                Text(
                    "${convertToAmPm(v.value.from[0], v.value.from[1])} - ${convertToAmPm(v.value.to[0], v.value.to[1])}",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: (MezCalmosResizer.isMobile(context) ||
                                MezCalmosResizer.isSmallMobile(context))
                            ? FontWeight.w500
                            : FontWeight.w600,
                        color: Color.fromRGBO(73, 73, 73, 1)))
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
