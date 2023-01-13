import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/pages/ServicePaymentsView/controllers/ServicePaymentsViewController.dart';

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
          title: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Stripe"),
                  Text(
                    viewController.currentUrl.value,
                    style: Get.textTheme.subtitle1,
                  ),
                ],
              )),
        ),
        // body: WebView(
        //   javascriptMode: JavascriptMode.unrestricted,
        //   initialUrl: viewController.stripeUrl,
        //   onPageStarted: (String url) {
        //     mezDbgPrint("URL is =====>>>> $url");
        //     viewController.currentUrl.value = url;
        //     viewController.handleStripeUrlChanges(url);
        //   },
        // ),
      ),
    );
  }
}
