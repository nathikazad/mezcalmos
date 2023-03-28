import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/ROpPastOrdersList.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/controllers/ROpCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ClosedServiceProviderWidget.dart';
import 'package:mezcalmos/Shared/widgets/ServiceProviders/ServiceWaitingForApproval.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class ROpCurrentOrdersListView extends StatefulWidget {
  const ROpCurrentOrdersListView({Key? key, this.canGoBack = true})
      : super(key: key);
  final bool canGoBack;

  @override
  State<ROpCurrentOrdersListView> createState() =>
      _ROpCurrentOrdersListViewState();
}

class _ROpCurrentOrdersListViewState extends State<ROpCurrentOrdersListView> {
  ROpCurrentOrdersController viewController = ROpCurrentOrdersController();

  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
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
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: ROpDrawer(),
        body: Obx(() {
          if (viewController.initalized.isFalse) {
            return MezLogoAnimation(
              centered: true,
            );
          } else if (viewController.isAproved == false) {
            return ServiceWaitingForApproval();
          } else if (viewController.isClosedIdf) {
            return ClosedServiceProviderWidget(
              openCallBack: viewController.turnOnOrders,
            );
          } else {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: TitleWithOnOffSwitcher(
                    title: "${_i18n()['incomingOrders']}",
                    onTurnedOn: () {
                      viewController.turnOnOrders();
                    },
                    onTurnedOff: () {
                      viewController.turnOffOrders();
                    },
                    initialSwitcherValue: viewController.isOpen,
                  ),
                ),
                Container(
                    child: (viewController.isOpen)
                        ? _inProcessOrders()
                        : _offlineWidget()),
              ],
            );
          }
        }),
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

  Widget _inProcessOrders() {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text('${_i18n()["currentOrders"]}'.inCaps,
                        style: context.txt.bodyLarge)),
                Flexible(
                  child: MezButton(
                    backgroundColor: secondaryLightBlueColor,
                    textColor: primaryBlueColor,
                    height: 32,
                    width: 35.w,
                    textStyle: Get.textTheme.bodyLarge
                        ?.copyWith(color: primaryBlueColor, fontSize: 11.sp),
                    // width: ,
                    borderRadius: 35,
                    label: '${_i18n()["pastButton"]}'.inCaps,
                    onClick: () async {
                      await ROpPastOrdersList.navigate();
                    },
                  ),
                ),
              ],
            ),
          ),
          viewController.currentOrders.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          viewController.currentOrders.length, (int index) {
                        return MinimalOrderCard(
                          order: viewController.currentOrders[index],
                          onTap: () {
                            RestaurantOrderView.navigate(
                                orderId: viewController.currentOrders[index].id
                                    .toString());
                          },
                        );
                      }),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent())),
        ],
      ),
    );
  }
}
