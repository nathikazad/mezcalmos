import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/savedLocationView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MezSideMenu extends GetWidget<AuthController> {
  SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();
  LanguageController lang = Get.find<LanguageController>();

  String lmd = GetStorage().read(getxLmodeKey);
  String VERSION = GetStorage().read(getxVersion);

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("=========> ImgUrl ======<  ${controller.user?.image}");
    mezDbgPrint(controller.user?.phone);

    responsiveSize(context);

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Drawer(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50.sp,
          // padding: EdgeInsets.only(bottom: 20),
          child: Center(
            child: Text(
              VERSION + (lmd != "prod" ? " $lmd" : " "),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120.sp,
                  width: 120.sp,
                  child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: controller.user?.image == null ||
                              controller.user?.image == ""
                          ? Image.asset(
                              aDefaultAvatar,
                              width: getSizeRelativeToScreen(300, sw, sh).sp,
                              height: getSizeRelativeToScreen(300, sw, sh).sp,
                              fit: BoxFit.contain,
                            )
                          : mLoadImage(
                              url: controller.user!.image! + "?type=large",
                              width: getSizeRelativeToScreen(300, sw, sh).sp,
                              height: getSizeRelativeToScreen(300, sw, sh).sp,
                              assetInCaseFailed: aDefaultAvatar)),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                Container(
                  child: Text(
                    controller.user?.name ?? tDefaultUserName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'psb', fontSize: 25.5.sp),
                  ),
                ),
                SizedBox(
                  height: 50.sp,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.user != null
                    ? ListTile(
                        onTap: () {
                          _drawerController.closeMenu();
                          Get.toNamed(kUserProfile);
                        },
                        leading: Icon(
                          Icons.account_circle_outlined,
                          color: Color.fromARGB(255, 103, 121, 254),
                          size: 25.sp,
                        ),
                        title: Text(
                            lang.strings['shared']['navDrawer']["userInfo"],
                            style:
                                TextStyle(fontFamily: 'psb', fontSize: 16.sp)),
                      )
                    : SizedBox()),

//@jamal TODO: pass in a list of listTiles that gets sent by the app at the time of initialization,
//this datastructure, should basically just have a name and a link
//and then populate the middle of these tiles using this list

                _buildSideMenuItem(),
                Obx(() => controller.user != null
                    ? ListTile(
                        onTap: () async {
                          _drawerController.closeMenu();
                          await controller.signOut();
                        },
                        leading: Icon(
                          MezcalmosIcons.power_off,
                          color: Color.fromARGB(255, 103, 121, 254),
                          size: 25.sp,
                        ),
                        title: Obx(
                          () => Text(
                            lang.strings['shared']['navDrawer']["logout"],
                            style:
                                TextStyle(fontFamily: 'psb', fontSize: 16.sp),
                          ),
                        ))
                    : SizedBox()),
                ListTile(
                    onTap: () async => await launch(tPrivacyPolicy),
                    leading: Icon(
                      Icons.lock_sharp,
                      color: Color.fromARGB(255, 103, 121, 254),
                      size: 25.sp,
                    ),
                    title: Obx(
                      () => Text(
                        lang.strings['shared']['navDrawer']["legal"],
                        style: TextStyle(fontFamily: 'psb', fontSize: 16.sp),
                      ),
                    )),
                Obx(() => ListTile(
                    onTap: () {
                      lang.changeUserLanguage();
                      _drawerController.closeMenu();
                    },
                    leading: Container(
                      height: 31.sp,
                      width: 31.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(lang.oppositFlag))),
                    ),
                    title: Text(lang.oppositToLang,
                        style: TextStyle(fontFamily: 'psb', fontSize: 16.sp)))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideMenuItem() {
    if (_drawerController.sideMenuItems!.length > 0) {
      return Column(
        children: _drawerController.sideMenuItems!,
      );
    } else
      return Container();
  }
}

class SideMenuItem extends StatefulWidget {
  SideMenuItem({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final GestureTapCallback onPress;
  final Widget icon;
  final String title;

  @override
  _SideMenuItemState createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      onTap: widget.onPress,
      leading: widget.icon,
      title: Text("${widget.title}",
          style: TextStyle(fontFamily: 'psb', fontSize: 16.sp)),
    ));
  }
}
