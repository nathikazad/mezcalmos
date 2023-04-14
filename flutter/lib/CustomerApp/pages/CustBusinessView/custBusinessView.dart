import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/components/CustBusinessAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustBusinessView extends StatefulWidget {
  const CustBusinessView({Key? key}) : super(key: key);
  static Future<void> navigate({
    required int businessId,
  }) async {
    String route = CustomerRoutes.custBusinessRoute
        .replaceFirst(':businessId', businessId.toString());
    return MezRouter.toPath(
      route,
    );
  }

  @override
  _CustBusinessViewState createState() => _CustBusinessViewState();
}

class _CustBusinessViewState extends State<CustBusinessView> {
  CustBusinessViewController viewController = CustBusinessViewController();
  int? businessId;
  @override
  void initState() {
    businessId = int.tryParse(MezRouter.urlArguments['businessId'].toString());
    if (businessId != null) {
      viewController.init(businessId: businessId!);
    } else {
      showErrorSnackBar(errorText: "businessId is null");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (viewController.isBusinessLoaded) {
        return CustomScrollView(
          slivers: [
            CustBusinessViewAppbar(viewController: viewController),
            SliverToBoxAdapter(
              child: Container(
                height: 1200,
              ),
            )
          ],
        );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading', style: context.textTheme.bodyMedium
                  //   ?.copyWith(color: pr),
                  ),
            ],
          ),
        );
      }
    }));
  }
}
