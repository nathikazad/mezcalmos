import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpCurrentOrders.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/ServiceProfile/DvOpProfileView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/DeliveryCostSettingView.dart';
import 'package:mezcalmos/Shared/pages/ServiceDriversList/ServiceDriversListView.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]['DvOpTabsView'];

class DvOpTabsView extends StatefulWidget {
  const DvOpTabsView({super.key});

  @override
  State<DvOpTabsView> createState() => _DvOpTabsViewState();
}

class _DvOpTabsViewState extends State<DvOpTabsView>
    with TickerProviderStateMixin {
  DeliveryOpAuthController opAuthController =
      Get.find<DeliveryOpAuthController>();

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
        return DvOpCurrentOrdersListView(
          canGoBack: false,
        );

      case 1:
        return ServiceDriversListView(
          serviceProviderId: Get.find<DeliveryOpAuthController>().companyId,
          serviceProviderType: ServiceProviderType.Delivery_company,
        );
      case 2:
        return DeliveryCostSettingView(
          deliveryDetailsId: 1,
        );
      case 3:
        return DvOpProfileView();

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
            selectedLabelStyle: Get.textTheme.bodyText1,
            unselectedLabelStyle: Get.textTheme.bodyText2,
            selectedItemColor: primaryBlueColor,
            currentIndex: _index.value,
            onTap: (int v) {
              _index.value = v;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: '${_i18n()["orders"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining),
                label: '${_i18n()["drivers"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.price_check),
                label: '${_i18n()["deliveryCost"]}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '${_i18n()["profile"]}',
              ),
            ]));
  }
}