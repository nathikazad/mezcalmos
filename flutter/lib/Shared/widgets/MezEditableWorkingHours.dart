import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class MezEditableWorkingHours extends StatelessWidget {
  const MezEditableWorkingHours({
    Key? key,
    required this.schedule,
  }) : super(key: key);
  final Rxn<Schedule> schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: editWorkingHoursComponent(schedule: schedule, context: context),
    );
  }

  Widget editWorkingHoursComponent(
      {required Rxn<Schedule> schedule, required BuildContext context}) {
    // final DateFormat _dateFormat = new DateFormat('hh:mm');

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

    for (int i = 0; i < schedule.value!.openHours.length; i++) {
      schedule.value!.openHours.forEach((Weekday key, OpenHours value) {
        if (key.index == i) {
          widgets.add(
            _workingHourCard(
              context: context,
              weekday: key,
              schedule: schedule,
              openHours: value,
            ),
          );
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
    required Rxn<Schedule> schedule,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: openHours.isOpen
                    ? Color.fromRGBO(101, 225, 137, 0.6)
                    : Color.fromRGBO(252, 89, 99, 0.6),
              ),
              //  padding: const EdgeInsets.symmetric(horizontal: 8),

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
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                    builder: (BuildContext context) {
                      return MezEditDayScheduleSheet(
                        weekday: weekday,
                        schedule: schedule,
                      );
                    });
              },
              icon: Icon(
                Icons.edit,
                color: primaryBlueColor,
              ))
        ],
      ),
    ),
  );
}

// // ---------------------------------------
class MezEditDayScheduleSheet extends StatelessWidget {
  const MezEditDayScheduleSheet({
    Key? key,
    required this.weekday,
    required this.schedule,
  }) : super(key: key);
  final Weekday weekday;

  final Rxn<Schedule> schedule;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              child: Text(
                "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Divider(),
            Center(
              child: Row(
                children: [
                  Flexible(
                      child: CheckboxListTile(
                          value: schedule.value!.openHours[weekday]!.isOpen,
                          activeColor: primaryBlueColor,
                          title: Text("Open"),
                          onChanged: (bool? value) {
                            schedule.value!.openHours[weekday]!.isOpen = true;
                            schedule.refresh();
                          })),
                  Flexible(
                      child: CheckboxListTile(
                    value: !schedule.value!.openHours[weekday]!.isOpen,
                    activeColor: primaryBlueColor,
                    onChanged: (bool? value) {
                      schedule.value!.openHours[weekday]!.isOpen = false;
                      schedule.refresh();
                    },
                    title: Text("Closed"),
                  )),
                ],
              ),
            ),
            Text("From : "),
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: schedule.value!.openHours[weekday]!.from[0],
                        minute: schedule.value!.openHours[weekday]!.from[1]),
                    builder: (BuildContext context, Widget? child) {
                      return child ?? Container();
                    },
                  ).then((TimeOfDay? value) {
                    if (value != null) {
                      // mezDbgPrint(value);
                      schedule.value!.openHours[weekday]!.from = [
                        value.hour.toInt(),
                        value.minute.toInt()
                      ];
                      schedule.refresh();
                    }
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    child: Text(
                      schedule.value!.openHours[weekday]!.from[0].toString() +
                          ":" +
                          schedule.value!.openHours[weekday]!.from[1]
                              .toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("To : "),
            SizedBox(
              height: 5,
            ),
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: schedule.value!.openHours[weekday]!.to[0],
                        minute: schedule.value!.openHours[weekday]!.to[1]),
                    builder: (BuildContext context, Widget? child) {
                      return child ?? Container();
                    },
                  ).then((TimeOfDay? value) {
                    if (value != null) {
                      schedule.value!.openHours[weekday]!.to = [
                        value.hour.toInt(),
                        value.minute.toInt()
                      ];
                      schedule.refresh();

                      //schedule.refresh();
                    }
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    child: Text(
                      schedule.value!.openHours[weekday]!.to[0].toString() +
                          ":" +
                          schedule.value!.openHours[weekday]!.to[1].toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              ),
            ),
            TextButton(
                onPressed: () {
                  Future.delayed(Duration.zero, Get.back)
                      .then((value) => schedule.refresh());
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("Save"))),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Future.delayed(Duration.zero, Get.back)
                      .then((value) => schedule.refresh());
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("Cancel")))
            // TimePickerDialog(initialTime: TimeOfDay.now()),
          ],
        ),
      ),
    );
  }
}
