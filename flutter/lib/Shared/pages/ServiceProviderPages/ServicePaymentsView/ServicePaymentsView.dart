import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/components/ServiceAcceptedPayments.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/components/ServiceStripePaymentSetup.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServicePaymentsView/controllers/ServicePaymentsViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServicePaymentsView'];

class ServicePaymentsView extends StatefulWidget {
  const ServicePaymentsView({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicePaymentsView> createState() => _ServicePaymentsViewState();
}

class _ServicePaymentsViewState extends State<ServicePaymentsView> {
  ServicePaymentsViewController viewController =
      ServicePaymentsViewController();

  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    viewController.dspose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewController.showStripe.isTrue) {
        return ServiceStripePaymentSetup(viewController: viewController);
      } else if (viewController.setupClicked.isTrue) {
        return Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: MezRouter.back, title: "${_i18n()['payments']}"),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: primaryBlueColor,
                ),
              ],
            ),
          ),
        );
      } else
        return Scaffold(
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
              onClick: MezRouter.back, title: "${_i18n()['payments']}"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServiceAcceptedPayments(viewController: viewController),
              ],
            ),
          ),
        );
    });
  }
}
