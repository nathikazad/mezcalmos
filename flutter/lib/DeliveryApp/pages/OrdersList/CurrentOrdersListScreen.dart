import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DvConvoCard.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  DriverCurrentOrdersController viewController =
      DriverCurrentOrdersController();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    if (_deliveryAuthController.driverState?.isAuthorized == true) {
      Get.find<SideMenuDrawerController>().pastOrdersRoute =
          DeliveryAppRoutes.kPastOrdersViewRoute;
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
            ordersRoute: DeliveryAppRoutes.kPastOrdersViewRoute),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => SwitchListTile.adaptive(
                  title: Text(
                    "Incoming Orders",
                    style: context.textTheme.bodyLarge,
                  ),
                  activeColor: primaryBlueColor,
                  value: viewController.isOnline,
                  onChanged: (bool v) {
                    viewController.switchOnlineStatus(v);
                  }),
            ),
            Obx(
              () => SingleChildScrollView(
                child: (viewController.currentOrders.isNotEmpty ||
                        viewController.openOrders.isNotEmpty)
                    ? Column(
                        children: [
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
        children: [
          Text.rich(TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.route_rounded,
                    color: primaryBlueColor,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text:
                        "Current Orders (${viewController.currentOrders.length})"),
              ],
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: primaryBlueColor))),
          meduimSeperator,
          Column(
            children:
                List.generate(viewController.currentOrders.length, (int index) {
              final DeliveryMessage message =
                  viewController.currentOrders[index];
              return DvConvoCard(
                message: message,
                onClick: () {
                  DvConvoView.navigate(phoneNumber: message.phoneNumber);
                },
              );
            }),
          ),
          Divider(),
          MezInkwell(
            label: "Mark all orders as finished",
            backgroundColor: secondaryLightBlueColor,
            textColor: primaryBlueColor,
            icon: Icons.arrow_forward,
            onClick: () async {
              await showConfirmationDialog(context,
                  title: "Mark all orders as finished",
                  helperText: '',
                  primaryButtonText: "Yes, finish orders",
                  secondaryButtonText: "Cancel",
                  primaryColor: primaryBlueColor,
                  icon: Icons.done_all_rounded, onYesClick: () async {
                await viewController.finishAllOrders();
              });
            },
          )
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
        children: [
          Text.rich(TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.hourglass_empty_rounded,
                    color: Colors.purple,
                  ),
                ),
                WidgetSpan(child: hTinySepartor),
                TextSpan(
                    text: "Open Orders (${viewController.openOrders.length})"),
              ],
              style:
                  context.textTheme.bodyLarge?.copyWith(color: Colors.purple))),
          meduimSeperator,
          Column(
            children:
                List.generate(viewController.openOrders.length, (int index) {
              final DeliveryMessage message = viewController.openOrders[index];
              return DvConvoCard(
                message: message,
                onClick: () {
                  DvConvoView.navigate(phoneNumber: message.phoneNumber);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
