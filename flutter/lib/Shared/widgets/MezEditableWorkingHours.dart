import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class MezEditableWorkingHours extends StatelessWidget {
  const MezEditableWorkingHours(
      {Key? key, required this.schedule, this.editMode = false})
      : super(key: key);
  final Rxn<Schedule> schedule;
  final bool editMode;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          child: workingHoursComponent(
              schedule: schedule.value, context: context)),
    );
  }

  Widget workingHoursComponent(
      {Schedule? schedule, required BuildContext context}) {
    final DateFormat _dateFormat = new DateFormat('hh:mma');

    final DateTime xDate = DateTime.now();
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
              editMode: editMode,
              context: context,
              weekday: key,
              openHours: value));
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
    bool editMode = false,
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
          if (editMode)
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                      builder: (BuildContext context) {
                        return MezEditDayScheduleSheet(
                          weekday: weekday,
                          openHours: openHours,
                        );
                      });
                },
                icon: Icon(
                  Icons.edit,
                  color: keyAppColor,
                ))
        ],
      ),
    ),
  );
}

// ---------------------------------------
class MezEditDayScheduleSheet extends StatelessWidget {
  const MezEditDayScheduleSheet({
    Key? key,
    required this.weekday,
    required this.openHours,
  }) : super(key: key);
  final Weekday weekday;
  final OpenHours openHours;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Flexible(
                  child: CheckboxListTile(
                      value: openHours.isOpen,
                      //  checkColor: keyAppColor,
                      activeColor: keyAppColor,
                      title: Text("Open"),
                      onChanged: (bool? value) {
                        openHours.isOpen = !openHours.isOpen;
                      })),
              Flexible(
                  child: CheckboxListTile(
                value: !openHours.isOpen,
                activeColor: keyAppColor,
                //checkColor: keyAppColor,
                onChanged: (bool? value) {
                  openHours.isOpen = !openHours.isOpen;
                },
                title: Text("Closed"),
              )),
            ],
          ),
          Text("From : "),
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                final TimeOfDay? newToTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                      hour: openHours.from[0], minute: openHours.from[1]),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child ?? Container(),
                    );
                  },
                ).then((TimeOfDay? value) {
                  if (value != null) {
                    openHours.from[0] = value.hour.toInt();
                    openHours.from[1] = value.minute.toInt();
                  }
                  return null;
                  //  return null;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  child: Text(
                    "${openHours.from[0]} : ${openHours.from[1]}",
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
              onTap: () async {
                final TimeOfDay? newToTime = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay(hour: openHours.to[0], minute: openHours.to[1]),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child ?? Container(),
                    );
                  },
                ).then((TimeOfDay? value) {
                  if (value != null) {
                    openHours.to[0] = value.hour.toInt();
                    openHours.to[1] = value.minute.toInt();
                  }
                  return null;
                  //  return null;
                });
              },
              child: Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  child: Text(
                    "${openHours.to[0]} : ${openHours.to[1]}",
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
            ),
          ),
          // TimePickerDialog(initialTime: TimeOfDay.now()),
        ],
      ),
    );
  }
}

RoundedRectangleBorder workingHourEditSheet() {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  ));
}
