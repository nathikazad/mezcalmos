import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustLocallyMadeWrapper extends StatefulWidget {
  const CustLocallyMadeWrapper({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custLocallyMadeWrapperRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustLocallyMadeWrapper> createState() => _CustLocallyMadeWrapperState();
}

class _CustLocallyMadeWrapperState extends State<CustLocallyMadeWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Locally Made",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MezCard(
                onClick: () {
                  CustLocallyMadeListView.navigate(
                    productCategory: ProductCategory1.Consumable,
                  );
                },
                content: Text(
                  "Consumable",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustLocallyMadeListView.navigate(
                    productCategory: ProductCategory1.PersonalCare,
                  );
                },
                content: Text(
                  "Personal Care",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustLocallyMadeListView.navigate(
                    productCategory: ProductCategory1.Art,
                  );
                },
                content: Text(
                  "Art",
                  style: context.textTheme.displayLarge,
                )),
          ],
        ),
      ),
    );
  }
}
