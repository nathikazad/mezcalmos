import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Courrier/CustCourrierServicesListView/CustCourrierServicesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundriesList/CustLaundriesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/graphql/common/hsCommon.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

import '../../../../CustomerOldStuff/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class DeliveryServiceView extends StatefulWidget {
  const DeliveryServiceView({super.key});

  @override
  State<DeliveryServiceView> createState() => _DeliveryServiceViewState();

  static Future<void> navigate({required List<ServiceTree> serviceTree}) {
    return MezRouter.toPath(XRouter.deliveryServicesRoute, arguments: <String, >{
      "serviceTree": serviceTree,
    });
  }
}

class _DeliveryServiceViewState extends State<DeliveryServiceView> {
  AuthController authController = Get.find<AuthController>();
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();

  late List<ServiceTree> serviceTree;

  @override
  void initState() {
    super.initState();
    serviceTree = MezRouter.bodyArguments!["serviceTree"] as List<ServiceTree>;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      // drawer: MezSideMenu(),
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        titleWidget: Text(_i18n()['delivery'].toString()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // const SizedBox(height: 10),
            // mezWelcomeContainer(
            //   Theme.of(context).textTheme.displayMedium!,
            // ),
            // mezDescription(txt.titleMedium!),
            // const SizedBox(height: 10),
            // mezServiceTitle(txt.displayMedium!),
            mezListOfServices(),
          ],
        ),
      ),
    );
  }

  Widget mezWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezDescription(TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => Text("${_i18n()['appDescription']}", style: textStyle),
      ),
    );
  }

  Widget mezServiceTitle(TextStyle textStyle) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(5),
      child: Obx(
        () => Text(
          "${_i18n()['services']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezListOfServices() {
    Future<void> navigateToListView(MezService mezService) async {
      if (Get.find<AuthController>().hasuraUserId != null) {
        final int? orderId = await get_customer_last_order_id(
            customerId: Get.find<AuthController>().hasuraUserId!,
            orderType: mezService.toOrderType());
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
      }
      switch (mezService) {
        case MezService.Food:
          unawaited(CustRestaurantListView.navigate());
          return;
        case MezService.Laundry:
          await CustLaundriesListView.navigate();
          return;
        case MezService.Courier:
          await CustCourierServicesListView.navigate();
          return;
        default:
          throw Exception("Invalid service");
      }
    }
    // function taht accepts MezService and return order type

    String getCardImage(MezService mezService) {
      switch (mezService) {
        case MezService.Food:
          return "assets/images/customer/foodService.png";
        case MezService.Laundry:
          return 'assets/images/customer/laundryService.png';
        case MezService.Courier:
          return 'assets/images/customer/courrierService.png';
      }
      return 'assets/images/customer/laundryService.png';
    }

    return Column(
      children: List.generate(
        serviceTree.length,
        (int index) {
          final MezService currentService = serviceTree[index].name;
          return Obx(
            () => ServicesCard(
              title: "${_i18n()[currentService.name.toLowerCase()]["title"]}",
              url: getCardImage(currentService),
              subtitle:
                  "${_i18n()[currentService.name.toLowerCase()]["subtitle"]}",
              onTap: () {
                navigateToListView(currentService);
              },
            ),
          );
        },
      ),
      // [
      //   Obx(
      //     () => ServicesCard(
      //       title: "${_i18n()['food']["title"]}",
      //       url: "assets/images/customer/foodService.png",
      //       subtitle: "${_i18n()['food']["subtitle"]}",
      //       onTap: () {
      //         CustRestaurantListView.navigate();
      //       },
      //     ),
      //   ),
      //   Obx(
      //     () => ServicesCard(
      //       title: "${_i18n()['laundry']["title"]}",
      //       subtitle: "${_i18n()['laundry']["subtitle"]}",
      //       url: "assets/images/customer/laundryService.png",
      //       onTap: () {
      //         CustLaundriesListView.navigate();
      //       },
      //     ),
      //   ),
      //   ServicesCard(
      //     title: "${_i18n()['courier']["title"]}",
      //     url: "assets/images/customer/courrierService.png",
      //     subtitle: "${_i18n()['courier']["subtitle"]}",
      //     onTap: () {
      //       CustCourierServicesListView.navigate();
      //     },
      //   ),
      // ],
    );
  }

  Future<void> getServiceRoute(
      {required OrderType orderType,
      required Future<void> Function() serviceRoute,
      required void Function(int) singleOrderRoute}) async {
    // if (Get.find<AuthController>().fireAuthUser != null &&
    //     _orderController != null) {
    //   if (_orderController!.firstOrderIdBasedOnType(orderType) != null) {
    //     singleOrderRoute(_orderController!.firstOrderIdBasedOnType(orderType)!);
    //   } else {
    //     await serviceRoute();
    //   }
    // } else {
    //   await serviceRoute();
    // }
  }
}
