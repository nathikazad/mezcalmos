import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/controllers/ServicePaymentsViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceStripePaymentSetup extends StatelessWidget {
  const ServiceStripePaymentSetup({Key? key, required this.viewController})
      : super(key: key);
  final ServicePaymentsViewController viewController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        viewController.showStripe.value = false;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: MezIconButton(
                  onTap: () {
                    viewController.closePaymentSetup();
                  },
                  icon: Icons.close),
            )
          ],
          title: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Stripe"),
                  Text(
                    viewController.currentUrl.value,
                    style: Get.textTheme.subtitle1,
                  ),
                  if (viewController.showLinarProgress.isTrue)
                    LinearProgressIndicator(
                      color: primaryBlueColor,
                    )
                ],
              )),
        ),
        body: WebViewWidget(controller: viewController.webViewController),
      ),
    );
  }
}
