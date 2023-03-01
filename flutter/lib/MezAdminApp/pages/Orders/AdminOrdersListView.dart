import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/controllers/AdmiOrdersListViewController.dart';
import 'package:mezcalmos/MezAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';
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
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Obx(() => Column(
                children: [
                  if (viewController.currentService ==
                      ServiceProviderType.Restaurant)
                    _buildRestuarntOrders(),
                  if (viewController.currentService ==
                      ServiceProviderType.DeliveryCompany)
                    _buildDeliveryOrders(),
                  if (viewController.currentService ==
                      ServiceProviderType.Laundry)
                    _buildLaundryOrders(),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildRestuarntOrders() {
    return Container(
      child: (viewController.restaurantOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.restaurantOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.restaurantOrders.value![index],
                      onTap: () {
                        mezDbgPrint(
                            "ID ====>${viewController.restaurantOrders.value![index].id}");
                        MezRouter.toNamed(getRestaurantOrderRoute(
                            viewController.restaurantOrders.value![index].id));
                      })),
            )
          : Container(
              margin: EdgeInsets.only(top: 10.h),
              alignment: Alignment.center,
              child: Center(child: NoOrdersComponent())),
    );
  }

  Widget _buildDeliveryOrders() {
    return Container(
      child: (viewController.deliveryOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.deliveryOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.deliveryOrders.value![index],
                      onTap: () {
                        MezRouter.toNamed(getDvCompanyOrderRoute(
                            viewController.deliveryOrders.value![index].id));
                      })),
            )
          : Container(
              margin: EdgeInsets.only(top: 10.h),
              alignment: Alignment.center,
              child: Center(child: NoOrdersComponent())),
    );
  }

  Widget _buildLaundryOrders() {
    return Container(
      child: (viewController.laundryOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.laundryOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.laundryOrders.value![index],
                      onTap: () {
                        MezRouter.toNamed(getLaundryOrderRoute(
                            viewController.laundryOrders.value![index].id));
                      })),
            )
          : Container(
              margin: EdgeInsets.only(top: 10.h),
              alignment: Alignment.center,
              child: Center(child: NoOrdersComponent())),
    );
  }
}
