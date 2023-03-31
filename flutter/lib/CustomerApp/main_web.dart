import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksBase.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart';
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/appStart/appStartWeb.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/MessagingScreen/BaseMessagingScreen.dart'
    deferred as baseMessagingScreen;
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

Function signInCallback = CustomerAuthHooksBase.onSignInHook;
Function signOutCallback = CustomerAuthHooksBase.onSignOutHook;
List<QRoute> routes = XRouter.mainRoutes +
    SharedRoutes.qRoutes +
    [
      QRoute(
          path: SharedRoutes.kMessagesRoute,
          name: SharedRoutes.kMessagesRoute,
          builder: () => baseMessagingScreen.BaseMessagingScreen(),
          middleware: <QMiddleware>[
            DefferedLoader(baseMessagingScreen.loadLibrary)
          ])
    ];
List<SideMenuItem> sideMenuItems = <SideMenuItem>[
  SideMenuItem(
    onClick: () {
      // Get.find<SideMenuDrawerController>().closeMenu();
      //  MezRouter.toNamed(kSavedCards);
      CustCardsListView.navigate();
    },
    icon: Icons.credit_card,
    title: "CustomerApp/main/savedCards",
    isI18nPath: true,
  ),
  SideMenuItem(
    onClick: () {
      // Get.find<SideMenuDrawerController>().closeMenu();
      SavedLocationView.navigate();
    },
    icon: Icons.near_me_outlined,
    title: "CustomerApp/main/savedLocations",
    isI18nPath: true,
  ),
];

void main() {
  runMainGuarded(
    () => runApp(
      Sizer(
        builder: (
          BuildContext context,
          Orientation orientation,
          DeviceType deviceType,
        ) {
          return StartingPointWeb(
            appType: AppType.Customer,
            appTheme: CustomerAppTheme.lightTheme,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            routes: routes,
            sideMenuItems: sideMenuItems,
            locationPermissionType: LocationPermissionType.Foreground,
          );
        },
      ),
    ),
  );
}
