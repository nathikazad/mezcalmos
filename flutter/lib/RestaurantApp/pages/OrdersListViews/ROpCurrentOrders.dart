import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/constants/assets.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/components/ROpOrderCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/controllers/ROpCurrentOrdersController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
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
    Get.delete<RestaurantInfoController>(force: true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack;
      },
      child: Obx(
        () {
          if (viewController.initalized.isTrue) {
            return Scaffold(
              appBar: mezcalmosAppBar(
                AppBarLeftButtonType.Menu,
                showNotifications: true,
              ),
              key: Get.find<SideMenuDrawerController>().getNewKey(),
              drawer: ROpDrawer(),
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: TitleWithOnOffSwitcher(
                      title: "Restaurant status",
                      onTurnedOn: () {
                        viewController.turnOnOrders();
                        // _restaurantOpAuthController.turnOpenOn();
                      },
                      onTurnedOff: () {
                        viewController.turnOffOrders();
                        //  _restaurantOpAuthController.turnOpenOff();
                      },
                      initialSwitcherValue: viewController.isOpen,
                    ),
                  ),
                  Container(
                      child: (viewController.isOpen)
                          ? _inProcessOrders()
                          : _offlineWidget()),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: MezLogoAnimation(
                centered: true,
              ),
            );
          }
        },
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Text('${_i18n()["currentOrders"]}'.inCaps,
                      style: Get.textTheme.bodyText1)),
              Flexible(
                child: MezButton(
                  backgroundColor: secondaryLightBlueColor,
                  textColor: primaryBlueColor,
                  height: 32,
                  //  width: 35.w,
                  borderRadius: 35,
                  label: '${_i18n()["pastButton"]}'.inCaps,
                  onClick: () async {
                    await Get.toNamed(kPastOrdersListView);
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: (viewController.currentOrders.value.isNotEmpty)
                ? Scrollbar(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: viewController.currentOrders.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int index) {
                          return ROpOrderCard(
                            order: viewController.currentOrders[index],
                          );
                        },
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 10.h),
                    alignment: Alignment.center,
                    child: Center(child: NoOrdersComponent()))),
      ],
    );
  }
}
