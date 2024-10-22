import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpPastOrdersList.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/controllers/DvOpCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';
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
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        body: Obx(() {
          if (!viewController.hasData) {
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return _inProcessOrders();
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
    return SingleChildScrollView(
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
                    textStyle: context.txt.bodyLarge
                        ?.copyWith(color: primaryBlueColor, fontSize: 11.sp),
                    // width: ,
                    borderRadius: 35,
                    label: '${_i18n()["pastOrders"]}'.inCaps,
                    onClick: () async {
                      await DvOpPastOrdersView.navigate();
                    },
                  ),
                ),
              ],
            ),
          ),
          viewController.currentOrders.value!.isNotEmpty
              ? Column(
                  children: List.generate(
                      viewController.currentOrders.value!.length, (int index) {
                    return MinimalOrderCard(
                      order: viewController.currentOrders.value![index],
                      onTap: () {
                        DvCompanyOrderView.navigate(
                            orderId:
                                viewController.currentOrders.value![index].id);
                      },
                    );
                  }),
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
