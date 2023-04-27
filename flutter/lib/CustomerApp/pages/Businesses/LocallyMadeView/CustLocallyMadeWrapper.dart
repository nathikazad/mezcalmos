import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/LocallyMadeView/CustLocallyMadeListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustLocallyMadeWrapper extends StatefulWidget {
  const CustLocallyMadeWrapper({super.key});
  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    final String route = CustBusinessRoutes.custLocallyMadeWrapperRoute;
    return MezRouter.toPath(route, arguments: {
      "serviceTree": serviceTree,
    });
  }

  @override
  State<CustLocallyMadeWrapper> createState() => _CustLocallyMadeWrapperState();
}

class _CustLocallyMadeWrapperState extends State<CustLocallyMadeWrapper> {
  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  void navigateToListView(MezService mezService) {
    switch (mezService) {
      case MezService.Consumable:
        CustLocallyMadeListView.navigate(
          productCategory: ProductCategory1.Consumable,
        );
        break;
      case MezService.PersonalCare:
        CustLocallyMadeListView.navigate(
          productCategory: ProductCategory1.PersonalCare,
        );
        break;
      case MezService.Art:
        CustLocallyMadeListView.navigate(
          productCategory: ProductCategory1.Art,
        );
        break;
    }
  }

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
          children: List.generate(
            serviceTree.length,
            (int index) => MezCard(
              onClick: () {
                navigateToListView(serviceTree[index].name);
              },
              content: Text(
                serviceTree[index].name.name,
                style: context.textTheme.displayLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
