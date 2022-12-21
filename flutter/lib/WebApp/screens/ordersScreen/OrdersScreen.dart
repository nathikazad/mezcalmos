import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/ordersScreen/orderViewScreen/components/OnGoingOrderList.dart';

import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/ordersScreen/orderViewScreen/components/PastListOrders.dart';

import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  /// GEt OrderController
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();

    //OrderController controller = Get.put(OrderController());

    /// GEt AuthController
    // FirbaseAuthController auth = Get.find<FirbaseAuthController>();
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
                await Get.put(OrderController(), permanent: true);
              }),
          builder: (context, snapShot) {
            final MezWebSideBarController drawerController =
                Get.find<MezWebSideBarController>();
            drawerController.drawerKey = _key;
            if (Get.isRegistered<OrderController>()) {
              Get.put(OrderController(), permanent: true);
            }
            if (snapShot.hasData && snapShot.data == true) {
              Get.put<AppLifeCycleController>(
                AppLifeCycleController(logs: true),
                permanent: true,
              );
              return Scaffold(
                key: drawerController.drawerKey,
                appBar: InstallAppBarComponent(),
                drawer: drawerController.endDrawerContent,
                bottomNavigationBar: MezBottomBar(),
                body: LayoutBuilder(builder: (context, constraints) {
                  return Scaffold(
                    appBar: (MezCalmosResizer.isMobile(context) ||
                            MezCalmosResizer.isSmallMobile(context))
                        ? null
                        : WebAppBarComponent(
                            automaticallyGetBack: false,
                            type: WebAppBarType.WithCartActionButton.obs,
                            // leadingFunction: () {
                            //   _key.currentState!.openDrawer();
                            // },
                          ),
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
  OrderController controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("=========== ${controller.currentOrders.value.length}");
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MezCalmosResizer.getWepPageHorizontalPadding(context)),
          child: isMoboleScreen(context)
              ? Column(
                  children: [
                    if (controller.currentOrders.isNotEmpty)
                      OngoingOrderList(
                        txt: txt,
                        controller: controller,
                        isWebVersion: true,
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    if (controller.pastOrders.isNotEmpty)
                      PastListOrders(txt: txt, controller: controller),
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
                          if (controller.currentOrders.isNotEmpty)
                            OngoingOrderList(
                              txt: txt,
                              controller: controller,
                              isWebVersion: true,
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
                          if (controller.pastOrders.isNotEmpty)
                            PastListOrders(txt: txt, controller: controller),
                        ],
                      ),
                    ))
                  ],
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
