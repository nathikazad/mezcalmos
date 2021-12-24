import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mezcalmos/Shared/appStart.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/DeliveryAdminApp/authHooks.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

const String defaultDb = "test";
const String defaultLaunchMode = "stage";

Function signInCallback = AuthHooks.onSignInHook;
Function signOutCallback = AuthHooks.onSignOutHook;
List<GetPage<dynamic>> routes = XRouter.mainRoutes;

void main() {
  ScreenUtil.init(BoxConstraints(maxHeight: Get.height, maxWidth: Get.width));
  runMainGuarded(() => runApp(
        StartingPoint(
            appType: AppType.DeliveryAdminApp,
            signInCallback: signInCallback,
            signOutCallback: signOutCallback,
            routes: routes),
      ));
}
