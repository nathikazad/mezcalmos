import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/WebApp/controllers/mezWebSideBarController.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/components/webAppBarComponent.dart';
import 'package:mezcalmos/WebApp/screens/userProfile/components/UserProfileForDesktop.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/SetUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezBottomBar.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: setupFirebase(
          launchMode: typeMode.toLaunchMode(),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            final MezWebSideBarController drawerController =
                Get.find<MezWebSideBarController>();
            return Scaffold(
              body: Scaffold(
                  key: drawerController.drawerKey,
                  drawer: drawerController.frontDrawerContent,
                  appBar: InstallAppBarComponent(),
                  bottomNavigationBar: MezBottomBar(),
                  body: LayoutBuilder(builder: ((context, constraints) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: WebAppBarComponent(
                        automaticallyGetBack: false,
                        type: WebAppBarType.Normal.obs,
                      ),
                      body: UserProfileForDesktop(),
                    );
                  }))),
            );
          } else {
            return const Scaffold(
                body: Center(
              child: MezLoaderWidget(),
            ));
          }
        },
      ),
    );
  }
}
