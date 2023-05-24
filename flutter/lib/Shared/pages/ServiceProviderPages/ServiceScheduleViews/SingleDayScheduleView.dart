import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/controllers/SingleDayScheduleController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

class SingleDayScheduleView extends StatefulWidget {
  const SingleDayScheduleView({super.key});
  static Future<List<OpenHours>?> navigate(
      {required Weekday weekday, required List<OpenHours> openHours}) async {
    await MezRouter.toPath(
        SharedServiceProviderRoutes.kSingleDayServiceScheduleRoute,
        arguments: {
          "weekday": weekday,
          "openHours": openHours,
        });
    return MezRouter.backResult;
  }

  @override
  State<SingleDayScheduleView> createState() => _SingleDayScheduleViewState();
}

class _SingleDayScheduleViewState extends State<SingleDayScheduleView> {
  SingleDayScheduleViewController viewController =
      SingleDayScheduleViewController();
  Weekday? weekday;
  List<OpenHours>? openHours;
  @override
  void initState() {
    weekday = MezRouter.bodyArguments?["weekday"] as Weekday?;
    openHours = MezRouter.bodyArguments?["openHours"] as List<OpenHours>?;
    if (weekday != null && openHours != null) {
      viewController.initialize(day: weekday!, workingHours: openHours!);
    } else {
      throw Exception("Invalid arguments");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        title: "${weekday!.name}",
        onClick: MezRouter.back,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        // top component //
        MezAddButton(onClick: () {
          viewController.newWorkingHours();
        }),
        Column(
          children: List.generate(
              viewController.workingHours.length,
              (int index) => Column(
                    children: [
                      Text(
                        "Time ${index + 1}",
                        style: context.textTheme.bodyLarge,
                      ),
                      meduimSeperator,
                      Text(
                        "Starts at",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Card(
                        color: context.theme.inputDecorationTheme.fillColor,
                        child: InkWell(
                          onTap: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                    hour: viewController
                                        .workingHours[index].from[0]
                                        .toInt(),
                                    minute: viewController
                                        .workingHours[index].from[1]
                                        .toInt()));
                            if (newTime != null) {
                              viewController.updateFromTime(
                                  index: index,
                                  hour: newTime.hour,
                                  minute: newTime.minute);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    convertToAmPm(
                                        viewController
                                            .workingHours[index].from[0]
                                            .toInt(),
                                        viewController
                                            .workingHours[index].from[1]
                                            .toInt()),
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      meduimSeperator,
                      Text(
                        "Ends at",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Card(
                        color: context.theme.inputDecorationTheme.fillColor,
                        child: InkWell(
                          onTap: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                    hour: viewController
                                        .workingHours[index].to[0]
                                        .toInt(),
                                    minute: viewController
                                        .workingHours[index].to[1]
                                        .toInt()));
                            if (newTime != null) {
                              viewController.updateToTime(
                                  index: index,
                                  hour: newTime.hour,
                                  minute: newTime.minute);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    convertToAmPm(
                                        viewController.workingHours[index].to[0]
                                            .toInt(),
                                        viewController.workingHours[index].to[1]
                                            .toInt()),
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
        )
      ])),
    );
  }
}
