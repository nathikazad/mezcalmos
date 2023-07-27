import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/FloatingCartComponent.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/ServicesViews/CustServicesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundriesList/CustLaundriesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
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
    ['pages']['Businesses']['ServicesViews']['CustServicesWrapper'];

class CustServicesWrapper extends StatefulWidget {
  const CustServicesWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custServicesWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustServicesWrapper> createState() => _CustServicesWrapperState();
}

class _CustServicesWrapperState extends State<CustServicesWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  Future<void> navigateToListView(MezService mezService) async {
    int? orderId = await get_customer_last_order_id(
        customerId: Get.find<AuthController>().hasuraUserId!,
        orderType: mezService.toOrderType());
    mezDbgPrint(
        "checking if there is orders ${mezService.toOrderType()} ========>$orderId");
    if (orderId != null && orderId > 0) {
      switch (mezService) {
        case MezService.Courier:
          await CustCourierOrderView.navigate(orderId: orderId);
          break;
        case MezService.Restaurants:
          await ViewRestaurantOrderScreen.navigate(orderId: orderId);
          break;
        case MezService.Laundry:
          await CustLaundryOrderView.navigate(orderId: orderId);
          break;
        default:
          await MezRouter.back(backResult: true);
      }
      return;
    }

    switch (mezService) {
      case MezService.Cleaning:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Cleaning,
        );
        break;
      case MezService.MealPlanning:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.MealPlanning,
        );
        break;
      case MezService.PetSitting:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.PetSitting,
        );
        break;
      case MezService.Photography:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Photography,
        );
        break;
      case MezService.Beauty:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Beauty,
        );
        break;
      case MezService.Tattoo:
        await CustServicesListView.navigate(
          serviceCategory: ServiceCategory1.Tattoo,
        );
        break;
      case MezService.Laundry:
        await CustLaundriesListView.navigate();
        break;
    }
  }

  String getCardImage(MezService mezService) {
    switch (mezService) {
      case MezService.Cleaning:
        return aCleaning;
      case MezService.MealPlanning:
        return aMealPrep;
      case MezService.PetSitting:
        return aPetSitting;
      case MezService.Beauty:
        return aBeauty;
      case MezService.Photography:
        return aPhotography;
      case MezService.Tattoo:
        return aTattoo;
      case MezService.Laundry:
        return aCleaning;
      default:
        return aUncategorized;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        actionIcons: [
          FloatingCartComponent(
            cartType: CartType.business,
          ),
        ],
        onClick: MezRouter.back,
        title: _i18n()['services'],
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
              title:
                  '${_i18n()[serviceTree[index].name.toFirebaseFormatString()]['title']}',
              subtitle:
                  '${_i18n()[serviceTree[index].name.toFirebaseFormatString()]['description']}',
            ),
          ),
        ),
      ),
    );
  }
}
