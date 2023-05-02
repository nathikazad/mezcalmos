import 'package:flutter/material.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/components/BsOpSchedulePickerComponents.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/controllers/BsOpSchedulePickerViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class BsOpSchedulePickerView extends StatefulWidget {
  const BsOpSchedulePickerView({Key? key}) : super(key: key);

  static Future<Schedule?> navigate({Schedule? schedule}) async {
    String route = BusinessOpRoutes.kBsOpSchedulePick;

    await MezRouter.toPath(route, arguments: {"schedule": schedule});
    return MezRouter.backResult;
  }

  @override
  _BsOpSchedulePickerViewState createState() => _BsOpSchedulePickerViewState();
}

class _BsOpSchedulePickerViewState extends State<BsOpSchedulePickerView> {
  late BsOpSchedulePickerWidgets viewWidgets;
  BsOpSchedulePickerViewController viewController =
      BsOpSchedulePickerViewController();

  @override
  void initState() {
    viewController.init();
    viewWidgets = BsOpSchedulePickerWidgets(
        context: context, viewController: viewController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        title: "Schedule",
        onClick: () {
          MezRouter.back();
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
          child: viewWidgets.editWorkingHoursComponent(),
        ),
      ),
    );
  }
}
