import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/ContactUsPopUp.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['widgets']["MezSideMenu"];

class MezSideMenu extends GetWidget<AuthController> {
  final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();

  final LanguageController languageController = Get.find<LanguageController>();

  final String appName = getAppName();
  static final AppLaunchMode lmd = getAppLaunchMode();

  final String version = GetStorage().read<String>(getxAppVersion) as String;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50),
                      _drawerHeader(),
                      // SizedBox(height: 43),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(
                          color: Color.fromRGBO(196, 196, 196, 0.29),
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildSideMenuItem(),
                      _basicSideMenuItems(context),
                      MediaQuery.of(context).size.width <= 360
                          ? Container(
                              alignment: Alignment.center,
                              child: Text(
                                version +
                                    (lmd != AppLaunchMode.prod
                                        ? " ${lmd.toShortString()}"
                                        : ""),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
              ),
              MediaQuery.of(context).size.width > 360
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        version +
                            (lmd != AppLaunchMode.prod
                                ? " ${lmd.toShortString()}"
                                : ""),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicSideMenuItems(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideMenuItem(
          icon: Icons.person,

          title: (controller.isUserSignedIn)
              ? "${_i18n()["profile"]}"
              : "${_i18n()["login"]}", // _i18n()["userInfo"],
          onClick: () {
            _drawerController.closeMenu();
            if (controller.isUserSignedIn) {
              MezRouter.toNamed<void>(kUserNewProfile);
            } else
              MezRouter.toNamed<void>(kSignInRouteOptional);
          },
        ),
        if (_drawerController.pastOrdersRoute != null)
          SideMenuItem(
            icon: Icons.restore,

            title: "${_i18n()["pastOrders"]}", // _i18n()["userInfo"],
            onClick: () {
              _drawerController.closeMenu();
              MezRouter.toNamed<void>(_drawerController.pastOrdersRoute!);
            },
          ),
        SideMenuItem(
          onClick: () {
            _drawerController.closeMenu();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ContactUsPopUp();
                });
          },
          icon: Icons.alternate_email,
          title: '${_i18n()["contact"]}',
        ),
        SideMenuItem(
          titleWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["language"]}",
                style: Get.textTheme.bodyText1,
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(languageController.oppositFlag),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      languageController.oppositToLang,
                    ),
                  ],
                ),
              ),
            ],
          ),
          icon: Icons.g_translate_outlined,
          onClick: () {
            languageController.changeUserLanguage().then(
                  (_) => _drawerController.closeMenu(),
                );
          },
        ),
        Obx(
          () => SideMenuItem(
            icon: Icons.privacy_tip,

            title: _i18n()["legal"], // _i18n()["userInfo"],
            onClick: () => launch(GetStorage().read(getxPrivacyPolicyLink)),
          ),
        ),
        if (controller.isUserSignedIn)
          Obx(
            () => SideMenuItem(
              icon: Icons.logout,
              title: _i18n()["logout"],
              onClick: () async {
                _drawerController.closeMenu();
                await signOut();
              },
            ),
          ),
      ],
    );
  }

  Container _drawerHeader() {
    return Container(
      padding: EdgeInsets.only(left: 21, top: 20),
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
              color: secondaryLightBlueColor,
              // border: Border.all(color: Colors.black),
            ),
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: controller.user?.image == null ||
                      controller.user?.image == ""
                  ? Icon(
                      Icons.person,
                      size: 70,
                      color: primaryBlueColor,
                    )
                  : CachedNetworkImage(
                      imageUrl: controller.user!.image,
                      fit: BoxFit.cover,
                      imageBuilder: (BuildContext context,
                              ImageProvider<Object> imageProvider) =>
                          Container(
                        width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (BuildContext context, String url) =>
                          Container(
                        width: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        height: getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (BuildContext context, String url, error) =>
                          Container(
                              width:
                                  getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                              height:
                                  getSizeRelativeToScreen(300, 100.w, 100.h).sp,
                              child: Center(child: Icon(Icons.error))),
                    ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(left: 5),
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSideMenuItem() {
    if (controller.isUserSignedIn) {
      return Column(
        children: _drawerController.sideMenuItems,
      );
    } else
      return Container();
  }
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem(
      {Key? key,
      required this.onClick,
      required this.icon,
      this.shouldBeAuthorized = false,
      this.isI18nPath = false,
      this.title,
      this.titleWidget})
      : super(key: key);
  final IconData icon;
  final Widget? titleWidget;
  final String? title;
  final bool isI18nPath;
  final bool shouldBeAuthorized;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.grey.shade400,
              size: 25,
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              child: title != null
                  ? Text(
                      (isI18nPath)
                          ? Get.find<LanguageController>().getLMap(title!)
                          : title!,
                      style: Get.textTheme.bodyText1,
                    )
                  : titleWidget ?? Container(),
            )
          ],
        ),
      ),
    );
  }
}
