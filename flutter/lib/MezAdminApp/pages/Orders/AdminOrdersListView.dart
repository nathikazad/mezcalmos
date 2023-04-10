import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/controllers/AdmiOrdersListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
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
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (viewController.isFetching.isTrue)
            LinearProgressIndicator(
              color: primaryBlueColor,
            ),
          Expanded(
            child: ListView(
              controller: viewController.scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
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
                _buildPastOrders(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastOrders() {
    return ListView.builder(
        itemCount: viewController.pastOrders.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
              child: MinimalOrderCard(
                  order: viewController.pastOrders[index],
                  onTap: () {
                    // todo @m66are add routing
                    // switch (viewController.currentService) {
                    //   case ServiceProviderType.Restaurant:
                    //     MezRouter.toNamed(getRestaurantOrderRoute(
                    //         viewController.pastOrders[index].id));
                    //     break;
                    //   case ServiceProviderType.Laundry:
                    //     MezRouter.toNamed(getLaundryOrderRoute(
                    //         viewController.pastOrders[index].id));
                    //     break;
                    //   case ServiceProviderType.DeliveryCompany:
                    //     MezRouter.toNamed(getDvCompanyOrderRoute(
                    //         viewController.pastOrders[index].id));
                    //     break;
                    //   default:
                    // }
                  }),
            ));
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
          : (viewController.restaurantPastOrders.value == null ||
                  viewController.restaurantPastOrders.value?.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : SizedBox(),
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
          : (viewController.dvPastOrders.value == null ||
                  viewController.dvPastOrders.value?.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : SizedBox(),
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
          : (viewController.laundryPastOrders.value == null ||
                  viewController.laundryPastOrders.value?.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : Container(),
    );
  }
}
