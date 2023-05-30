import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/BsOpServicesListView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

enum BusinessOpTabView { Services, Feed, Messages, Profile, Orders }

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpTabsView extends StatefulWidget {
  const BsOpTabsView({super.key});

  @override
  State<BsOpTabsView> createState() => _BsOpTabsViewState();
}

class _BsOpTabsViewState extends State<BsOpTabsView>
    with TickerProviderStateMixin {
  BusinessOpAuthController opAuthController =
      Get.find<BusinessOpAuthController>();

  Rx<BusinessOpTabView> currentView = Rx(BusinessOpTabView.Services);
  RxInt currentIndex = 0.obs;
  bool get haveOrders =>
      opAuthController.businessProfile == BusinessProfile.HomeRental;
  late List<BusinessOpTabView> _visibleTabs;
  @override
  void initState() {
    _visibleTabs = [
      BusinessOpTabView.Services,
      if (haveOrders) BusinessOpTabView.Orders,
      BusinessOpTabView.Messages,
      BusinessOpTabView.Profile,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: Obx(() {
        if (opAuthController.companyId != null) {
          return _getBody();
        } else {
          return MezLogoAnimation(
            centered: true,
          );
        }
      }),
    );
  }

  Widget _getBody() {
    switch (currentView.value) {
      case BusinessOpTabView.Services:
        return BsOpServicesListView(
          businessId: opAuthController.companyId,
          businessDetailsId: opAuthController.businessDetailsId,
          businessProfile: opAuthController.businessProfile,
        );
      case BusinessOpTabView.Orders:
        return Scaffold(
          appBar: AppBar(
            title: Text("Orders"),
          ),
        );
      case BusinessOpTabView.Profile:
        return ServiceProfileView(
          serviceId: opAuthController.companyId,
          serviceDetailsId: opAuthController
              .operator.value!.serviceProviderDetailsId
              ?.toInt(),
          deliveryDetailsId: null,
        );
      case BusinessOpTabView.Messages:
        return MessagesListView(
          serviceProviderType: ServiceProviderType.Business,
        );

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Screen not needed"),
          ),
        );
    }
  }

  Widget _navBar() {
    return Obx(() => BottomNavigationBar(
            selectedLabelStyle: context.txt.bodyLarge,
            unselectedLabelStyle: context.txt.bodyMedium,
            selectedItemColor: primaryBlueColor,
            currentIndex: currentIndex.value,
            onTap: (int index) {
              currentView.value = _visibleTabs[index];
              currentIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: '${_i18n()["services"]}',
              ),
              if (haveOrders)
                BottomNavigationBarItem(
                  icon: Icon(Icons.watch_later_outlined),
                  label: '${_i18n()["orders"]}',
                ),
              BottomNavigationBarItem(
                icon: badge.Badge(
                  badgeColor: Colors.red,
                  showBadge: Get.find<ForegroundNotificationsController>()
                      .hasNewSPMessageNotification(),
                  position: badge.BadgePosition(top: 0, end: 0),
                  child: Icon(
                    Icons.textsms,
                  ),
                ),
                label: '${_i18n()["messages"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '${_i18n()["profile"]}',
              ),
            ]));
  }
}
