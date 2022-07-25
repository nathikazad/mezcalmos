import 'package:flutter/material.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ROpStripePaymentSetup extends StatelessWidget {
  const ROpStripePaymentSetup({Key? key, required this.viewController})
      : super(key: key);
  final ROpEditInfoController viewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
        viewController.closePaymentSetup();
      }),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: viewController.stripeUrl,
      ),
    );
  }
}
