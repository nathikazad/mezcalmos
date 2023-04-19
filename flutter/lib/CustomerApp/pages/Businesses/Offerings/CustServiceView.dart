import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';

class CustServiceView extends StatefulWidget {
  const CustServiceView({super.key});
  static Future<void> navigate({required int serviceId}) async {
    final String route =
        CustBusinessRoutes.custServiceRoute.replaceFirst(":id", "$serviceId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustServiceView> createState() => _CustServiceViewState();
}

class _CustServiceViewState extends State<CustServiceView> {
  CustServiceViewController viewController = CustServiceViewController();
  int? serviceId;
  @override
  void initState() {
    serviceId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init service view with id => $serviceId");
    if (serviceId != null) {
      viewController.fetchData(serviceId: serviceId!);
    } else {
      showErrorSnackBar(errorText: "Error: Service ID $serviceId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.service != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.service!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.service!.details.name[userLanguage] ??
                            "Error",
                        style: context.textTheme.displayMedium,
                      ),
                      // todo @ChiragKr04 complete the view with the needed data
                      CustBusinessMessageCard(
                        business: viewController.service!.business,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }
}
