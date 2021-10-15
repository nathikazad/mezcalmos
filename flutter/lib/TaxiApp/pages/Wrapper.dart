import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class Wrapper extends StatelessWidget with MezDisposable {
  @override
  Widget build(BuildContext context) {
    SettingsController _settingsController = Get.find<SettingsController>();

    Future.microtask(() => _settingsController.locationPermissionStream
            .distinct()
            .listen((locationPermission) {
          mezDbgPrint(
              "Inside Future.microtask(::locationListener::) => $locationPermission");
          if (locationPermission == false &&
              Get.currentRoute != kLocationPermissionPage) {
            // if we are not in Location Page and the permissions to location service were denied
            // then  push LocationPermissionPage to the stack , so we can go back to where the user was after.
            Get.toNamed(kLocationPermissionPage);
          } else {
            // in case the user was in LocationPermissionPage and he gave us the needed permissions
            // then pop locationPermissionPage off and push TaxiWrapper
            if (Get.currentRoute == kLocationPermissionPage) {
              Get.offNamed(kTaxiWrapperRoute);
              // if the user was not in locationPermissionPage then simply push the taxiWrapper to the nav stack.
            } else
              Get.toNamed(kTaxiWrapperRoute);
          }
        }).canceledBy(this));

    return WillPopScope(
      onWillPop: () async => false,
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, AsyncSnapshot<User?> snapUser) {
            if (snapUser.data == null) {
              return SignIn();
            } else {
              return Scaffold(
                body: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child:
                        Transform.scale(scale: .8, child: MezLogoAnimation()),
                  ),
                ),
              );
            }
          }),
    );
  }
}
