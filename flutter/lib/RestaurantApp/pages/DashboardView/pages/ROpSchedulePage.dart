import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpEditInfoWidgets.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpOpenClose.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpSchedulePage extends StatelessWidget {
  const ROpSchedulePage(
      {Key? key, required this.editInfoController, required this.viewWidgets})
      : super(key: key);
  final ROpEditInfoController editInfoController;
  final ROpEditInfoWidgets viewWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Obx(
              () => Column(
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
                  ROpOpenClose(
                      title: '${_i18n()["openTitle"]}',
                      subtitle: '${_i18n()["openSubtitle"]}',
                      onTurnedOn: () {
                        editInfoController.switchAv(true);
                      },
                      onTurnedOff: () {
                        editInfoController.switchAv(false);
                      },
                      initialSwitcherValue:
                          editInfoController.isAvailable.value),
                ],
              ),
            ),
          ),
        ),
        MezButton(
          label: '${_i18n()["saveInfo"]}',
          borderRadius: 0,
          withGradient: true,
          height: 70,
          onClick: () async {
            await editInfoController.updateLaundryInfo().then((value) =>
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
