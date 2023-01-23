import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerInprocessOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerPastOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';

import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/WebAppBarComponent.dart';

import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/MezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

class CustOrdersView extends StatefulWidget {
  CustOrdersView({Key? key}) : super(key: key);

  @override
  State<CustOrdersView> createState() => _CustOrdersViewState();
}

class _CustOrdersViewState extends State<CustOrdersView> {
  /// GEt OrderController
  final MezWebSideBarController mezWebSideBarController =
      MezWebSideBarController();
  @override
  void initState() {
    super.initState();

    //OrderController controller = Get.put(OrderController());

    /// GEt AuthController
    // AuthController auth = Get.find<AuthController>();
    //
    // mezDbgPrint(
    //   "ListOrdersScreen: onInit current : ${controller.currentOrders.length} past : ${controller.pastOrders.length}",
    // );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: setupFirebase(
              launchMode: typeMode.toLaunchMode(),
              func: () async {
                // if (Get.isRegistered<OrderController>()) {
                //   await Get.put(OrderController(), permanent: true);
                // }
              }),
          builder: (context, snapShot) {
            if (snapShot.hasData && snapShot.data == true) {
              Get.put<AppLifeCycleController>(
                AppLifeCycleController(),
                permanent: true,
              );
              return Scaffold(
                key: mezWebSideBarController.drawerKey,
                appBar: InstallAppBarComponent(),
                endDrawer: mezWebSideBarController.endDrawerContent,
                drawer: mezWebSideBarController.frontDrawerContent,
                bottomNavigationBar: MezBottomBar(),
                body: LayoutBuilder(builder: (context, constraints) {
                  return Scaffold(
                    // appBar: (MezCalmosResizer.isMobile(context) ||
                    //         MezCalmosResizer.isSmallMobile(context))
                    //     ? null
                    //     : WebAppBarComponent(
                    //         mezWebSideBarController: mezWebSideBarController,
                    //         automaticallyGetBack: true,
                    //         type: WebAppBarType.WithCartActionButton.obs,
                    //         // leadingFunction: () {
                    //         //   _key.currentState!.openDrawer();
                    //         // },
                    //       ),
                    body: OrdersScreeForDesktop(),
                  );
                }),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

class OrdersScreeForDesktop extends StatefulWidget {
  OrdersScreeForDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<OrdersScreeForDesktop> createState() => _OrdersScreeForDesktopState();
}

class _OrdersScreeForDesktopState extends State<OrdersScreeForDesktop> {
  CustomerOrdersListViewController viewController =
      CustomerOrdersListViewController();

  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // OrderController controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    // mezDbgPrint("=========== ${controller.currentOrders.value.length}");
    final TextTheme txt = Theme.of(context).textTheme;

    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MezCalmosResizer.getWepPageHorizontalPadding(context)),
            child: isMoboleScreen(context)
                ? Column(
                    children: [
                      if (viewController.currentOrders.isNotEmpty)
                        CustomerInprocessOrdersList(
                          txt: txt,
                          isWebVersion: true,
                          viewController: viewController,
                        ),
                      SizedBox(
                        height: 15,
                      ),
                      if (viewController.pastOrders.isNotEmpty)
                        CustomerPastOrdersList(
                          txt: txt,
                          isWebVersion: true,
                          viewController: viewController,
                        ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            if (viewController.currentOrders.isNotEmpty)
                              CustomerInprocessOrdersList(
                                txt: txt,
                                isWebVersion: true,
                                viewController: viewController,
                              ),
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            if (viewController.pastOrders.isNotEmpty)
                              CustomerPastOrdersList(
                                txt: txt,
                                isWebVersion: true,
                                viewController: viewController,
                              ),
                          ],
                        ),
                      ))
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

bool isMoboleScreen(BuildContext context) {
  /// if the screen is mobile we return true
  if (MezCalmosResizer.isMobile(context) ||
      MezCalmosResizer.isSmallMobile(context)) {
    return true;
  } else {
    return false;
  }
}
