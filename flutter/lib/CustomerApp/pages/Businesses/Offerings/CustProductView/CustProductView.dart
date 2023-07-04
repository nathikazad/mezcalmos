import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustProductView/controllers/CustProductViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessInquryBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustProductView extends StatefulWidget {
  const CustProductView({super.key});
  static Future<void> navigate({required int productId}) async {
    final String route =
        CustBusinessRoutes.custProductRoute.replaceFirst(":id", "$productId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustProductView> createState() => _CustProductViewState();
}

class _CustProductViewState extends State<CustProductView> {
  CustProductViewController viewController = CustProductViewController();
  int? productId;
  @override
  void initState() {
    productId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init product view with id => $productId");
    if (productId != null) {
      viewController.fetchData(productId: productId!);
    } else {
      showErrorSnackBar(errorText: "Error: Product ID $productId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => viewController.isOnlineOrdering.value!
            ? MezButton(
                label: "Add to cart",
                withGradient: true,
                borderRadius: 0,
                onClick: () async {
                  await viewController.bookOffering();
                },
              )
            : SizedBox.shrink(),
      ),
      body: Obx(() {
        if (viewController.product != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.product!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.product!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${viewController.product!.details.cost.entries.first.value.toPriceString()}",
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: primaryBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _description(context),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        business: viewController.product!.business,
                        offering: viewController.product!.details,
                      ),
                      if (!viewController.isOnlineOrdering.value!)
                        CustBusinessNoOrderBanner(),
                      if (viewController.isOnlineOrdering.value!)
                        CustBusinessInquryBanner(),
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

  Column _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          _i18n()['description'],
          style: context.textTheme.bodyLarge,
        ),
        Text(
          viewController.product!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
