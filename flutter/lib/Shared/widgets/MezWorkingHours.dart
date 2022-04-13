import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class MezWorkingHours extends StatelessWidget {
  const MezWorkingHours({
    Key? key,
    required this.schedule,
  }) : super(key: key);
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          child: workingHoursComponent(schedule: schedule, context: context)),
    );
  }

  Widget workingHoursComponent(
      {Schedule? schedule, required BuildContext context}) {
    final DateFormat _dateFormat = new DateFormat('hh:mma');

    final List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_i18n()["workingHours"]}",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];
    final int pos = 0;
    for (int i = 0; i < schedule!.openHours.length; i++) {
      schedule.openHours.forEach((Weekday key, OpenHours value) {
        if (key.index == i) {
          widgets.add(_workingHourCard(
              context: context, weekday: key, openHours: value));
        }
      });
    }
    return Column(
      children: widgets,
    );
  }
}

Widget _workingHourCard(
    {required Weekday weekday,
    required OpenHours openHours,
    required BuildContext context}) {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}"),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              //  padding: const EdgeInsets.symmetric(horizontal: 8),
              color: openHours.isOpen
                  ? Color.fromRGBO(101, 225, 137, 0.6)
                  : Color.fromRGBO(252, 89, 99, 0.6),
              child: Center(
                  child: Text(openHours.isOpen
                      ? "${_i18n()["workingHoursCard"]["open"]}"
                      : "${_i18n()["workingHoursCard"]["closed"]}")),
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: openHours.isOpen
                  ? Column(children: [
                      Text(
                        "${openHours.from[0]} : ${openHours.from[1]}  ",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${openHours.to[0]} : ${openHours.to[1]}",
                        textAlign: TextAlign.center,
                      ),
                    ])
                  : Container(
                      height: 40,
                    )),
        ],
      ),
    ),
  );
}
