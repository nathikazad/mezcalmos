import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:url_launcher/url_launcher.dart';

class LaundryAppDrawer extends StatelessWidget {
  const LaundryAppDrawer({Key? key}) : super(key: key);
  // controllers //
  static final LanguageController languageController =
      Get.find<LanguageController>();
  static final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();
  static AuthController authController = Get.find<AuthController>();
  static LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  static LaundryOpAuthController laundryOpAuthController =
      Get.find<LaundryOpAuthController>();

  // helpers //
  static final AppLaunchMode lmd = getAppLaunchMode();

  // variables //
  static final String version =
      GetStorage().read<String>(getxAppVersion) as String;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            // Laundry IMAGE AND NAME

            if (laundryInfoController.laundry.value != null)
              _laundryImageAndName(),

            // Navigation links
            if (laundryOpAuthController.operator.value != null &&
                laundryOpAuthController.operator.value?.state.laundryId != null)
              _operatorNavLinks(),
            _languageSwitcher(),
            _navigationLink(
                onClick: () {
                  _drawerController.closeMenu();
                  launch(GetStorage().read(getxPrivacyPolicyLink));
                },
                icon: Icons.privacy_tip,
                titleWidget: Text(
                  "Privacy policies",
                  style: Get.textTheme.bodyText1,
                )),
            _navigationLink(
                onClick: () async {
                  _drawerController.closeMenu();
                  await authController.signOut();
                },
                icon: Icons.logout,
                titleWidget: Text(
                  "Logout",
                  style: Get.textTheme.bodyText1,
                )),
            Spacer(),
            Container(
                alignment: Alignment.center,
                child: Text(
                  version +
                      (lmd != AppLaunchMode.prod
                          ? " ${lmd.toShortString()}"
                          : ""),
                ))
          ],
        ),
      ),
    );
  }

  Widget _languageSwitcher() {
    return _navigationLink(
        onClick: () {
          languageController.changeUserLanguage();
          _drawerController.closeMenu();
        },
        icon: Icons.translate,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Language",
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
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
          ],
        ));
  }

  Widget _operatorNavLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _navigationLink(
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed(kEditInfoView);
            },
            icon: Icons.person,
            titleWidget: Text(
              "Profile",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            icon: Icons.settings,
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed(kAdminView);
            },
            titleWidget: Text(
              "Admin",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            onClick: () {
              Get.toNamed(kNotificationsRoute);
            },
            icon: Icons.notifications,
            titleWidget: Text(
              "Notifications",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed(kPastOrdersListView);
            },
            icon: Icons.history,
            titleWidget: Text(
              "Past orders",
              style: Get.textTheme.bodyText1,
            )),
      ],
    );
  }

  Widget _laundryImageAndName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: (laundryInfoController
                            .laundry.value!.info.image !=
                        null)
                    ? CachedNetworkImageProvider(
                        laundryInfoController.laundry.value?.info.image ?? "")
                    : AssetImage(aNoImage) as ImageProvider,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                laundryInfoController.laundry.value!.info.name,
                style: Get.textTheme.headline3,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required Widget titleWidget,
      void Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey.shade400,
              size: 35,
            ),
            SizedBox(
              width: 25,
            ),
            titleWidget
          ],
        ),
      ),
    );
  }
}
