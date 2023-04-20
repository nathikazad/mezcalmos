import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessBlueText.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessDescription.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';

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
          final Map<TimeUnit, num> costData =
              viewController.service!.details.cost;
          mezDbgPrint("costData: $costData");
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
                      viewController.service!.details.cost.length == 1
                          ? CustBusinessBlueText(
                              text:
                                  "\$${costData.entries.first.value}/${costData.entries.first.key.name.toString().toLowerCase().replaceAll("per", "")}",
                            )
                          : CustBusinessRentalCost(
                              cost: viewController.service!.details.cost,
                            ),
                      CustBusinessDescription(
                        description: viewController.service!.details.name,
                      ),
                      // CustBusinessScheduleBuilder(
                      //   schedule: viewController.service!.details.schedule,
                      //   scheduleType: ScheduleType.Scheduled,
                      // ),
                      CustBusinessMessageCard(
                        business: viewController.service!.business,
                      ),
                      CustBusinessNoOrderBanner(),
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
