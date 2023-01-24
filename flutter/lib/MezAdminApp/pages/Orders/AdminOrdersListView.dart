import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/controllers/AdmiOrdersListViewController.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/ROpOrderCard.dart';
import 'package:sizer/sizer.dart';

class AdmiOrdersListView extends StatefulWidget {
  const AdmiOrdersListView({super.key, required this.adminTabsViewController});
  final AdminTabsViewController adminTabsViewController;
  @override
  State<AdmiOrdersListView> createState() => _AdmiOrdersListViewState();
}

class _AdmiOrdersListViewState extends State<AdmiOrdersListView> {
  AdmiOrdersListViewController viewController = AdmiOrdersListViewController();
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
                  viewController.orders.isNotEmpty
                      ? Column(
                          children: List.generate(viewController.orders.length,
                              (int index) {
                            return MinimalOrderCard(
                              order: viewController.orders[index],
                              onTap: () {
                                if (viewController.currentService ==
                                    ServiceProviderType.Delivery_company) {
                                  MezRouter.toNamed(getDvCompanyOrderRoute(
                                      viewController.orders[index].id));
                                } else {
                                  MezRouter.toNamed(getRestaurantOrderRoute(
                                      viewController.orders[index].id));
                                }
                              },
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
