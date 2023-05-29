import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["CreateServiceView"]["pages"]["createServiceStartPage"];

class CreateServiceStartPage extends StatelessWidget {
  const CreateServiceStartPage({super.key, required this.viewController});
  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                //  height: 30.h,
                width: 70.w,
                child: Image.asset(
                  viewController.getCreateImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                '${_i18n()['subtitle']["${viewController.serviceType.toFirebaseFormatString()}"]}',
                style: context.txt.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MezButton(
                label: "${_i18n()['create']}",
                onClick: () async {
                  unawaited(viewController.handleNext());
                }),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
