import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/orderRoute.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustHomeWrapper'];

class OrderViewPage extends StatefulWidget {
  const OrderViewPage({super.key});

  @override
  State<OrderViewPage> createState() => _OrderViewPageState();

  static Future<void> navigate() {
    return MezRouter.toPath(OrderRoutes.orderViewRoute);
  }
}

class _OrderViewPageState extends State<OrderViewPage> {
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(
          _i18n()[allServiceListViewController.currentSelectedService.value.name
              .toLowerCase()]["title"],
        ),
      ),
    );
  }
}
