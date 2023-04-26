import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/BsOpServicesListView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]['DvOpTabsView'];

class BsOpTabsView extends StatefulWidget {
  const BsOpTabsView({super.key});

  @override
  State<BsOpTabsView> createState() => _BsOpTabsViewState();
}

class _BsOpTabsViewState extends State<BsOpTabsView>
    with TickerProviderStateMixin {
  BusinessOpAuthController opAuthController =
      Get.find<BusinessOpAuthController>();

  RxInt _index = RxInt(0);
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
    switch (_index.value) {
      case 0:
        return BsOpServicesListView();

      // case 1:
      //   return ServiceDriversListView(
      //     serviceProviderId: opAuthController.companyId,
      //     serviceProviderType: ServiceProviderType.DeliveryCompany,
      //     serviceLinkId: opAuthController.operator.value!.state.serviceLinkId,
      //   );
      // case 2:
      //   return DeliveryCostSettingView(
      //     deliveryDetailsId:
      //         opAuthController.operator.value!.state.deliveryDetailsId,
      //   );
      // case 3:
      //   return ServiceProfileView(
      //     serviceId: opAuthController.companyId,
      //     serviceDetailsId:
      //         opAuthController.operator.value!.state.serviceProviderDetailsId,
      //     deliveryDetailsId:
      //         opAuthController.operator.value!.state.deliveryDetailsId,
      //   );

      default:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Text("Error"),
          ),
        );
    }
  }

  Widget _navBar() {
    return Obx(() => BottomNavigationBar(
            selectedLabelStyle: context.txt.bodyLarge,
            unselectedLabelStyle: context.txt.bodyMedium,
            selectedItemColor: primaryBlueColor,
            currentIndex: _index.value,
            onTap: (int v) {
              _index.value = v;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.textsms),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '${_i18n()["profile"]}',
              ),
            ]));
  }
}
