import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/ContactUsPopUp.dart';

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
    // Get.put(RestaurantInfoController(), permanent: false);
    // restaurantInfoController = Get.find<RestaurantInfoController>();
    // restaurant.value = restaurantInfoController.restaurant.value;
    // restaurantInfoController
    //     .getRestaurant(restaurantOpAuthController.restaurantId!)
    //     .listen((Restaurant? event) {
    //   if (event != null) {
    //     restaurant.value = event;
    //   }
    // });
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
                      height: 50,
                    ),
                    // Laundry IMAGE AND NAME
                    if (restaurantOpAuthController.operator.value != null)
                      _opImageAndName(),

                    // Navigation links
                    if (restaurantOpAuthController.operator.value != null &&
                        restaurantOpAuthController
                                .operator.value?.state.restaurantId !=
                            null)
                      _operatorNavLinks(),
                    _navigationLink(
                      onClick: () {
                        _drawerController.closeMenu();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ContactUsPopUp();
                            });
                      },
                      icon: Icons.alternate_email,
                      titleWidget: Text(
                        '${_i18n()["contact"]}',
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    _languageSwitcher(),

                    _navigationLink(
                      onClick: () async {
                        await Get.find<AuthController>().signOut();
                      },
                      iconColor: Colors.red,
                      icon: Icons.logout,
                      titleWidget: Text(
                        '${_i18n()["logout"]}',
                        style: Get.textTheme.bodyText1
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
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
        SizedBox(
          height: 15,
        ),
        //

        _navigationLink(
            onClick: () {
              MezRouter.toNamed(kNotificationsRoute);
            },
            icon: Icons.notifications,
            titleWidget: Text(
              "${_i18n()["notifications"]}",
              style: Get.textTheme.bodyText1,
            )),
      ],
    );
  }

  Widget _opImageAndName() {
    return Obx(
      () {
        if (restaurantOpAuthController.operator.value != null) {
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
                      backgroundImage: (restaurantOpAuthController
                              .operator.value!.info.image.isURL)
                          ? CachedNetworkImageProvider(
                              restaurantOpAuthController
                                  .operator.value!.info.image)
                          : AssetImage(aNoImage) as ImageProvider,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      restaurantOpAuthController.operator.value!.info.name,
                      style: Get.textTheme.headline3,
                    ),
                    SizedBox(
                      height: 30,
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
      Color? iconColor,
      required Widget titleWidget,
      void Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: iconColor ?? Colors.grey.shade400,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            titleWidget
          ],
        ),
      ),
    );
  }
}
