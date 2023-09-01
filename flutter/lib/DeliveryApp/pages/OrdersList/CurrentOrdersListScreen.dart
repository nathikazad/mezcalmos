import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DvConvoCard.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart' as assets;
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
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
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TitleWithOnOffSwitcher(
                      title: "${_i18n()["title"]}",
                      isLoading: viewController.onlineClicked.value,
                      onTurnedOn: () {
                        HapticFeedback.lightImpact();
                        SystemSound.play(SystemSoundType.click);
                        viewController.switchOnlineStatus(true);
                      },
                      onTurnedOff: () {
                        HapticFeedback.lightImpact();
                        SystemSound.play(SystemSoundType.click);
                        viewController.switchOnlineStatus(false);
                      },
                      initialSwitcherValue: viewController.isOnline),
                ),
                if (!viewController.isOnline)
                  Container(
                    height: 60.h,
                    child: IncomingOrdersStatus(
                      childData: Padding(
                        padding: const EdgeInsets.only(bottom: 17.0),
                        child: Image.asset(
                          assets.turnOn_asset,
                          fit: BoxFit.contain,
                          width: 40.w,
                          height: 25.h,
                        ),
                      ),
                      errorText: '${_i18n()["offlineTitle"]}',
                      secondLine: "${_i18n()["offlineBody"]}",
                    ),
                  )
                else if (viewController.resolvedMessages.isNotEmpty ||
                    viewController.unResolvedMessages.isNotEmpty)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        meduimSeperator,
                        Text(
                          "Resolved orders",
                          style: context.textTheme.bodyLarge,
                        ),
                        meduimSeperator,
                        Column(
                          children: List.generate(
                              viewController.resolvedMessages.length,
                              (int index) {
                            final WhMessage message =
                                viewController.resolvedMessages[index];
                            return DvConvoCard(
                              message: message,
                              onClick: () {},
                            );
                          }),
                        ),
                        meduimSeperator,
                        Row(
                          children: [
                            Text(
                              "Unresolved",
                              style: context.textTheme.bodyLarge,
                            ),
                            hTinySepartor,
                            Expanded(
                                child: Divider(
                              thickness: 0.2,
                            )),
                          ],
                        ),
                        meduimSeperator,
                        Column(
                          children: List.generate(
                              viewController.unResolvedMessages.length,
                              (int index) {
                            final WhMessage message =
                                viewController.unResolvedMessages[index];
                            return DvConvoCard(
                              message: message,
                              onClick: () {
                                DvConvoView.navigate(
                                    convo: viewController.resolvedMessages);
                              },
                            );
                          }),
                        )
                        // if (viewController.currentOrders.isNotEmpty)
                        //   _incomingOrdersList(),
                        // if (viewController.openOrders.isNotEmpty)
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //         padding: const EdgeInsets.only(
                        //             left: 15, right: 15, top: 10, bottom: 10),
                        //         child: Row(
                        //           children: [
                        //             Icon(Icons.hourglass_empty,
                        //                 color: purpleColor),
                        //             Text(
                        //               "${_i18n()["openOrders"]}(${viewController.openOrders.length})",
                        //               style: Theme.of(context)
                        //                   .textTheme
                        //                   .bodyLarge
                        //                   ?.copyWith(color: purpleColor),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(height: 5),
                        //       Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 15),
                        //         child: Column(
                        //           children: List.generate(
                        //               viewController.openOrders.length,
                        //               (int index) => MinimalOrderCard(
                        //                     borderRadius: BorderRadius.zero,
                        //                     order: viewController
                        //                         .openOrders[index],
                        //                     onTap: () {
                        //                       DvOrderView.navigate(
                        //                           orderId: viewController
                        //                               .openOrders[index].id);
                        //                     },
                        //                   )).reversed.toList(),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                      ],
                    ),
                  )
                else
                  Padding(
                      padding: EdgeInsets.only(top: 17.5.h),
                      child: NoOrdersComponent()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
