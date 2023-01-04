import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/Shared/controllers/AuthController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileController.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileScreen/UserProfileWidgets.dart';
import 'package:mezcalmos/WebApp/screens/authScreen/components/MezButtonWidget.dart';
import 'package:mezcalmos/WebApp/widgets/mezCalmosResizer.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:sizer/sizer.dart';

class UserProfileForDesktop extends StatefulWidget {
  final AuthController authController = Get.find<AuthController>();
  // this is just to controll incase we want to make a push to this route with a pre-defined mode.
  final UserProfileMode pageInitMode;
  // UserProfileController
  final UserProfileController userProfileController;
  late final UserProfileWidgetsClass userProfileWidgets;

  UserProfileForDesktop(
      {required this.userProfileController,
      Key? key,
      this.pageInitMode = UserProfileMode.Show})
      : super(key: key) {
    // userProfileController.setUserProfileMode(pageInitMode);
    userProfileWidgets =
        UserProfileWidgetsClass(userProfileController: userProfileController);
  }

  @override
  State<UserProfileForDesktop> createState() => _UserProfileForDesktopState();
}

class _UserProfileForDesktopState extends State<UserProfileForDesktop> {
  AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //  widget.userProfileController.disposeController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        child: UserProfile(
          userProfileController: widget.userProfileController,
          isWebVersion: true,
        ),
      ),
    );
  }
}
