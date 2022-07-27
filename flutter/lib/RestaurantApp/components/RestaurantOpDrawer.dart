import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]
    ["components"]["LaundryAppDrawer"];

class ROpDrawer extends StatefulWidget {
  const ROpDrawer({Key? key}) : super(key: key);
  // controllers //

  @override
  State<ROpDrawer> createState() => _ROpDrawerState();
}

class _ROpDrawerState extends State<ROpDrawer> {
  final LanguageController languageController = Get.find<LanguageController>();
  final SideMenuDrawerController _drawerController =
      Get.find<SideMenuDrawerController>();
  AuthController authController = Get.find<AuthController>();
  // static RestaurantInfoController restaurantInfoController =
  //     Get.find<RestaurantInfoController>();
  RestaurantOpAuthController restaurantOpAuthController =
      Get.find<RestaurantOpAuthController>();

  // helpers //
  static final AppLaunchMode lmd = getAppLaunchMode();

  // variables //
  static final String version =
      GetStorage().read<String>(getxAppVersion) as String;
  Rxn<Restaurant> restaurant = Rxn();
  late RestaurantInfoController restaurantInfoController;

  @override
  void initState() {
    Get.put(RestaurantInfoController(), permanent: false);
    restaurantInfoController = Get.find<RestaurantInfoController>();
    restaurant.value = restaurantInfoController.restaurant.value;
    restaurantInfoController
        .getRestaurant(restaurantOpAuthController.restaurantId!)
        .listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    // Laundry IMAGE AND NAME

                    _laundryImageAndName(),

                    // Navigation links
                    if (restaurantOpAuthController.operator.value != null &&
                        restaurantOpAuthController
                                .operator.value?.state.restaurantId !=
                            null)
                      _operatorNavLinks(),
                    _languageSwitcher(),
                    _navigationLink(
                        onClick: () {
                          _drawerController.closeMenu();
                          launch(GetStorage().read(getxPrivacyPolicyLink));
                        },
                        icon: Icons.privacy_tip,
                        titleWidget: Text(
                          "${_i18n()["privacyPolicies"]}",
                          style: Get.textTheme.bodyText1,
                        )),
                    _navigationLink(
                        onClick: () async {
                          _drawerController.closeMenu();
                          await authController.signOut();
                        },
                        icon: Icons.logout,
                        titleWidget: Text(
                          "${_i18n()["logout"]}",
                          style: Get.textTheme.bodyText1,
                        )),
                  ],
                ),
              ),
            ),
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
              "${_i18n()["language"]}",
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
              Get.toNamed(getROpEditInfoRoute(
                  restaurantId: restaurantOpAuthController.restaurantId!));
            },
            icon: Icons.person,
            titleWidget: Text(
              "${_i18n()["profile"]}",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            icon: Icons.flatware_rounded,
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed(getROpMenuRoute(
                  restaurantId: restaurantOpAuthController.restaurantId!));
            },
            titleWidget: Text(
              "${_i18n()["menu"] ?? "Menu"}",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            onClick: () {
              Get.toNamed(kNotificationsRoute);
            },
            icon: Icons.notifications,
            titleWidget: Text(
              "${_i18n()["notifications"]}",
              style: Get.textTheme.bodyText1,
            )),
        _navigationLink(
            onClick: () {
              _drawerController.closeMenu();
              Get.toNamed(kPastOrdersListView);
            },
            icon: Icons.history,
            titleWidget: Text(
              "${_i18n()["pastOrders"]}",
              style: Get.textTheme.bodyText1,
            )),
      ],
    );
  }

  Widget _laundryImageAndName() {
    return Obx(
      () {
        if (restaurant.value != null) {
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
                      backgroundImage: (restaurant.value!.info.image != null)
                          ? CachedNetworkImageProvider(
                              restaurant.value?.info.image ?? "")
                          : AssetImage(aNoImage) as ImageProvider,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      restaurant.value!.info.name,
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
        } else
          return Container();
      },
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
