import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
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
                controller.workingHours.openHours[day]!;
            return _workingHourCard(
              context: context,
              weekday: day,
              index: index,
              openHours: workingHoursList,
            );
          },
        ),
      ),
    );
  }

  Widget _workingHourCard(
      {required Weekday weekday,
      required int index,
      required List<OpenHours> openHours,
      required BuildContext context}) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "${_i18n()["weekDays"]["${weekday.toFirebaseFormatString()}"]}",
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(openHours.length, (int hourIndex) {
                      return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              convertToAmPm(
                                  openHours[hourIndex].from[0].toInt(),
                                  openHours[hourIndex].from[1].toInt()),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              convertToAmPm(openHours[hourIndex].to[0].toInt(),
                                  openHours[hourIndex].to[1].toInt()),
                              textAlign: TextAlign.center,
                            ),
                          ]);
                    }))),
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: openHours.isNotEmpty
                      ? Colors.green.shade200.withOpacity(0.3)
                      : Colors.red.shade200.withOpacity(0.3),
                ),
                child: Center(
                    child: Text(
                  openHours.isNotEmpty
                      ? "${_i18n()["workingHoursCard"]["open"]}"
                      : "${_i18n()["workingHoursCard"]["closed"]}",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: openHours.isNotEmpty ? Colors.green : Colors.red),
                )),
              ),
            ),
            MezIconButton(
                onTap: () async {
                  List<OpenHours>? newOpenHours =
                      await SingleDayScheduleView.navigate(
                          weekday: weekday, openHours: openHours);
                  if (newOpenHours != null) {
                    controller.updateWorkingHours(
                        day: weekday, openHours: newOpenHours);
                  }
                },
                icon: Icons.edit_outlined)
          ],
        ),
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
