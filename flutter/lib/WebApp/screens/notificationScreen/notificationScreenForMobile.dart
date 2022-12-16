import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/WebAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/notificationScreen/notificationPopUpWidget.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';

class NotificationScreenForMobile extends StatelessWidget {
  const NotificationScreenForMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setupFirebase(
          launchMode: typeMode.toLaunchMode(),
        ),
        builder: (context, snapShot) {
          final FirbaseAuthController _authcontroller =
              Get.find<FirbaseAuthController>();
          final MezWebSideBarController drawerController =
              Get.find<MezWebSideBarController>();
          if (snapShot.hasData && snapShot.data == true) {
            return Obx(
              () => Scaffold(
                appBar: InstallAppBarComponent(),
                bottomNavigationBar: MezBottomBar(),
                body: Scaffold(
                    key: drawerController.drawerKey,
                    drawer: drawerController.frontDrawerContent,
                    appBar: WebAppBarComponent(
                      type: _authcontroller.fireAuthUser?.uid != null
                          ? WebAppBarType.WithCartActionButton.obs
                          : WebAppBarType.WithSignInActionButton.obs,
                    ),
                    body: NotificationPopUpWidget()),
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: MezLoaderWidget()),
            );
          }
        });
  }
}
