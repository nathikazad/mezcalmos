import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminDeliveryCompanyServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminRestaurantServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() => Column(
                children: [
                  _searchInput(),
                  viewController.services.isNotEmpty
                      ? Column(
                          children: List.generate(
                              viewController.services.length, (int index) {
                            return _getServiceCard(
                                viewController.services[index]);
                          }),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Center(child: CircularProgressIndicator())),
                ],
              )),
        ],
      ),
    );
  }

  Widget _searchInput() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: Get.textTheme.bodyText1,
        onChanged: (String value) {
          // viewController.searchQuery.value = value;
          // viewController.filter();
          //    mezDbgPrint(viewController.searchQuery);
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            hintText: "Search"),
      ),
    );
  }

  Widget _getServiceCard(UserInfo serviceInfo) {
    switch (viewController.currentService) {
      case ServiceProviderType.Restaurant:
        return AdminRestaurantServiceCard(serviceInfo: serviceInfo);

      case ServiceProviderType.Delivery_company:
        return AdminDeliveryCompanyServiceCard(serviceInfo: serviceInfo);

      default:
        return SizedBox();
    }
  }
}
