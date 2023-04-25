import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustFoodWrapper extends StatefulWidget {
  const CustFoodWrapper({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custFoodWrapperRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustFoodWrapper> createState() => _CustFoodWrapperState();
}

class _CustFoodWrapperState extends State<CustFoodWrapper> {
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
                  CustFoodListView.navigate(
                    serviceCategory: ServiceCategory1.Uncategorized,
                  );
                },
                content: Text(
                  "Restaurant",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustFoodListView.navigate(
                    serviceCategory: ServiceCategory1.Uncategorized,
                  );
                },
                content: Text(
                  "Farmers",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustFoodListView.navigate(
                    serviceCategory: ServiceCategory1.Uncategorized,
                  );
                },
                content: Text(
                  "Locally Made",
                  style: context.textTheme.displayLarge,
                )),
            MezCard(
                onClick: () {
                  CustFoodListView.navigate(
                    serviceCategory: ServiceCategory1.MealPlanning,
                  );
                },
                content: Text(
                  "Meal Planning",
                  style: context.textTheme.displayLarge,
                )),
          ],
        ),
      ),
    );
  }
}
