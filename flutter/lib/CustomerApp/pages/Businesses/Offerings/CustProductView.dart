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
                      // todo @ChiragKr04 complete the view with the needed data
                      CustBusinessMessageCard(
                          business: viewController.product!.business),
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
