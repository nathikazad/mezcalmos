import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksNative.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/CustomerApp/theme.dart';
import 'package:mezcalmos/Shared/appStart/appStartNative.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = CustomerAuthHooksNative.onSignInHook;
Function signOutCallback = CustomerAuthHooksNative.onSignOutHook;
List<QRoute> routes =
    XRouter.mainRoutes + NativeOnlyRoutes.routes + SharedRoutes.qRoutes;

List<SideMenuItem> sideMenuItems = <SideMenuItem>[
  SideMenuItem(
    onClick: () {
      CustCardsListView.navigate();
    },
    icon: Icons.credit_card,
    title: "CustomerApp/main/savedCards",
    isI18nPath: true,
  ),
  SideMenuItem(
    onClick: () {
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
          return StartingPointNative(
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
