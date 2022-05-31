import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';

class EditInfoWidgets {
  final EditInfoController editInfoController;
  final BuildContext context;
  EditInfoWidgets({required this.editInfoController, required this.context});

  dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
      ["MezWorkingHours"];

  // List of weekdays  cards
  Widget editWorkingHoursComponent() {
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

    for (int i = 0;
        i < editInfoController.newSchedule.value!.openHours.length;
        i++) {
      editInfoController.newSchedule.value!.openHours
          .forEach((Weekday key, OpenHours value) {
        if (key.index == i) {
          widgets.add(
            singleWorkDayCard(
              weekday: key,
            ),
          );
        }
      });
    }
    return Column(
      children: widgets,
    );
  }

// SINGLE WORK DAY CARD
  Widget singleWorkDayCard({required Weekday weekday}) {
    return Obx(
      () => Card(
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
                    color: (editInfoController
                            .newSchedule.value!.openHours[weekday]!.isOpen)
                        ? Color.fromRGBO(101, 225, 137, 0.6)
                        : Color.fromRGBO(252, 89, 99, 0.6),
                  ),
                  //  padding: const EdgeInsets.symmetric(horizontal: 8),

                  child: Center(
                      child: Text(editInfoController
                              .newSchedule.value!.openHours[weekday]!.isOpen
                          ? "${_i18n()["workingHoursCard"]["open"]}"
                          : "${_i18n()["workingHoursCard"]["closed"]}")),
                ),
              ),
              Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: editInfoController
                          .newSchedule.value!.openHours[weekday]!.isOpen
                      ? Column(children: [
                          Text(
                            "${editInfoController.newSchedule.value!.openHours[weekday]!.from[0]} : ${editInfoController.schedulePreview.value!.openHours[weekday]!.from[1]}  ",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${editInfoController.newSchedule.value!.openHours[weekday]!.to[0]} : ${editInfoController.schedulePreview.value!.openHours[weekday]!.to[1]}",
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
                          return editWorkingDayComponent(
                            weekday: weekday,
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
      ),
    );
  }

// BOTTOM SHEET CONTENT //
  Widget editWorkingDayComponent({required Weekday weekday}) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          //    mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10,
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8),
              child: Text(
                "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
                style: Get.theme.textTheme.headline3,
              ),
            ),
            Divider(),
            Center(
              child: Row(
                children: [
                  Flexible(
                      child: CheckboxListTile(
                          value: editInfoController.schedulePreview.value!
                              .openHours[weekday]!.isOpen,
                          activeColor: primaryBlueColor,
                          title: Text('${_i18n()["workingHoursCard"]["open"]}'),
                          onChanged: (bool? value) {
                            editInfoController.schedulePreview.value!
                                .openHours[weekday]!.isOpen = true;
                            editInfoController.schedulePreview.refresh();
                          })),
                  Flexible(
                      child: CheckboxListTile(
                    value: !editInfoController
                        .schedulePreview.value!.openHours[weekday]!.isOpen,
                    activeColor: primaryBlueColor,
                    onChanged: (bool? value) {
                      editInfoController.schedulePreview.value!
                          .openHours[weekday]!.isOpen = false;
                      editInfoController.schedulePreview.refresh();
                    },
                    title: Text("${_i18n()["workingHoursCard"]["closed"]}"),
                  )),
                ],
              ),
            ),
            if (editInfoController
                .schedulePreview.value!.openHours[weekday]!.isOpen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${_i18n()["workingHoursCard"]["from"]}"),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.from[0],
                              minute: editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.from[1]),
                          builder: (BuildContext context, Widget? child) {
                            return child ?? Container();
                          },
                        ).then((TimeOfDay? value) {
                          if (value != null) {
                            // mezDbgPrint(value);
                            editInfoController.schedulePreview.value!
                                .openHours[weekday]!.from = [
                              value.hour.toInt(),
                              value.minute.toInt()
                            ];
                            editInfoController.schedulePreview.refresh();
                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          child: Text(
                            "${editInfoController.schedulePreview.value!.openHours[weekday]!.from[0]} : ${editInfoController.schedulePreview.value!.openHours[weekday]!.from[1]}",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${_i18n()["workingHoursCard"]["to"]}"),
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
                              hour: editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.to[0],
                              minute: editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.to[1]),
                          builder: (BuildContext context, Widget? child) {
                            return child ?? Container();
                          },
                        ).then((TimeOfDay? value) {
                          if (value != null) {
                            editInfoController.schedulePreview.value!
                                .openHours[weekday]!.to = [
                              value.hour.toInt(),
                              value.minute.toInt()
                            ];
                            editInfoController.schedulePreview.refresh();
                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          child: Text(
                            "${editInfoController.schedulePreview.value!.openHours[weekday]!.to[0]} : ${editInfoController.schedulePreview.value!.openHours[weekday]!.to[1]}",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                    ),
                  ),
                ],
              ),
            Spacer(),
            TextButton(
                onPressed: () {
                  Future.delayed(Duration.zero, Get.back).then((value) {
                    editInfoController.newSchedule.value = Schedule.clone(
                        editInfoController.schedulePreview.value!);
                    editInfoController.newSchedule.refresh();
                  });
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("${_i18n()["save"]}"))),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Future.delayed(Duration.zero, Get.back).then((value) {
                    editInfoController.schedulePreview.value =
                        Schedule.clone(editInfoController.newSchedule.value!);
                    editInfoController.schedulePreview.refresh();
                    //   editInfoController.theNewSchedule.refresh();
                  });
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("${_i18n()["cancel"]}")))
            // TimePickerDialog(initialTime: TimeOfDay.now()),
          ],
        ),
      ),
    );
  }
}
