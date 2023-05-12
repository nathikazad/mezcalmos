import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/BsOpServicesListView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/MessagesListView/MessagesListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceProfileView/ServiceProfileView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

enum BusinessOpTabView { Services, Feed, Messages, Profile }

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
        return BsOpServicesListView();
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
            onTap: (int v) {
              currentIndex.value = v;
              switch (v) {
                case 0:
                  currentView.value = BusinessOpTabView.Services;
                  break;
                case 1:
                  currentView.value = BusinessOpTabView.Feed;
                  break;
                case 2:
                  currentView.value = BusinessOpTabView.Messages;

                  break;
                case 3:
                  currentView.value = BusinessOpTabView.Profile;

                  break;
                default:
              }
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: '${_i18n()["services"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: '${_i18n()["feed"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.textsms),
                label: '${_i18n()["messages"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '${_i18n()["profile"]}',
              ),
            ]));
  }
}
