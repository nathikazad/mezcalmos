import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['RentalsView']['CustRentalWrapper'];

//TO DO
class CustRentalWrapper extends StatefulWidget {
  const CustRentalWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custRentalsWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustRentalWrapper> createState() => _CustRentalWrapperState();
}

class _CustRentalWrapperState extends State<CustRentalWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  void navigateToListView(MezService mezService) {
    switch (mezService) {
      case MezService.Surf:
        CustRentalsListView.navigate(category: RentalCategory1.Surf);
        return;
      case MezService.Vehicle:
        CustRentalsListView.navigate(category: RentalCategory1.Vehicle);
        return;
      case MezService.Home:
        CustHomeRentalListView.navigate();
        return;
    }
  }

  String getCardImage(MezService mezService) {
    switch (mezService) {
      case MezService.Surf:
        return aSurf;
      case MezService.Vehicle:
        return aVehicle;
      case MezService.Home:
        return aHomes;
    }
    return aUncategorized;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()['rentals']}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            serviceTree.length,
            (int index) {
              final MezService currentService = serviceTree[index].name;
              return ServicesCard(
                onTap: () {
                  navigateToListView(serviceTree[index].name);
                },
                url: getCardImage(serviceTree[index].name),
                title:
                    '${_i18n()[serviceTree[index].name.toFirebaseFormatString()]['title']}',
                subtitle:
                    '${_i18n()[serviceTree[index].name.toFirebaseFormatString()]['description']}',
              );
            },
          ),
        ),
      ),
    );
  }
}
