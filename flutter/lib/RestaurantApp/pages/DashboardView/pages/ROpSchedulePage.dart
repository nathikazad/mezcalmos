import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpScheduleWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/ROpScheduleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpSchedulePage extends StatefulWidget {
  const ROpSchedulePage({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  final ROpEditInfoController editInfoController;

  @override
  State<ROpSchedulePage> createState() => _ROpSchedulePageState();
}

class _ROpSchedulePageState extends State<ROpSchedulePage> {
  late ROpScheduleWidgets viewWidgets;
  late ROpScheduleController viewController;
  @override
  void initState() {
    mezDbgPrint("INIT SCHEDULE 😡😡😡😡😡😡😡😡😡");
    viewController =
        ROpScheduleController(editInfoController: widget.editInfoController);
    viewWidgets =
        ROpScheduleWidgets(viewController: viewController, context: context);
    viewController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewController.oldSchedule.value != null) {
        return _buidSchedule();
      } else {
        return Container(
          alignment: Alignment.center,
          child: MezLogoAnimation(
            centered: true,
          ),
        );
      }
    });
  }

  Widget _buidSchedule() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: viewWidgets.editWorkingHoursComponent(),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        MezButton(
          label: '${_i18n()["saveInfo"]}',
          borderRadius: 0,
          withGradient: false,
          height: 70,
          onClick: () async {
            await viewController.updateSchedule().then((bool value) =>
                Get.snackbar('${_i18n()["saved"]}', '${_i18n()["savedText"]}',
                    backgroundColor: Colors.black,
                    colorText: Colors.white,
                    shouldIconPulse: false,
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )));
          },
        )
      ],
    );
  }
}
