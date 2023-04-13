import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustServiceView extends StatefulWidget {
  const CustServiceView({Key? key}) : super(key: key);
  static Future<void> navigate(
      {required int serviceId,
      required ServiceProviderType serviceProviderType}) async {
    String route = CustomerRoutes.custServiceRoute
        .replaceFirst(':serviceId', serviceId.toString());
    return MezRouter.toPath(route,
        arguments: {'serviceProviderType': serviceProviderType});
  }

  @override
  _CustServiceViewState createState() => _CustServiceViewState();
}

class _CustServiceViewState extends State<CustServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //   CustServiceViewAppbar(viewController: viewController)
        ],
      ),
    );
  }
}
