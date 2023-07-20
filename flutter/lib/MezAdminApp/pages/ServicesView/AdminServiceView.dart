import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminBsServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminDeliveryCompanyServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminLaundryServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminRestaurantServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/CreateServiceView.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServicesView"]["AdminServicesView"];

class AdminServicesView extends StatefulWidget {
  const AdminServicesView({super.key, required this.adminTabsViewController});
  final AdminTabsViewController adminTabsViewController;
  @override
  State<AdminServicesView> createState() => _AdminServicesViewState();
}

class _AdminServicesViewState extends State<AdminServicesView> {
  AdminServicesViewController viewController = AdminServicesViewController();
  @override
  void initState() {
    viewController.init(
        adminTabsViewController: widget.adminTabsViewController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MezAddButton(
          onClick: () {
            if (viewController.currentService !=
                ServiceProviderType.DeliveryCompany) {
              CreateServiceView.navigate(
                  serviceProviderType: viewController.currentService,
                  fromMezAdmin: true);
            }
          },
          title: "Add service",
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: viewController.scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(() => Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [_searchInput(), _buildServices()],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServices() {
    return ListView.builder(
        itemCount: viewController.currentServiceLength,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
              child: _getServiceCard(index),
            ));
  }

  Widget _getServiceCard(int index) {
    switch (viewController.currentService) {
      case ServiceProviderType.Restaurant:
        return AdminRestaurantServiceCard(
            viewController: viewController,
            restaurant: viewController.restaurants[index]);

      case ServiceProviderType.Laundry:
        return AdminLaundryServiceCard(
            viewController: viewController,
            laundry: viewController.laundries[index]);

      case ServiceProviderType.DeliveryCompany:
        return AdminDeliveryCompanyServiceCard(
            viewController: viewController,
            company: viewController.companies[index]);
      case ServiceProviderType.Business:
        return AdminBsServiceCard(
            viewController: viewController,
            business: viewController.businesses![index]);

      default:
        return SizedBox();
    }
  }

  Widget _searchInput() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: context.txt.bodyLarge,
        onChanged: (String value) {},
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            hintText: "${_i18n()['search']}"),
      ),
    );
  }
}
