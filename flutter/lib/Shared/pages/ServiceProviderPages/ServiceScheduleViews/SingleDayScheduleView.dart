import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/controllers/SingleDayScheduleController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceProviderPages']['ServiceScheduleViews']['SingleDayScheduleView'];

class SingleDayScheduleView extends StatefulWidget {
  const SingleDayScheduleView({super.key});
  static Future<WorkingDay?> navigate(
      {required Weekday weekday, required WorkingDay workingDay}) async {
    await MezRouter.toPath(
        SharedServiceProviderRoutes.kSingleDayServiceScheduleRoute,
        arguments: {
          "weekday": weekday,
          "workingDay": workingDay,
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
  WorkingDay? openHours;
  @override
  void initState() {
    weekday = MezRouter.bodyArguments?["weekday"] as Weekday?;
    openHours = MezRouter.bodyArguments?["workingDay"] as WorkingDay?;
    if (weekday != null && openHours != null) {
      viewController.initialize(day: weekday!, workingDay: openHours!);
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
          title: "${weekday!.translate()}",
          onClick: MezRouter.back,
        ),
        bottomNavigationBar: MezButton(
            borderRadius: 0,
            label: "${_i18n()['save']}",
            onClick: () async {
              viewController.saveWorkingHours();
            }),
        body: Obx(() {
          if (viewController.hasData) {
            return _buildBody();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }

  Card _startsAtCard(BuildContext context, int index) {
    return Card(
      color: context.theme.inputDecorationTheme.fillColor,
      child: InkWell(
        onTap: () async {
          TimeOfDay? newTime = await getTimePicker(context,
              initialTime: TimeOfDay(
                  hour: viewController.workingHours![index].fromOld[0].toInt(),
                  minute:
                      viewController.workingHours![index].fromOld[1].toInt()));
          if (newTime != null) {
            viewController.updateFromTime(
                index: index, hour: newTime.hour, minute: newTime.minute);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  viewController.workingHours![index].fromTimeFormatted,
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
    );
  }

  Card _endsAtCard(BuildContext context, int index) {
    return Card(
      color: context.theme.inputDecorationTheme.fillColor,
      child: InkWell(
        onTap: () async {
          TimeOfDay? newTime = await getTimePicker(context,
              initialTime: TimeOfDay(
                  hour: viewController.workingHours![index].toOld[0].toInt(),
                  minute:
                      viewController.workingHours![index].toOld[1].toInt()));
          if (newTime != null) {
            viewController.updateToTime(
                index: index, hour: newTime.hour, minute: newTime.minute);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  viewController.workingHours![index].toTimeFormatted,
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
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // top component //
          meduimSeperator,
          MezItemAvSwitcher(
            value: viewController.workingDay!.isOpen,
            onAvalableTap: () {
              viewController.switchAvailable(value: true);
              // viewController.detailsController
              //     .switchAvailable(true);
            },
            onUnavalableTap: () {
              viewController.switchAvailable(value: false);
            },
          ),

          bigSeperator,

          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  viewController.workingHours!.length,
                  (int index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  "${_i18n()["time"]} ${index + 1}",
                                  style: context.textTheme.bodyLarge,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    viewController.removeWorkingHours(
                                        index: index);
                                  },
                                  child: Ink(
                                      child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete_outline_rounded,
                                        color: redAccentColor,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text("${_i18n()['delete']}",
                                          style: context.textTheme.bodyLarge
                                              ?.copyWith(color: redAccentColor))
                                    ],
                                  )))
                            ],
                          ),
                          smallSepartor,
                          Text(
                            "${_i18n()['startsAt']}",
                            style: context.textTheme.bodyLarge,
                          ),
                          smallSepartor,
                          _startsAtCard(context, index),
                          meduimSeperator,
                          Text(
                            "${_i18n()['endsAt']}",
                            style: context.textTheme.bodyLarge,
                          ),
                          smallSepartor,
                          _endsAtCard(context, index),
                          if (index != viewController.workingHours!.length - 1)
                            Divider(
                              height: 35,
                            ),
                        ],
                      )),
            ),
          ),
          bigSeperator,
          MezAddButton(
              onClick: () {
                viewController.newWorkingHours();
              },
              title: "${_i18n()['add']}"),
          //   bigSeperator,
          bigSeperator,
        ]));
  }
}
