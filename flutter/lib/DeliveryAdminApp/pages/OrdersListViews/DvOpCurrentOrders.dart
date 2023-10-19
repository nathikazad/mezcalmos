import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/controllers/DvOpCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/DvConvoCard.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class DvOpCurrentOrdersListView extends StatefulWidget {
  const DvOpCurrentOrdersListView({Key? key, this.canGoBack = true})
      : super(key: key);
  final bool canGoBack;

  @override
  State<DvOpCurrentOrdersListView> createState() =>
      _DvOpCurrentOrdersListViewState();
}

class _DvOpCurrentOrdersListViewState extends State<DvOpCurrentOrdersListView> {
  DvOpCurrentOrdersController viewController = DvOpCurrentOrdersController();

  @override
  void initState() {
    mezDbgPrint("Current orders view =====================>>>>>>>>>>>>");
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
      onWillPop: () async {
        return widget.canGoBack;
      },
      child: Scaffold(
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Menu,
          showNotifications: true,
          ordersRoute: DeliveryAdminRoutes.kDeliveryOpPastOrdersRoute,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        body: Column(
          children: <Widget>[
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

  Container _offlineWidget() {
    return Container(
      height: 60.h,
      child: IncomingOrdersStatus(
        childData: Padding(
          padding: const EdgeInsets.only(bottom: 17.0),
          child: Image.asset(
            turnOn_asset,
            fit: BoxFit.contain,
            width: 40.w,
            height: 25.h,
          ),
        ),
        errorText: '${_i18n()["offlineTitle"]}',
        secondLine: "${_i18n()["offlineBody"]}",
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
              final DeliveryMinimalOrder message =
                  viewController.currentOrders[index];
              return DvConvoCard(
                message: message,
                onClick: () {
                  viewController.handleNavigation(order: message);
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
              final DeliveryMinimalOrder message =
                  viewController.openOrders[index];
              return DvConvoCard(
                message: message,
                onClick: () {
                  viewController.handleNavigation(order: message);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
