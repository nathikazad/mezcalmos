import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/helpers/StringHelper.dart';
import 'package:mez_services_web_app/models/Schedule.dart';

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
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
                Spacer(),
                Text(
                    "${v.value.from.join(":").capitalizeFirst} - ${v.value.to.join(":").capitalizeFirst}",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
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
