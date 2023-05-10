import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/UserProfileView/UserProfileView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/ContactUsPopUp.dart';
import 'package:mezcalmos/env.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['Shared']['widgets']["MezSideMenu"];

class MezSideMenu extends GetWidget<AuthController> {
  final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();

  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 75.mezW,
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(left: 7.5.mezW, top: 20.sp),
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(flex: 1, child: _drawerHeader()),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      child: Divider(
                        color: Color.fromRGBO(196, 196, 196, 0.29),
                      ),
                    ),
                    _buildSideMenuItem(),
                    _basicSideMenuItems(context),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                    "${PlatformOSHelper.getAppVersion} ${MezEnv.appLaunchMode.toShortString()}"),
              )
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
              UserProfileView.navigate();
            } else
              SignInView.navigateAtOrderTime();
          },
        ),
        if (_drawerController.pastOrdersRoute != null)
          SideMenuItem(
            icon: Icons.restore,

            title: "${_i18n()["pastOrders"]}", // _i18n()["userInfo"],
            onClick: () {
              _drawerController.closeMenu();
              MezRouter.toPath(_drawerController.pastOrdersRoute!);
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
                style: context.txt.bodyLarge,
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
            onClick: () => launchUrlString(MezEnv.appType.getPrivacyLink()),
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

  Column _drawerHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100.mezSp,
          width: 100.mezSp,
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
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            controller.user?.name ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: blackColor),
          ),
        ),
      ],
    );
  }

  Widget _buildSideMenuItem() {
    if (controller.isUserSignedIn) {
      return Column(
        children: _drawerController.sideMenuItems,
      );
    } else
      return SizedBox.shrink();
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
      this.backgroundColor,
      this.contentPadding,
      this.titleWidget})
      : super(key: key);
  final IconData icon;
  final Color? backgroundColor;
  final Widget? titleWidget;
  final String? title;
  final bool isI18nPath;
  final bool shouldBeAuthorized;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: contentPadding,
        color: backgroundColor,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          children: [
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
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  : titleWidget ?? Container(),
            )
          ],
        ),
      ),
    );
  }
}
