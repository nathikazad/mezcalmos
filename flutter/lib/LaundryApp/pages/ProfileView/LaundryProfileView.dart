import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/LaundryApp/components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/components/LaundyOpDrawer.dart';
import 'package:mezcalmos/LaundryApp/pages/ProfileView/controllers/LaundryProfileViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpDashboardPage'];

class LaundryProfileView extends StatefulWidget {
  const LaundryProfileView({this.laundryId});
  final int? laundryId;

  @override
  State<LaundryProfileView> createState() => _LaundryProfileViewState();
}

class _LaundryProfileViewState extends State<LaundryProfileView> {
  LaundryProfileViewController viewController = LaundryProfileViewController();

  int? laundryId;
  @override
  void initState() {
    laundryId = widget.laundryId ?? int.tryParse(Get.parameters["laundryId"]!);
    if (laundryId != null) {
      viewController.init(laundryId: laundryId!);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get asTab => widget.laundryId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaundryAppAppBar(
        leftBtnType:
            (asTab) ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
        onClick: (asTab) ? null : MezRouter.back,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: LaundryAppDrawer(),
      body: Obx(() {
        if (viewController.laundry != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(
                      viewController.laundry!.info.image),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  viewController.laundry!.info.name,
                  style: Get.textTheme.displaySmall,
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
        } else
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
      }),
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
            style: Get.textTheme.bodyLarge,
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
                    navigateToServiceInfoEdit(
                        serviceProviderId: viewController.laundryStoreId,
                        serviceProviderType: ServiceProviderType.Laundry);
                  },
                  icon: Icons.person,
                  titleWidget: Text(
                    '${_i18n()["restInfo"]}',
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    // await pageController.animateToPage(1,
                    //     duration: Duration(milliseconds: 1),
                    //     curve: Curves.easeIn);
                  },
                  icon: Icons.business_outlined,
                  titleWidget: Text(
                    '${_i18n()["schedule"]}',
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    // viewController.tabsViewViewController?.showTabs.value =
                    //     true;
                    navigateToOperators(
                        serviceProviderId: viewController.laundryStoreId,
                        serviceProviderType: ServiceProviderType.Laundry);
                  },
                  icon: Icons.people,
                  titleWidget: Text(
                    'Operators',
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    // viewController.tabsViewViewController?.showTabs.value =
                    //     true;
                    navigateToServicePayments(
                        ServiceProviderId: viewController.laundryStoreId,
                        serviceProviderType: ServiceProviderType.Laundry);
                  },
                  icon: Icons.account_balance,
                  titleWidget: Text(
                    '${_i18n()["payments"]}',
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    // await pageController.animateToPage(2,
                    //     duration: Duration(milliseconds: 1),
                    //     curve: Curves.easeIn);
                  },
                  icon: Icons.star_rate_rounded,
                  titleWidget: Text(
                    '${_i18n()["reviews"]}',
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              if (viewController.laundry!.selfDelivery)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _divider(),
                    _navigationLink(
                        onClick: () async {
                          // viewController
                          //     .tabsViewViewController?.showTabs.value = true;
                          navigateToDrivers(
                              serviceProviderId: viewController.laundryStoreId,
                              controllerType: ServiceProviderType.Laundry);
                        },
                        icon: Icons.delivery_dining,
                        titleWidget: Text(
                          'Drivers',
                          style: Get.textTheme.bodyLarge?.copyWith(
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
            style: Get.textTheme.bodyLarge,
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
                    style: Get.textTheme.bodyLarge?.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    navigateToDeliverySettings(
                        serviceProviderId: viewController.laundryStoreId,
                        serviceProviderType: ServiceProviderType.Laundry);
                  },
                  icon: Icons.delivery_dining,
                  titleWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery',
                        style: Get.textTheme.bodyLarge?.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade900),
                      ),
                    ],
                  )),
              _divider(),
              _navigationLink(
                  onClick: () async {
                    await launch(GetStorage().read(getxPrivacyPolicyLink));
                  },
                  icon: Icons.privacy_tip,
                  titleWidget: Text(
                    '${_i18n()["privacyPolicies"]}',
                    style: Get.textTheme.bodyLarge?.copyWith(
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
                    style: Get.textTheme.bodyLarge?.copyWith(
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
        //   viewController.cuurentPage.value = pageController.page!.toInt();
        // if (viewController.cuurentPage != 0) {
        //   viewController.tabsViewViewController?.showTabs.value = false;
        // } else {
        //   viewController.tabsViewViewController?.showTabs.value = true;
        // }
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
