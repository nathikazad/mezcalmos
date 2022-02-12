import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

class MezSideMenu extends GetWidget<AuthController> {
  SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();
  LanguageController lang = Get.find<LanguageController>();

  String lmd = GetStorage().read(getxLmodeKey);
  String VERSION = GetStorage().read(getxAppVersion);

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
                  height: 100.sp,
                  width: 100.sp,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: controller.user?.image == null ||
                            controller.user?.image == ""
                        ? Icon(
                            Icons.account_circle_outlined,
                            size: getSizeRelativeToScreen(285, sw, sh).sp,
                          )
                        // Image.asset(
                        //     aDefaultAvatar,
                        //     width: getSizeRelativeToScreen(300, sw, sh).sp,
                        //     height: getSizeRelativeToScreen(300, sw, sh).sp,
                        //     fit: BoxFit.contain,
                        //   )
                        : CachedNetworkImage(
                            imageUrl: controller.user!.image!,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              width: getSizeRelativeToScreen(300, sw, sh).sp,
                              height: getSizeRelativeToScreen(300, sw, sh).sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              width: getSizeRelativeToScreen(300, sw, sh).sp,
                              height: getSizeRelativeToScreen(300, sw, sh).sp,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                                width: getSizeRelativeToScreen(300, sw, sh).sp,
                                height: getSizeRelativeToScreen(300, sw, sh).sp,
                                child: Center(child: Icon(Icons.error))),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    controller.user?.name ?? tDefaultUserName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'psb', fontSize: 18.5.sp),
                  ),
                ),
                SizedBox(height: 50)
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
                          size: 22.sp,
                        ),
                        title: Text(
                            lang.strings['shared']['navDrawer']["userInfo"],
                            style:
                                TextStyle(fontFamily: 'psb', fontSize: 13.sp)),
                      )
                    : SizedBox()),

//@jamal TODO: pass in a list of listTiles that gets sent by the app at the time of initialization,
//this datastructure, should basically just have a name and a link
//and then populate the middle of these tiles using this list

                controller.fireAuthUser != null
                    ? _buildSideMenuItem()
                    : Container(),
                Obx(() => controller.user != null
                    ? ListTile(
                        onTap: () async {
                          _drawerController.closeMenu();
                          await controller.signOut();
                        },
                        leading: Icon(
                          MezcalmosIcons.power_off,
                          color: Color.fromARGB(255, 103, 121, 254),
                          size: 22.sp,
                        ),
                        title: Obx(
                          () => Text(
                            lang.strings['shared']['navDrawer']["logout"],
                            style:
                                TextStyle(fontFamily: 'psb', fontSize: 13.sp),
                          ),
                        ))
                    : SizedBox()),
                ListTile(
                    onTap: () async =>
                        await launch(GetStorage().read(getxPrivacyPolicyLink)),
                    leading: Icon(
                      Icons.lock_sharp,
                      color: Color.fromARGB(255, 103, 121, 254),
                      size: 22.sp,
                    ),
                    title: Obx(
                      () => Text(
                        lang.strings['shared']['navDrawer']["legal"],
                        style: TextStyle(fontFamily: 'psb', fontSize: 13.sp),
                      ),
                    )),
                Obx(() => ListTile(
                    onTap: () {
                      lang.changeUserLanguage();
                      _drawerController.closeMenu();
                    },
                    leading: Container(
                      height: 22.sp,
                      width: 22.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(lang.oppositFlag))),
                    ),
                    title: Text(lang.oppositToLang,
                        style: TextStyle(fontFamily: 'psb', fontSize: 13.sp)))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideMenuItem() {
    if (_drawerController.sideMenuItems != null) {
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
