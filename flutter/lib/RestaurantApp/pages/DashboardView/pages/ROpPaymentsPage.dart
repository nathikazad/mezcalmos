import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpAcceptedPayments.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpStripePaymentSetup.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class ROpPaymentPage extends StatelessWidget {
  const ROpPaymentPage({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  final ROpEditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (editInfoController.showStripe.isTrue) {
        return ROpStripePaymentSetup(viewController: editInfoController);
      } else if (editInfoController.setupClicked.isTrue) {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: CircularProgressIndicator(),
        );
      } else
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ROpAcceptedPayments(viewController: editInfoController),
            ],
          ),
        );
    });
  }
}
