import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/components/AdminRestaurantServiceCard.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServicesView/controllers/AdminServiceViewController.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:sizer/sizer.dart';

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
                  Text(viewController.currentService.name.toString()),
                  viewController.services.isNotEmpty
                      ? Column(
                          children: List.generate(
                              viewController.services.length, (int index) {
                            return AdminServiceCard(
                              serviceInfo: viewController.services[index],
                            );
                          }),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 10.h),
                          alignment: Alignment.center,
                          child: Center(child: NoOrdersComponent())),
                ],
              )),
        ],
      ),
    );
  }
}
