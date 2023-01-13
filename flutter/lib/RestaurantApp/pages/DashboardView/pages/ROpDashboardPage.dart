import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/components/ROpOpenClose.dart';
import 'package:mezcalmos/RestaurantApp/pages/DashboardView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDashboardPage'];

class ROpDashboardPage extends StatelessWidget {
  const ROpDashboardPage(
      {super.key, required this.viewController, required this.pageController});
  final ROpEditInfoController viewController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: CachedNetworkImageProvider(
                viewController.restaurant.value!.info.image),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            viewController.restaurant.value!.info.name,
            style: Get.textTheme.headline3,
          ),
          SizedBox(
            height: 30,
          ),
          _settingsList(),
          SizedBox(
            height: 30,
          ),
          _shortcutsList(),
        ],
      ),
    );
  }

  Widget _settingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            '${_i18n()["settings"]}',
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navigationLink(
                  onClick: () async {
                    await pageController.animateToPage(1,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.person,
                  titleWidget: Text(
                    '${_i18n()["restInfo"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    await pageController.animateToPage(2,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.business_outlined,
                  titleWidget: Text(
                    '${_i18n()["schedule"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    viewController.tabsViewViewController?.showTabs.value =
                        true;
                    navigateToOperators(
                        serviceProviderId: viewController.restaurantId,
                        controllerType: ServiceProviderType.Restaurant);
                  },
                  icon: Icons.people,
                  titleWidget: Text(
                    'Operators',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    viewController.tabsViewViewController?.showTabs.value =
                        true;
                    navigateToServicePayments(
                        ServiceProviderId:
                            viewController.restaurant.value!.restaurantId,
                        serviceProviderType: ServiceProviderType.Restaurant);
                  },
                  icon: Icons.account_balance,
                  titleWidget: Text(
                    '${_i18n()["payments"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    await pageController.animateToPage(4,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  },
                  icon: Icons.star_rate_rounded,
                  titleWidget: Text(
                    '${_i18n()["reviews"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              if (viewController.restaurant.value!.selfDelivery)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _divider(),
                    _navigationLink(
                        onClick: () async {
                          viewController
                              .tabsViewViewController?.showTabs.value = true;
                          navigateToDrivers(
                              serviceProviderId: viewController.restaurantId,
                              controllerType: ServiceProviderType.Restaurant);
                        },
                        icon: Icons.delivery_dining,
                        titleWidget: Text(
                          'Drivers',
                          style: Get.textTheme.bodyText1?.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900),
                        )),
                    _divider(),
                    _navigationLink(
                        onClick: () async {
                          viewController
                              .tabsViewViewController?.showTabs.value = true;
                          navigateToDeliveryCost(
                              serviceProviderId: viewController.restaurantId,
                              serviceProviderType:
                                  ServiceProviderType.Restaurant);
                        },
                        icon: Icons.price_check_rounded,
                        titleWidget: Text(
                          'Delivery cost',
                          style: Get.textTheme.bodyText1?.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900),
                        )),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _shortcutsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            '${_i18n()["shortcuts"]}',
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _navigationLink(
                  onClick: () async {
                    // todo implement share restuarant
                  },
                  icon: Icons.share,
                  titleWidget: Text(
                    '${_i18n()["shareRest"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              Obx(
                () => _navigationLink(
                    onClick: () async {
                      // await pageController.animateToPage(2,
                      //     duration: Duration(milliseconds: 1),
                      //     curve: Curves.easeIn);
                    },
                    icon: Icons.delivery_dining,
                    trailingWidget: Switch(
                      value: viewController.restaurant.value!.selfDelivery,
                      onChanged: (bool v) {
                        viewController.switchSelfDelivery(v);
                      },
                      activeColor: primaryBlueColor,
                    ),
                    titleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_i18n()["selfDvTitle"]}',
                          style: Get.textTheme.bodyText1?.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900),
                        ),
                        Text(
                          '${_i18n()["selfDvDesc"]}',
                          style: Get.textTheme.subtitle1
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    )),
              ),
              _divider(),
              ROpOpenClose(
                  title: '${_i18n()["openTitle"]}',
                  subtitle: '${_i18n()["openSubtitle"]}',
                  onTurnedOn: () {
                    viewController.turnOnOrders();
                  },
                  onTurnedOff: () {
                    viewController.turnOffOrders();
                  },
                  initialSwitcherValue: viewController.isAvailable.value),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    await launch(GetStorage().read(getxPrivacyPolicyLink));
                  },
                  icon: Icons.privacy_tip,
                  titleWidget: Text(
                    '${_i18n()["privacyPolicies"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    await Get.find<AuthController>().signOut();
                  },
                  icon: Icons.logout,
                  iconColor: Colors.red,
                  titleWidget: Text(
                    '${_i18n()["logout"]}',
                    style: Get.textTheme.bodyText1?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Divider _divider() {
    return Divider(
      // endIndent: 16,
      // indent: 16,
      height: 15,
      thickness: 0.2,
    );
  }

  Widget _navigationLink(
      {required IconData icon,
      required Widget titleWidget,
      Widget? trailingWidget,
      Color? iconColor,
      Future<void> Function()? onClick}) {
    return InkWell(
      onTap: () async {
        await onClick?.call();
        viewController.cuurentPage.value = pageController.page!.toInt();
        if (viewController.cuurentPage != 0) {
          viewController.tabsViewViewController?.showTabs.value = false;
        } else {
          viewController.tabsViewViewController?.showTabs.value = true;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
                color: iconColor ?? Color(0xFFC4C4C4),
                size: 22,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(fit: FlexFit.tight, child: titleWidget),
            SizedBox(
              width: 5,
            ),
            if (trailingWidget != null) trailingWidget
          ],
        ),
      ),
    );
  }
}
