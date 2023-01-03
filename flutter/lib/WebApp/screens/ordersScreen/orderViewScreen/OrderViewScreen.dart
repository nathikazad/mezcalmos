import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/components/installAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/ordersScreen/orderViewScreen/components/OrderViewScreenForDesktop.dart';
import 'package:mezcalmos/WebApp/screens/ordersScreen/orderViewScreen/components/OrderViewScreenForMobile.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/MezSnackbar.dart';
import 'package:mezcalmos/WebApp/widgets/SideWebBarWidget/SideWebBarWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';

class OrderViewScreen extends StatefulWidget {
  OrderViewScreen({Key? key}) : super(key: key);

  @override
  State<OrderViewScreen> createState() => _OrderViewScreenState();
}

class _OrderViewScreenState extends State<OrderViewScreen> {
  final MezWebSideBarController mezWebSideBarController =
      MezWebSideBarController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: setupFirebase(
            launchMode: typeMode.toLaunchMode(),
            func: () async {
              // if (Get.find<FirbaseAuthController>().fireAuthUser?.uid != null) {
              //   await Get.put<ForegroundNotificationsController>(
              //       ForegroundNotificationsController(),
              //       permanent: true);
              // }
            }),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            final LanguageController Lcontroller =
                Get.find<LanguageController>();
            final FirbaseAuthController _authcontroller =
                Get.find<FirbaseAuthController>();

            return Material(
              child: LayoutBuilder(builder: ((context, constraints) {
                return Scaffold(
                    key: mezWebSideBarController.drawerKey,
                    drawer: mezWebSideBarController.frontDrawerContent,
                    endDrawer: mezWebSideBarController.endDrawerContent,
                    appBar: InstallAppBarComponent(),
                    bottomNavigationBar: MezBottomBar(),
                    body: Scaffold(
                      appBar: WebAppBarComponent(
                        mezWebSideBarController: mezWebSideBarController,
                        automaticallyGetBack:
                            (MezCalmosResizer.isMobile(context) ||
                                    MezCalmosResizer.isSmallMobile(context))
                                ? false
                                : true,
                        type: _authcontroller.fireAuthUser?.uid != null
                            ? WebAppBarType.WithCartActionButton.obs
                            : WebAppBarType.WithSignInActionButton.obs,
                      ),
                      // body: Scaffold(),
                      body: (MezCalmosResizer.isMobile(context) ||
                              MezCalmosResizer.isSmallMobile(context))
                          ? OrderViewScreenForMobile()
                          : OrderViewScreenFordesktop(),
                    ));
              })),
            );
          } else {
            return Scaffold(body: Center(child: MezLoaderWidget()));
          }
        });
  }
}
