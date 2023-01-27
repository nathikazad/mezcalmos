import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminDeliveryCompanyServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminRestaurantServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
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
                  viewController.hasData
                      ? _buildServices()
                      : Container(
                          alignment: Alignment.center,
                          child: Center(child: CircularProgressIndicator())),
                ],
              )),
        ],
      ),
    );
  }

  Container _buildServices() {
    return Container(
      child: (viewController.currentService == ServiceProviderType.Restaurant)
          ? Column(
              children: List.generate(
                  viewController.restaurants!.length,
                  (int index) => AdminRestaurantServiceCard(
                      viewController: viewController,
                      restaurant: viewController.restaurants![index])))
          : Column(
              children: List.generate(
                  viewController.companies!.length,
                  (int index) => AdminDeliveryCompanyServiceCard(
                      viewController: viewController,
                      company: viewController.companies![index]))),
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
}
