import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

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
                        viewController.service!.details.name
                            .getTranslation(userLanguage),
                        style: context.textTheme.displayMedium,
                      ),
                      viewController.service!.details.cost.length == 1
                          ? Text(
                              "\$${costData.entries.first.value}/${costData.entries.first.key.name.toString().toLowerCase().replaceAll("per", "")}",
                              style: context.textTheme.bodyLarge!.copyWith(
                                color: primaryBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : CustBusinessRentalCost(
                              cost: viewController.service!.details.cost,
                            ),
                      Text(
                        _i18n()['description'],
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        viewController.service!.details.description
                                ?.getTranslation(userLanguage) ??
                            _i18n()['noDescription'],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustBusinessMessageCard(
                        business: viewController.service!.business,
                        offeringName: viewController.service!.details.name,
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
