import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['widgets']["MezSideMenu"];

class MezSideMenu extends GetWidget<AuthController> {
  final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();

  final LanguageController languageController = Get.find<LanguageController>();

  final String appName = getAppName();

  final String version = GetStorage().read<String>(getxAppVersion) as String;

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return Drawer(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        bottomNavigationBar: Container(
          height: 50.sp,
          padding: EdgeInsets.only(left: 21),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "$appName $version",
              style: TextStyle(
                color: Color.fromRGBO(33, 33, 33, 0.5),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.only(left: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 136,
                      width: 136,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 214, 214, 214),
                        // border: Border.all(color: Colors.black),
                      ),
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: controller.user?.image == null ||
                                controller.user?.image == ""
                            ? Icon(
                                Icons.account_circle_outlined,
                                size: 136,
                              )
                            : CachedNetworkImage(
                                imageUrl: controller.user!.image!,
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      getSizeRelativeToScreen(300, sw, sh).sp,
                                  height:
                                      getSizeRelativeToScreen(300, sw, sh).sp,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => Container(
                                  width:
                                      getSizeRelativeToScreen(300, sw, sh).sp,
                                  height:
                                      getSizeRelativeToScreen(300, sw, sh).sp,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                    width:
                                        getSizeRelativeToScreen(300, sw, sh).sp,
                                    height:
                                        getSizeRelativeToScreen(300, sw, sh).sp,
                                    child: Center(child: Icon(Icons.error))),
                              ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Text(
                        controller.user?.name ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              // SizedBox(height: 43),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: Color.fromRGBO(196, 196, 196, 0.29),
                ),
              ),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SideMenuItem(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      size: 25,
                    ),
                    title: "Profile", // _i18n()["userInfo"],
                    onPress: () {
                      _drawerController.closeMenu();
                      Get.toNamed<void>(kUserProfile);
                    },
                  ),
                  SideMenuItem(
                    icon: Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      size: 25,
                    ),
                    title: "Notifications", // _i18n()["userInfo"],
                    onPress: () {
                      _drawerController.closeMenu();
                      Get.toNamed<void>(kNotificationsRoute);
                    },
                  ),
                  SideMenuItem(
                    icon: Icon(
                      Icons.restore,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      size: 25,
                    ),
                    title: "Past orders", // _i18n()["userInfo"],
                    onPress: () {
                      _drawerController.closeMenu();
                      Get.toNamed<void>(kPastOrdersListRoute);
                    },
                  ),
                  SideMenuItem(
                    descriptionRow: Row(
                      children: [
                        Obx(
                          () => Text(
                            languageController.oppositToLang,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(120, 120, 120, 1),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Obx(
                          () => Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage(languageController.oppositFlag),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    icon: Icon(
                      Icons.g_translate_outlined,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      size: 25,
                    ),
                    title: "Language", // _i18n()["userInfo"],
                    onPress: () {
                      languageController.changeUserLanguage();
                      _drawerController.closeMenu();
                    },
                  ),
                  Obx(
                    () => SideMenuItem(
                      icon: Icon(
                        Icons.restore,
                        color: Color.fromRGBO(196, 196, 196, 1),
                        size: 25,
                      ),
                      title: _i18n()["legal"], // _i18n()["userInfo"],
                      onPress: () =>
                          launch(GetStorage().read(getxPrivacyPolicyLink)),
                    ),
                  ),
                  controller.fireAuthUser != null
                      ? _buildSideMenuItem()
                      : Container(),
                  Obx(
                    () => SideMenuItem(
                      icon: Icon(
                        Icons.logout,
                        color: Color.fromRGBO(196, 196, 196, 1),
                        size: 25,
                      ),
                      title: _i18n()["logout"],
                      onPress: () async {
                        _drawerController.closeMenu();
                        await controller.signOut();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
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
  const SideMenuItem({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.title,
    this.descriptionRow,
  }) : super(key: key);

  final GestureTapCallback onPress;
  final Widget icon;
  final String title;
  final Row? descriptionRow;

  @override
  _SideMenuItemState createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _authController.user != null
          ? Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: ListTile(
                  onTap: widget.onPress,
                  leading: widget.icon,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.title}",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.descriptionRow != null) widget.descriptionRow!
                    ],
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
