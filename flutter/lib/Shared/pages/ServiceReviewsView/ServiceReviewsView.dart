import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/components/ServiceAcceptedPayments.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/components/ServiceStripePaymentSetup.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/controllers/ServicePaymentsViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServicePaymentsView'];

class ServiceReviewsView extends StatefulWidget {
  const ServiceReviewsView({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceReviewsView> createState() => _ServiceReviewsViewState();
}

class _ServiceReviewsViewState extends State<ServiceReviewsView> {
  ServicePaymentsViewController viewController =
      ServicePaymentsViewController();

  int? serviceProviderId;
  @override
  void initState() {
    if (Get.parameters["ServiceProviderId"] != null &&
        int.tryParse(Get.parameters["ServiceProviderId"]!) != null) {
      serviceProviderId = int.tryParse(Get.parameters["ServiceProviderId"]!);
      viewController.init(serviceProviderId: serviceProviderId!);
    }

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
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: CircularProgressIndicator(),
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