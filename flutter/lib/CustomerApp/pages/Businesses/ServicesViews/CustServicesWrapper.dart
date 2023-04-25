import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustServicesWrapper extends StatefulWidget {
  const CustServicesWrapper({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custServicesWrapperRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustServicesWrapper> createState() => _CustServicesWrapperState();
}

class _CustServicesWrapperState extends State<CustServicesWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "Services",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MezCard(
                onClick: () {
                  CustServicesListView.navigate(
                    serviceCategory: ServiceCategory1.Cleaning,
                  );
                },
                content: Text(
                  "Cleaning",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustServicesListView.navigate(
                    serviceCategory: ServiceCategory1.MealPlanning,
                  );
                },
                content: Text(
                  "Meal Planning",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustServicesListView.navigate(
                    serviceCategory: ServiceCategory1.PetSitting,
                  );
                },
                content: Text(
                  "Pet Sitting",
                  style: context.textTheme.displayLarge,
                )),
          ],
        ),
      ),
    );
  }
}
