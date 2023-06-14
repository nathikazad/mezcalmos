import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceScheduleViews/controllers/ServiceScheduleViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours/MezEditableWorkingHours.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ServiceScheduleView extends StatefulWidget {
  const ServiceScheduleView({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceScheduleView> createState() => _ServiceScheduleViewState();
}

class _ServiceScheduleViewState extends State<ServiceScheduleView> {
  ServiceScheduleViewController viewController =
      ServiceScheduleViewController();

  int? serviceProviderId;

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          title: '${_i18n()["schedule"]}',
          onClick: MezRouter.back,
          showNotifications: true),
      body: Obx(() {
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
      }),
    );
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
                MezEditableWorkingHours(
                  schedule: viewController.oldSchedule.value!,
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
            await viewController
                .updateSchedule()
                .then((bool value) => customSnackBar(
                    title: '${_i18n()["saved"]}',
                    subTitle: '${_i18n()["savedText"]}',
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
