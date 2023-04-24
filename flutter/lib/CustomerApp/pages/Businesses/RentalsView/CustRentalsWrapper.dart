import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustRentalWrapper extends StatefulWidget {
  const CustRentalWrapper({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custRentalsWrapperRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustRentalWrapper> createState() => _CustRentalWrapperState();
}

class _CustRentalWrapperState extends State<CustRentalWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Rentals",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MezCard(
                onClick: () {
                  CustRentalsListView.navigate(category: RentalCategory1.Surf);
                },
                content: Text(
                  "Surf",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustRentalsListView.navigate(
                      category: RentalCategory1.Vehicle);
                },
                content: Text(
                  "Vehicule",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustHomeRentalListView.navigate();
                },
                content: Text(
                  "Home",
                  style: context.textTheme.displayLarge,
                )),
          ],
        ),
      ),
    );
  }
}
