import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/ServicesCard.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustCourierOrderView/CustCourierOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Courrier/CustCourrierServicesListView/CustCourrierServicesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/CustOrderListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/LaundriesList/CustLaundriesListView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Laundry/LaundryCurrentOrderView/CustLaundryOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/AllServiceListView/controllers/AllServiceListViewController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class DeliveryServiceView extends StatefulWidget {
  const DeliveryServiceView({super.key});

  @override
  State<DeliveryServiceView> createState() => _DeliveryServiceViewState();

  static Future<void> navigate() {
    return MezRouter.toPath(XRouter.deliveryServicesRoute);
  }
}

class _DeliveryServiceViewState extends State<DeliveryServiceView> {
  AuthController authController = Get.find<AuthController>();
  AllServiceListViewController allServiceListViewController =
      Get.find<AllServiceListViewController>();

  CustomerOrderController? _orderController;

  @override
  void initState() {
    super.initState();
    if (authController.fireAuthUser != null) {
      _orderController = Get.find<CustomerOrderController>();
    }
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
        titleWidget: Text(_i18n()[allServiceListViewController
                .currentSelectedService.value.name
                .toLowerCase()]
            .toString()),
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
    return Column(
      children: [
        Obx(
          () => ServicesCard(
            title: "${_i18n()['food']["title"]}",
            url: "assets/images/customer/foodService.png",
            subtitle: "${_i18n()['food']["subtitle"]}",
            onTap: () {
              getServiceRoute(
                  orderType: OrderType.Restaurant,
                  serviceRoute: CustRestaurantListView.navigate,
                  singleOrderRoute: (int orderId) {
                    ViewRestaurantOrderScreen.navigate(orderId: orderId);
                  });
            },
          ),
        ),
        Obx(
          () => ServicesCard(
            title: "${_i18n()['laundry']["title"]}",
            subtitle: "${_i18n()['laundry']["subtitle"]}",
            url: "assets/images/customer/laundryService.png",
            onTap: () {
              getServiceRoute(
                  orderType: OrderType.Laundry,
                  serviceRoute: CustLaundriesListView.navigate,
                  singleOrderRoute: (int orderId) {
                    CustLaundryOrderView.navigate(orderId: orderId);
                  });
            },
          ),
        ),
        ServicesCard(
          title: "Courier",
          url: "assets/images/customer/courrierService.png",
          subtitle: "Obtain delivery of anything you desire to your location.",
          onTap: () {
            getServiceRoute(
                orderType: OrderType.Courier,
                serviceRoute: CustCourierServicesListView.navigate,
                singleOrderRoute: (int orderId) {
                  CustCourierOrderView.navigate(orderId: orderId);
                });
          },
        ),
      ],
    );
  }

  Future<void> getServiceRoute(
      {required OrderType orderType,
      required Future<void> Function() serviceRoute,
      required void Function(int) singleOrderRoute}) async {
    if (Get.find<AuthController>().fireAuthUser != null &&
        _orderController != null) {
      if (_orderController!.firstOrderIdBasedOnType(orderType) != null) {
        singleOrderRoute(_orderController!.firstOrderIdBasedOnType(orderType)!);
      } else {
        await serviceRoute();
      }
    } else {
      await serviceRoute();
    }
  }

  Future<void> _navigateToOrdersIfNecessary() async {
    if (_orderController != null) {
      await _orderController!.fetchCurrentOrders();
      if (_orderController!.hasOneOrder) {
        switch (_orderController!.hasOneOrderType) {
          case OrderType.Restaurant:
            unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
                ViewRestaurantOrderScreen.navigate(
                    orderId: _orderController!.hasOneOrderId!)));
            break;
          case OrderType.Laundry:
            unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
                CustLaundryOrderView.navigate(
                    orderId: _orderController!.hasOneOrderId!)));
            break;
          case OrderType.Courier:
            unawaited(MezRouter.popEverythingTillBeforeHome().then((_) =>
                CustCourierOrderView.navigate(
                    orderId: _orderController!.hasOneOrderId!)));
            break;
          default:
        }
        // if (_orderController!.hasOneOrderType == OrderType.Restaurant) {
        //   // MezRouter.popEverythingAndNavigateTo(RestaurantOrderRoutes()
        //   //     .getRestaurantOrderRoute(_orderController!.hasOneOrderId!));
        //   // ignore: unawaited_futures
        //   MezRouter.popEverythingTillBeforeHome().then((_) =>
        //       ViewRestaurantOrderScreen.navigate(
        //           orderId: _orderController!.hasOneOrderId!));
        //   // } else if (_orderController!.hasOneOrderType == OrderType.Taxi) {
        //   //   MezRouter.popEverythingAndNavigateTo(
        //   //       getTaxiOrderRoute(_orderController!.hasOneOrderId!));
        // } else if (_orderController!.hasOneOrderType == OrderType.Laundry) {
        //   // ignore: unawaited_futures
        //   MezRouter.popEverythingTillBeforeHome().then((_) =>
        //       CustLaundryOrderView.navigate(
        //           orderId: _orderController!.hasOneOrderId!));
        // }
      } else if (_orderController!.hasManyOrders) {
        // ignore: unawaited_futures
        MezRouter.popEverythingTillBeforeHome()
            .then((_) => CustomerOrdersListView.navigate());
      }
    }
  }
}
