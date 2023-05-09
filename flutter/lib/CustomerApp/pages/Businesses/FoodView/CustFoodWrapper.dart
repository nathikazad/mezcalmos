import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/FoodView/CustFoodListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['FoodView']['CustFoodWrapper'];

class CustFoodWrapper extends StatefulWidget {
  const CustFoodWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custFoodWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustFoodWrapper> createState() => _CustFoodWrapperState();
}

class _CustFoodWrapperState extends State<CustFoodWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
    mezDbgPrint("food serviceTree $serviceTree");
  }

  void navigateToListView(MezService mezService) {
    switch (mezService) {
      case MezService.Restaurants:
        CustRestaurantListView.navigate();
        break;
      case MezService.Farmers:
        CustFoodListView.navigate(
          serviceCategory: ServiceCategory1.Uncategorized,
        );
        break;
      case MezService.LocallyMade:
        CustFoodListView.navigate(
          serviceCategory: ServiceCategory1.Uncategorized,
        );
        break;
      case MezService.MealPlanning:
        CustFoodListView.navigate(
          serviceCategory: ServiceCategory1.MealPlanning,
        );
        break;
    }
  }

  String getCardImage(MezService mezService) {
    switch (mezService) {
      case MezService.Restaurants:
        return aRestaurant;
      case MezService.Farmers:
        return aFarmers;
      case MezService.LocallyMade:
        return aLocallyMade;
      case MezService.MealPlanning:
        return aMealPrep;
    }
    return aUncategorized;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: _i18n()['food'],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            serviceTree.length,
            (int index) => ServicesCard(
              onTap: () {
                navigateToListView(serviceTree[index].name);
              },
              url: getCardImage(serviceTree[index].name),
              title: _i18n()[serviceTree[index].name.toFirebaseFormatString()]
                  ['title'],
              subtitle:
                  _i18n()[serviceTree[index].name.toFirebaseFormatString()]
                      ['description'],
            ),
          ),
        ),
      ),
    );
  }
}
