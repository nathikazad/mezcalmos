import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/SingleDayScheduleView.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours/controllers/MezWorkingHoursController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["MezWorkingHours"];

class MezEditableWorkingHours extends StatefulWidget {
  final Schedule schedule;
  const MezEditableWorkingHours({Key? key, required this.schedule})
      : super(key: key);
  @override
  State<MezEditableWorkingHours> createState() =>
      _MezEditableWorkingHoursState();
}

class _MezEditableWorkingHoursState extends State<MezEditableWorkingHours> {
  MezWorkingHoursController controller = MezWorkingHoursController();
  @override
  void initState() {
    controller.initialize(schedule: widget.schedule);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.workingHours.openHours.length,
          itemBuilder: (BuildContext context, int index) {
            final Weekday day =
                controller.workingHours.openHours.keys.elementAt(index);
            final List<OpenHours> workingHoursList =
                controller.workingHours.openHours[day]!.openHours;
            return _workingHourCard(
              context: context,
              weekday: day,
              index: index,
              isLast: index == controller.workingHours.openHours.length - 1,
              workingDay: controller.workingHours.openHours[day]!,
            );
          },
        ),
      ),
    );
  }

  Widget _workingHourCard(
      {required Weekday weekday,
      required int index,
      bool isLast = false,
      required WorkingDay workingDay,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: (isLast)
              ? null
              : Border(
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
              style: context.textTheme.bodyLarge,
            ),
          ),
          Flexible(
              fit: FlexFit.tight,
              // flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(workingDay.openHours.length,
                      (int hourIndex) {
                    if (workingDay.isOpen) {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              convertToAmPm(
                                  workingDay.openHours[hourIndex].from[0]
                                      .toInt(),
                                  workingDay.openHours[hourIndex].from[1]
                                      .toInt()),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              convertToAmPm(
                                  workingDay.openHours[hourIndex].to[0].toInt(),
                                  workingDay.openHours[hourIndex].to[1]
                                      .toInt()),
                              textAlign: TextAlign.center,
                            ),
                          ]);
                    } else
                      return SizedBox.shrink();
                  }))),
          Container(
            margin: EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: workingDay.isOpen
                  ? Color.fromRGBO(237, 255, 222, 0.86)
                  : Color(0xFFFFD6DC),
            ),
            child: Center(
                child: Text(
              workingDay.isOpen
                  ? "${_i18n()["workingHoursCard"]["open"]}"
                  : "${_i18n()["workingHoursCard"]["closed"]}",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: workingDay.isOpen ? Colors.green : redAccentColor),
            )),
          ),
          MezIconButton(
              onTap: () async {
                WorkingDay? newWorkingDay =
                    await SingleDayScheduleView.navigate(
                        weekday: weekday, workingDay: workingDay);
                if (newWorkingDay != null) {
                  controller.updateWorkingHours(
                      day: weekday, workingDay: newWorkingDay);
                }
              },
              elevation: 0,
              padding: EdgeInsets.all(4),
              iconSize: 20,
              iconColor: Colors.grey.shade600,
              backgroundColor: Colors.grey.shade200,
              icon: Icons.edit_outlined)
        ],
      ),
    );
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
}
