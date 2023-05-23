import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${day.toFirebaseFormatString()}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: workingHoursList.length,
                  itemBuilder: (BuildContext context, int hourIndex) {
                    final OpenHours openHours = workingHoursList[hourIndex];
                    return _workingHourCard(
                      context: context,
                      day: day,
                      index: hourIndex,
                      openHours: openHours,
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.addWorkingHour(
                            day: day,
                            openHours: OpenHours(
                              isOpen: false,
                              from: [08, 0],
                              to: [17, 0],
                            ));
                      },
                      child: Text('Add Working Hour'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (workingHoursList.isNotEmpty) {
                          controller.removeWorkingHour(
                              day: day, index: workingHoursList.length - 1);
                        }
                      },
                      child: Text('Remove Working Hour'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _workingHourCard({
    required BuildContext context,
    required Weekday day,
    required int index,
    required OpenHours openHours,
  }) {
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
                child: Text("${openHours.isOpen ? 'Open' : 'Closed'}"),
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: openHours.isOpen
                  ? Column(
                      children: [
                        Text(
                          '${openHours.from[0]}:${openHours.from[1]}',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${openHours.to[0]}:${openHours.to[1]}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Container(height: 40),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  builder: (BuildContext context) => MezEditDayScheduleSheet(
                    day: day,
                    index: index,
                    controller: controller,
                    openHours: openHours,
                  ),
                );
              },
              icon: Icon(Icons.edit, color: primaryBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}

class MezEditDayScheduleSheet extends StatelessWidget {
  final Weekday day;
  final int index;
  final OpenHours openHours;
  final MezWorkingHoursController controller;

  const MezEditDayScheduleSheet({
    required this.day,
    required this.index,
    required this.openHours,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            child: Text(
              '${day.toFirebaseFormatString()}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Divider(),
          CheckboxListTile(
            value: openHours.isOpen,
            activeColor: primaryBlueColor,
            title: Text('Open'),
            onChanged: (bool? value) => controller.updateOpenStatus(
                day: day, index: index, isOpen: value ?? false),
          ),
          CheckboxListTile(
            value: !openHours.isOpen,
            activeColor: primaryBlueColor,
            title: Text('Closed'),
            onChanged: (bool? value) => controller.updateOpenStatus(
                day: day, index: index, isOpen: value ?? false),
          ),
          Text('From:'),
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // controller.showTimePicker(
                //   context: context,
                //   initialTime: openHours.from,
                //   onSelected: (time) => controller.updateOpeningTime(
                //       day: day,
                //       index: index,
                //       hour: time.hour,
                //       minute: time.minute),
                // );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                child: Text(
                  '${openHours.from[0]}:${openHours.from[1]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('To:'),
          SizedBox(height: 5),
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                // controller.showTimePicker(
                //   context: context,
                //   initialTime: openHours.to,
                //   onSelected: (time) => controller.updateClosingTime(
                //       day: day, index: index, time: time),
                // );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                child: Text(
                  '${openHours.to[1]}:${openHours.to[0]}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.removeWorkingHour(day: day, index: index);
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
