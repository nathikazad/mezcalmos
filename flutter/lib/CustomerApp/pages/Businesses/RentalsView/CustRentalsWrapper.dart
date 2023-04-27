import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper']['rental'];

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
        return 'assets/images/customer/rental/surf.png';
      case MezService.Vehicle:
        return 'assets/images/customer/rental/carRental.png';
      case MezService.Home:
        return 'assets/images/customer/rental/homes.png';
    }
    return 'assets/images/customer/rental/homes.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: '${_i18n()['title']}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            serviceTree.length,
            (int index) {
              final MezService currentService = serviceTree[index].name;
              return MezCard(
                onClick: () {
                  navigateToListView(currentService);
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_i18n()[currentService.name.toLowerCase()]['title']}',
                      style: context.textTheme.displayMedium,
                    ),
                    Text(
                      '${_i18n()[currentService.name.toLowerCase()]['description']}',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                action: Image.asset(
                  getCardImage(currentService),
                  width: 25.mezW,
                  height: 20.mezW,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
