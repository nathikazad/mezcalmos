import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/TaxiApp/components/TaxiDriverOrderCard.dart';
import 'package:mezcalmos/TaxiApp/controllers/TaxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/OrdersList/controllers/TaxiDriverCurrentOrdersController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class TaxiCurrentOrdersListScreen extends StatefulWidget {
  @override
  _TaxiCurrentOrdersListScreenState createState() =>
      _TaxiCurrentOrdersListScreenState();
}

class _TaxiCurrentOrdersListScreenState
    extends State<TaxiCurrentOrdersListScreen> {
  TaxiCurrentOrdersController viewController = TaxiCurrentOrdersController();
  TaxiAuthController _TaxiAuthController = Get.find<TaxiAuthController>();

  @override
  void initState() {
    if (_TaxiAuthController.driverState?.isAuthorized == true) {
      Get.find<SideMenuDrawerController>().pastOrdersRoute =
          TaxiAppRoutes.kPastOrdersViewRoute;
    }

    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
            showNotifications: true,
            ordersRoute: TaxiAppRoutes.kPastOrdersViewRoute),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(
              () => SwitchListTile.adaptive(
                  title: Text(
                    _i18n()['title'],
                    style: context.textTheme.bodyLarge,
                  ),
                  activeColor: primaryBlueColor,
                  value: viewController.isOnline,
                  onChanged: (bool v) {
                    viewController.switchOnlineStatus(v);
                  }),
            ),
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: (viewController.currentOrders.isNotEmpty ||
                          viewController.openOrders.isNotEmpty)
                      ? Column(
                          children: <Widget>[
                            if (viewController.currentOrders.isNotEmpty)
                              _currentOrders(context),
                            if (viewController.openOrders.isNotEmpty)
                              _openOrders(context),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 17.5.h),
                          child: NoOrdersComponent()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentOrders(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(color: secondaryLightBlueColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text.rich(TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.route_rounded,
                    color: primaryBlueColor,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text:
                        "${_i18n()['currentOrders']} (${viewController.currentOrders.length})"),
              ],
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: primaryBlueColor))),
          meduimSeperator,
          Column(
            children:
                List.generate(viewController.currentOrders.length, (int index) {
              final TaxiOrder order = viewController.currentOrders[index];
              return TaxiDriverOrderCard(
                order: order,
                onClick: () {
                  viewController.handleNavigation(orderId: order.id);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Container _openOrders(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(color: Colors.purple.shade100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(
              children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.hourglass_empty_rounded,
                    color: Colors.purple,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text:
                        "${_i18n()['openOrders']} (${viewController.openOrders.length})"),
              ],
              style:
                  context.textTheme.bodyLarge?.copyWith(color: Colors.purple))),
          meduimSeperator,
          Column(
            children:
                List.generate(viewController.openOrders.length, (int index) {
              final TaxiOrder order = viewController.openOrders[index];
              return TaxiDriverOrderCard(
                order: order,
                onClick: () {
                  viewController.handleNavigation(orderId: order.id);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}