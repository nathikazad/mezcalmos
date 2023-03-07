import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/controllers/AdmiOrdersListViewController.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/pages/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
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
                        RestaurantOrderView.navigate(
                            orderId: viewController
                                .restaurantOrders.value![index].id
                                .toString());
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
                        DvCompanyOrderView.navigate(
                            orderId:
                                viewController.deliveryOrders.value![index].id);
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
                        LaundryOrderView.navigate(
                            orderId:
                                viewController.laundryOrders.value![index].id);
                      })),
            )
          : Container(
              margin: EdgeInsets.only(top: 10.h),
              alignment: Alignment.center,
              child: Center(child: NoOrdersComponent())),
    );
  }
}
