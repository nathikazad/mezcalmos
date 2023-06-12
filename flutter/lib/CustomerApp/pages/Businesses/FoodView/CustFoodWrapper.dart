import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

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

  Future<void> navigateToListView(MezService mezService) async {
    if (Get.find<AuthController>().hasuraUserId != null) {
      int? orders = await get_customer_orders_by_type(
          customerId: Get.find<AuthController>().hasuraUserId!,
          orderType: mezService.toOrderType());
      if (orders != null && orders > 0) {
        await MezRouter.back(backResult: true);
        return;
      }
    }
    switch (mezService) {
      case MezService.Restaurants:
        unawaited(CustRestaurantListView.navigate());
        break;
      case MezService.LocallyMade:
        mezDbgPrint("going to locally made =======");
        unawaited(CustLocallyMadeListView.navigate(
          productCategories: [ProductCategory1.Consumable],
        ));
        break;
      case MezService.MealPlanning:
        unawaited(CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.MealPlanning,
        ));
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
