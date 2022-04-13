import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class MezWorkingHours extends StatelessWidget {
  const MezWorkingHours(
      {Key? key, required this.schedule, this.editMode = false})
      : super(key: key);
  final Schedule schedule;
  final bool editMode;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: workingHoursComponent(schedule: schedule, context: context));
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
            day: "${_i18n()["weekDays"]["${key.toFirebaseFormatString()}"]}",
            isOpen: value.isOpen,
            openHour:
                "${_dateFormat.format(DateTime(xDate.year, xDate.month, xDate.day, value.from[0], value.from[1]))}",
            closeHour:
                "${_dateFormat.format(DateTime(xDate.year, xDate.month, xDate.day, value.to[0], value.to[1]))}",
          ));
        }
      });
    }
    return Column(
      children: widgets,
    );
  }
}

Widget _workingHourCard(
    {required String? day,
    required String? openHour,
    required String? closeHour,
    required bool? isOpen,
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
              child: Text(day!),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              //  padding: const EdgeInsets.symmetric(horizontal: 8),
              color: isOpen!
                  ? Color.fromRGBO(101, 225, 137, 0.6)
                  : Color.fromRGBO(252, 89, 99, 0.6),
              child: Center(
                  child: Text(isOpen
                      ? "${_i18n()["workingHoursCard"]["open"]}"
                      : "${_i18n()["workingHoursCard"]["closed"]}")),
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: isOpen
                  ? Column(children: [
                      Text(
                        "$openHour",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$closeHour",
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
                                child: Text(
                                  "Edit time",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Divider(),
                              Card(
                                child: InkWell(
                                  onTap: () {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now());
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      width: double.infinity,
                                      child: Text("$openHour")),
                                ),
                              )
                              // TimePickerDialog(initialTime: TimeOfDay.now()),
                            ],
                          ),
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
