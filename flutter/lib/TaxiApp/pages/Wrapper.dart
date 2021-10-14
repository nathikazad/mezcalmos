import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsController _settingsController = Get.find<SettingsController>();
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (_, AsyncSnapshot<User?> snapUser) {
              if (snapUser.data == null) {
                return SignIn();
              } else {
                
                return StreamBuilder<bool>(
                    stream:
                        _settingsController.locationPermissionStream
                        .distinct(),
                    builder: (context, snapshot) {
                      mezDbgPrint(
                          "snapshot locationPermissions ===> ${snapshot.data}");
                      if (snapshot.connectionState == ConnectionState.done ||
                          snapshot.connectionState == ConnectionState.active &&
                              snapshot.data != null) {
                        if (snapshot.data == false)
                          return LocationPermissionScreen();
                        else {
                          mezDbgPrint("Init Taxi Wrapper");
                          return TaxiWrapper();
                        }
                      } else {
                        return Scaffold(
                          body: Center(
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Transform.scale(
                                  scale: .8, child: MezLogoAnimation()),
                            ),
                          ),
                        );
                      }
                    });

                // });
              }
            }));
  }
}
