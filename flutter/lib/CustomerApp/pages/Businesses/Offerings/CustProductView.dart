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
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';

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
                        viewController.product!.details.name[userLanguage] ??
                            "Error",
                        style: context.textTheme.displayMedium,
                      ),
                      Text(
                        "\$${viewController.product!.details.cost.entries.first.value}",
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: primaryBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Description",
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        viewController
                                .product!.details.description?[userLanguage] ??
                            "No Desription",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      CustBusinessMessageCard(
                          business: viewController.product!.business),
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
