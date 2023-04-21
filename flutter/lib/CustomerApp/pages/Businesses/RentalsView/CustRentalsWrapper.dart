import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustRentalsListView.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper']['rental'];

//TO DO
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
        title: '${_i18n()['title']}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MezCard(
                onClick: () {
                  CustRentalsListView.navigate(category: RentalCategory1.Surf);
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_i18n()['surf']['title']}',
                      style: context.textTheme.displayMedium,
                    ),
                    Text(
                      '${_i18n()['surf']['description']}',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                action: Image.asset(
                  'assets/images/customer/rental/surf.png',
                  width: 25.mezW,
                  height: 20.mezW,
                )),
            MezCard(
                margin: EdgeInsets.only(top: 5),
                onClick: () {
                  CustRentalsListView.navigate(
                      category: RentalCategory1.Vehicle);
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_i18n()['vehicle']['title']}',
                      style: context.textTheme.displayMedium,
                    ),
                    Text(
                      '${_i18n()['vehicle']['description']}',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                action: Image.asset(
                  'assets/images/customer/rental/carRental.png',
                  width: 25.mezW,
                  height: 20.mezW,
                )),
            MezCard(
                margin: EdgeInsets.only(top: 5),
                onClick: () {
                  CustRentalsListView.navigate(category: RentalCategory1.Home);
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_i18n()['homes']['title']}',
                      style: context.textTheme.displayMedium,
                    ),
                    Text(
                      '${_i18n()['homes']['description']}',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                action: Image.asset(
                  'assets/images/customer/rental/homes.png',
                  width: 25.mezW,
                  height: 20.mezW,
                )),
          ],
        ),
      ),
    );
  }
}
