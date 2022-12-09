import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

class ROpEditInfoWidgets {
  final ROpEditInfoController editInfoController;
  final BuildContext context;
  ROpEditInfoWidgets({required this.editInfoController, required this.context});

  dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
      ["MezWorkingHours"];
  int selectedValue = 1;

  // List of weekdays  cards
  Widget editWorkingHoursComponent() {
    final List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_i18n()["workingHours"]}",
          style: Theme.of(context).textTheme.bodyText2,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 15.w,
                child: Text(
                  "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
                  style: Get.textTheme.bodyText2
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                  flex: 6,
                  fit: FlexFit.loose,
                  child: editInfoController
                          .newSchedule.value!.openHours[weekday]!.isOpen
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Text(
                                convertToAmPm(
                                    editInfoController.newSchedule.value!
                                        .openHours[weekday]!.from[0],
                                    editInfoController.newSchedule.value!
                                        .openHours[weekday]!.from[1]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " - ${convertToAmPm(editInfoController.newSchedule.value!.openHours[weekday]!.to[0], editInfoController.newSchedule.value!.openHours[weekday]!.to[1])}",
                                textAlign: TextAlign.center,
                              ),
                            ])
                      : Container(
                          height: 40,
                        )),
              Flexible(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (editInfoController
                            .newSchedule.value!.openHours[weekday]!.isOpen)
                        ? Color(0xFFE9F4E9)
                        : Color(0xFFFCE7EB),
                  ),
                  //  padding: const EdgeInsets.symmetric(horizontal: 8),

                  child: Center(
                      child: Text(
                    editInfoController
                            .newSchedule.value!.openHours[weekday]!.isOpen
                        ? "${_i18n()["workingHoursCard"]["open"]}"
                        : "${_i18n()["workingHoursCard"]["closed"]}",
                    style: Get.textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: editInfoController
                                .newSchedule.value!.openHours[weekday]!.isOpen
                            ? Color(0xFF219125)
                            : Color(0xFFE21132)),
                  )),
                ),
              ),
              _editBtn(weekday)
            ],
          ),
        ),
      ),
    );
  }

  Widget _editBtn(Weekday weekday) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                backgroundColor: Colors.white,
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
          child: Ink(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey.shade200, shape: BoxShape.circle),
            child: Icon(
              Icons.edit_outlined,
              color: Color(0xFF5B5A5A),
              size: 20,
            ),
          )),
    );
  }

// BOTTOM SHEET CONTENT //
  Widget editWorkingDayComponent({required Weekday weekday}) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8),
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
              padding: const EdgeInsets.all(8),
              child: Text(
                "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
                style: Get.theme.textTheme.headline3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text('${_i18n()["workingHoursCard"]["open"]}',
                            style: Get.textTheme.bodyText1),
                        Spacer(),
                        radioCircleButton(
                            value: editInfoController.schedulePreview.value!
                                    .openHours[weekday]!.isOpen ==
                                true,
                            onTap: (bool? v) {
                              editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.isOpen = true;
                              editInfoController.schedulePreview.refresh();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text('${_i18n()["workingHoursCard"]["closed"]}',
                            style: Get.textTheme.bodyText1),
                        Spacer(),
                        radioCircleButton(
                            value: editInfoController.schedulePreview.value!
                                    .openHours[weekday]!.isOpen ==
                                false,
                            onTap: (bool? v) {
                              editInfoController.schedulePreview.value!
                                  .openHours[weekday]!.isOpen = false;
                              editInfoController.schedulePreview.refresh();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (editInfoController
                .schedulePreview.value!.openHours[weekday]!.isOpen)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("${_i18n()["workingHoursCard"]["from"]}",
                        style: Get.textTheme.bodyText1),
                    SizedBox(
                      height: 15,
                    ),
                    _timeFromCard(weekday),
                    SizedBox(
                      height: 25,
                    ),
                    Text("${_i18n()["workingHoursCard"]["to"]}",
                        style: Get.textTheme.bodyText1),
                    SizedBox(
                      height: 15,
                    ),
                    _timeToCard(weekday),
                  ],
                ),
              ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                children: [
                  _saveBtn(),
                  SizedBox(
                    height: 15,
                  ),
                  _cancelBtn(),
                ],
              ),
            )
            // TimePickerDialog(initialTime: TimeOfDay.now()),
          ],
        ),
      ),
    );
  }

  Widget _cancelBtn() {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: Size(double.infinity, 50),
            backgroundColor: offRedColor,
            textStyle: Get.textTheme.bodyText1?.copyWith(color: Colors.red)),
        onPressed: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            editInfoController.schedulePreview.value =
                Schedule.clone(editInfoController.newSchedule.value!);
            editInfoController.schedulePreview.refresh();
            //   editInfoController.theNewSchedule.refresh();
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("${_i18n()["cancel"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.red)),
        ));
  }

  Widget _saveBtn() {
    return InkWell(
        onTap: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            editInfoController.newSchedule.value =
                Schedule.clone(editInfoController.schedulePreview.value!);
            editInfoController.newSchedule.refresh();
          });
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                gradient: bluePurpleGradient,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "${_i18n()["save"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
            )));
  }

  Widget _timeToCard(Weekday weekday) {
    return Card(
      color: Colors.grey.shade200,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: editInfoController
                    .schedulePreview.value!.openHours[weekday]!.to[0],
                minute: editInfoController
                    .schedulePreview.value!.openHours[weekday]!.to[1]),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) =>
                              Color.fromRGBO(103, 121, 254, 1),
                        ),
                      ),
                    ),
                  ),
                  child: child!);
            },
          ).then((TimeOfDay? value) {
            if (value != null) {
              editInfoController.schedulePreview.value!.openHours[weekday]!.to =
                  [value.hour.toInt(), value.minute.toInt()];
              editInfoController.schedulePreview.refresh();
            }
          });
        },
        child: Container(
            padding: EdgeInsets.all(12),
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              "${convertToAmPm(editInfoController.schedulePreview.value!.openHours[weekday]!.to[0], editInfoController.schedulePreview.value!.openHours[weekday]!.to[1])}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 11.sp),
            )),
      ),
    );
  }

  Widget _timeFromCard(Weekday weekday) {
    return Card(
      color: Colors.grey.shade200,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          showTimePicker(
              context: context,
              initialTime: TimeOfDay(
                  hour: editInfoController
                      .schedulePreview.value!.openHours[weekday]!.from[0],
                  minute: editInfoController
                      .schedulePreview.value!.openHours[weekday]!.from[1]),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                    data: Theme.of(context).copyWith(
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) =>
                                Color.fromRGBO(103, 121, 254, 1),
                          ),
                        ),
                      ),
                    ),
                    child: child!);
              }).then((TimeOfDay? value) {
            if (value != null) {
              // mezDbgPrint(value);
              editInfoController.schedulePreview.value!.openHours[weekday]!
                  .from = [value.hour.toInt(), value.minute.toInt()];
              editInfoController.schedulePreview.refresh();
            }
          });
        },
        child: Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "${convertToAmPm(editInfoController.schedulePreview.value!.openHours[weekday]!.from[0], editInfoController.schedulePreview.value!.openHours[weekday]!.from[1])}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 11.sp),
            )),
      ),
    );
  }
}
