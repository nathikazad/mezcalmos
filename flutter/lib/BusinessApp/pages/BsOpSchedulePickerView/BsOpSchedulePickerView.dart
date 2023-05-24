import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/controllers/BsOpSchedulePickerViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours/MezEditableWorkingHours.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['BusinessApp']
    ['pages']['BsOpSchedulePickerView']['BsOpSchedulePickerView'];

class BsOpSchedulePickerView extends StatefulWidget {
  const BsOpSchedulePickerView({Key? key}) : super(key: key);

  static Future<Schedule?> navigate(
      {Schedule? schedule, ScheduleType? scheduleType}) async {
    String route = BusinessOpRoutes.kBsOpSchedulePick;

    await MezRouter.toPath(route, arguments: {
      "schedule": schedule,
      "scheduleType": scheduleType,
    });
    return MezRouter.backResult;
  }

  @override
  _BsOpSchedulePickerViewState createState() => _BsOpSchedulePickerViewState();
}

class _BsOpSchedulePickerViewState extends State<BsOpSchedulePickerView> {
  BsOpSchedulePickerViewController viewController =
      BsOpSchedulePickerViewController();
  late ScheduleType? scheduleType;

  @override
  void initState() {
    final Schedule? schedule =
        MezRouter.bodyArguments!["schedule"] as Schedule?;
    scheduleType = MezRouter.bodyArguments!["scheduleType"] as ScheduleType?;
    viewController.init(schedule: schedule);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        title:
            '${scheduleType != null && scheduleType == ScheduleType.Scheduled ? _i18n()['weeklySchedule'] : _i18n()['schedule']}',
        onClick: () {
          MezRouter.back(
            backResult: viewController.newSchedule.value,
          );
        },
      ),
      bottomNavigationBar: MezButton(
          borderRadius: 0,
          label: "Add",
          onClick: () async {
            viewController.saveAndBack();
          }),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Container(
          child: MezEditableWorkingHours(
              schedule: viewController.oldSchedule.value!),
        ),
      ),
    );
  }
}
