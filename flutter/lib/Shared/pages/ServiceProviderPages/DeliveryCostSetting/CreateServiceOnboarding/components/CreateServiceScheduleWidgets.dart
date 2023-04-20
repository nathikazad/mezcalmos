import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class CreateServiceScheduleWidgets {
  final CreateServiceViewController viewController;
  final BuildContext context;
  CreateServiceScheduleWidgets(
      {required this.viewController, required this.context});

  // List of weekdays  cards
  Widget editWorkingHoursComponent() {
    final List<Widget> widgets = [
      SizedBox(
        height: 10,
      )
    ];

    for (int i = 0;
        i < viewController.newSchedule.value.openHours.length;
        i++) {
      viewController.newSchedule.value.openHours
          .forEach((Weekday key, OpenHours value) {
        if (key.index == i) {
          widgets.addAll([
            singleWorkDayCard(
              weekday: key,
            ),
            if (i != (viewController.newSchedule.value.openHours.length - 1))
              Divider(
                thickness: 0.3,
                height: 5,
                indent: 10,
                endIndent: 10,
              )
          ]);
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
      () => Container(
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
                style: context.txt.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                flex: 6,
                fit: FlexFit.loose,
                child:
                    viewController.newSchedule.value.openHours[weekday]!.isOpen
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Text(
                                  convertToAmPm(
                                      viewController.newSchedule.value
                                          .openHours[weekday]!.from[0]
                                          .toInt(),
                                      viewController.newSchedule.value
                                          .openHours[weekday]!.from[1]
                                          .toInt()),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  " - ${convertToAmPm(viewController.newSchedule.value.openHours[weekday]!.to[0].toInt(), viewController.newSchedule.value.openHours[weekday]!.to[1].toInt())}",
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
                  borderRadius: BorderRadius.circular(25),
                  color: (viewController
                          .newSchedule.value.openHours[weekday]!.isOpen)
                      ? Color(0xFFE9F4E9)
                      : Color(0xFFFCE7EB),
                ),
                //  padding: const EdgeInsets.symmetric(horizontal: 8),

                child: Center(
                    child: Text(
                  viewController.newSchedule.value.openHours[weekday]!.isOpen
                      ? "${_i18n()["workingHoursCard"]["open"]}"
                      : "${_i18n()["workingHoursCard"]["closed"]}",
                  style: context.txt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: viewController
                              .newSchedule.value.openHours[weekday]!.isOpen
                          ? Color(0xFF219125)
                          : Color(0xFFE21132)),
                )),
              ),
            ),
            _editBtn(weekday)
          ],
        ),
      ),
    );
  }

  Widget _editBtn(Weekday weekday) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MezIconButton(
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
        icon: Icons.edit_outlined,
      ),
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
                style: context.txt.displaySmall,
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
                            style: context.txt.bodyLarge),
                        Spacer(),
                        radioCircleButton(
                            value: viewController.schedulePreview.value
                                    .openHours[weekday]!.isOpen ==
                                true,
                            onTap: (bool? v) {
                              viewController.schedulePreview.value
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
                            style: context.txt.bodyLarge),
                        Spacer(),
                        radioCircleButton(
                            value: viewController.schedulePreview.value
                                    .openHours[weekday]!.isOpen ==
                                false,
                            onTap: (bool? v) {
                              viewController.schedulePreview.value
                                  .openHours[weekday]!.isOpen = false;
                              viewController.schedulePreview.refresh();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (viewController.schedulePreview.value.openHours[weekday]!.isOpen)
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
                        style: context.txt.bodyLarge),
                    SizedBox(
                      height: 15,
                    ),
                    _timeFromCard(weekday),
                    SizedBox(
                      height: 25,
                    ),
                    Text("${_i18n()["workingHoursCard"]["to"]}",
                        style: context.txt.bodyLarge),
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
            textStyle: context.txt.bodyLarge?.copyWith(color: Colors.red)),
        onPressed: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            viewController.schedulePreview.value =
                viewController.newSchedule.value.clone();
            viewController.schedulePreview.refresh();
            //   viewController.theNewSchedule.refresh();
          });
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("${_i18n()["cancel"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.red)),
        ));
  }

  Widget _saveBtn() {
    return InkWell(
        onTap: () {
          Future.delayed(Duration.zero, MezRouter.back).then((value) {
            viewController.newSchedule.value =
                viewController.schedulePreview.value.clone();
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
              style: context.txt.bodyLarge?.copyWith(color: Colors.white),
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
                    .schedulePreview.value.openHours[weekday]!.to[0]
                    .toInt(),
                minute: viewController
                    .schedulePreview.value.openHours[weekday]!.to[1]
                    .toInt()),
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
              viewController.schedulePreview.value.openHours[weekday]!.to = [
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
              "${convertToAmPm(viewController.schedulePreview.value.openHours[weekday]!.to[0].toInt(), viewController.schedulePreview.value.openHours[weekday]!.to[1].toInt())}",
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
                      .schedulePreview.value.openHours[weekday]!.from[0]
                      .toInt(),
                  minute: viewController
                      .schedulePreview.value.openHours[weekday]!.from[1]
                      .toInt()),
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
              viewController.schedulePreview.value.openHours[weekday]!.from = [
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
              "${convertToAmPm(viewController.schedulePreview.value.openHours[weekday]!.from[0].toInt(), viewController.schedulePreview.value.openHours[weekday]!.from[1].toInt())}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 11.sp),
            )),
      ),
    );
  }
}
