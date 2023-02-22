import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleView/controllers/ServiceScheduleViewController.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class ServiceScheduleWidgets {
  final ServiceScheduleViewController viewController;
  final BuildContext context;
  ServiceScheduleWidgets({required this.viewController, required this.context});

  int selectedValue = 1;

  // List of weekdays  cards
  Widget editWorkingHoursComponent() {
    final List<Widget> widgets = [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "${_i18n()["workingHours"]}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      SizedBox(
        height: 10,
      )
    ];

    for (int i = 0;
        i < viewController.newSchedule.value!.openHours.length;
        i++) {
      viewController.newSchedule.value!.openHours
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
                  style: Get.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                  flex: 6,
                  fit: FlexFit.loose,
                  child: viewController
                          .newSchedule.value!.openHours[weekday]!.isOpen
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Text(
                                convertToAmPm(
                                    viewController.newSchedule.value!
                                        .openHours[weekday]!.from[0],
                                    viewController.newSchedule.value!
                                        .openHours[weekday]!.from[1]),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " - ${convertToAmPm(viewController.newSchedule.value!.openHours[weekday]!.to[0], viewController.newSchedule.value!.openHours[weekday]!.to[1])}",
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
                    color: (viewController
                            .newSchedule.value!.openHours[weekday]!.isOpen)
                        ? Color(0xFFE9F4E9)
                        : Color(0xFFFCE7EB),
                  ),
                  //  padding: const EdgeInsets.symmetric(horizontal: 8),

                  child: Center(
                      child: Text(
                    viewController.newSchedule.value!.openHours[weekday]!.isOpen
                        ? "${_i18n()["workingHoursCard"]["open"]}"
                        : "${_i18n()["workingHoursCard"]["closed"]}",
                    style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: viewController
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
                style: Get.theme.textTheme.displaySmall,
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
                            style: Get.textTheme.bodyLarge),
                        Spacer(),
                        radioCircleButton(
                            value: viewController.schedulePreview.value!
                                    .openHours[weekday]!.isOpen ==
                                true,
                            onTap: (bool? v) {
                              viewController.schedulePreview.value!
                                  .openHours[weekday]!.isOpen = true;
                              viewController.schedulePreview.refresh();
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
                            style: Get.textTheme.bodyLarge),
                        Spacer(),
                        radioCircleButton(
                            value: viewController.schedulePreview.value!
                                    .openHours[weekday]!.isOpen ==
                                false,
                            onTap: (bool? v) {
                              viewController.schedulePreview.value!
                                  .openHours[weekday]!.isOpen = false;
                              viewController.schedulePreview.refresh();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (viewController
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
                        style: Get.textTheme.bodyLarge),
                    SizedBox(
                      height: 15,
                    ),
                    _timeFromCard(weekday),
                    SizedBox(
                      height: 25,
                    ),
                    Text("${_i18n()["workingHoursCard"]["to"]}",
                        style: Get.textTheme.bodyLarge),
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
            textStyle: Get.textTheme.bodyLarge?.copyWith(color: Colors.red)),
        onPressed: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            viewController.schedulePreview.value =
                Schedule.clone(viewController.newSchedule.value!);
            viewController.schedulePreview.refresh();
            //   viewController.theNewSchedule.refresh();
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("${_i18n()["cancel"]}",
              style: Get.textTheme.bodyLarge?.copyWith(color: Colors.red)),
        ));
  }

  Widget _saveBtn() {
    return InkWell(
        onTap: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            viewController.newSchedule.value =
                Schedule.clone(viewController.schedulePreview.value!);
            viewController.newSchedule.refresh();
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
              style: Get.textTheme.bodyLarge?.copyWith(color: Colors.white),
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
                hour: viewController
                    .schedulePreview.value!.openHours[weekday]!.to[0],
                minute: viewController
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
              viewController.schedulePreview.value!.openHours[weekday]!.to = [
                value.hour.toInt(),
                value.minute.toInt()
              ];
              viewController.schedulePreview.refresh();
            }
          });
        },
        child: Container(
            padding: EdgeInsets.all(12),
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              "${convertToAmPm(viewController.schedulePreview.value!.openHours[weekday]!.to[0], viewController.schedulePreview.value!.openHours[weekday]!.to[1])}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
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
                  hour: viewController
                      .schedulePreview.value!.openHours[weekday]!.from[0],
                  minute: viewController
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
              viewController.schedulePreview.value!.openHours[weekday]!.from = [
                value.hour.toInt(),
                value.minute.toInt()
              ];
              viewController.schedulePreview.refresh();
            }
          });
        },
        child: Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "${convertToAmPm(viewController.schedulePreview.value!.openHours[weekday]!.from[0], viewController.schedulePreview.value!.openHours[weekday]!.from[1])}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 11.sp),
            )),
      ),
    );
  }
}
