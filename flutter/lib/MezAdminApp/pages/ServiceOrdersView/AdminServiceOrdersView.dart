import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/controllers/AdminServiceOrdersViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/ROpOrderCard.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServiceOrdersView"];

//
class AdminServiceOrdersView extends StatefulWidget {
  const AdminServiceOrdersView({super.key});

  @override
  State<AdminServiceOrdersView> createState() => _AdminServiceOrdersViewState();
}

class _AdminServiceOrdersViewState extends State<AdminServiceOrdersView> {
  AdminServiceOrdersViewController viewController =
      AdminServiceOrdersViewController();
  int? serviceProviderId;
  ServiceProviderType? serviceProviderType;
  String? serviceName;

  bool get hasValues =>
      serviceProviderId != null &&
      serviceProviderType != null &&
      serviceName != null;
  @override
  void initState() {
    serviceProviderType =
        Get.arguments?["serviceProviderType"] as ServiceProviderType?;
    serviceName = Get.arguments?["serviceName"] as String?;
    serviceProviderId = int.tryParse(Get.parameters["serviceProviderId"]!);

    if (hasValues) {
      viewController.init(
          serviceId: serviceProviderId!,
          serviceProviderType: serviceProviderType!);
    } else {
      Get.back();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: serviceName),
      body: Obx(() {
        if (viewController.hasData) {
          return _buildOrders();
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  Widget _buildOrders() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (viewController.currentOrders.value!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_i18n()['currentOrders']}",
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                      viewController.currentOrders.value!.length,
                      (int index) => MinimalOrderCard(
                          order: viewController.currentOrders.value![index],
                          onTap: () {})),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          (viewController.pastOrders.value!.isNotEmpty)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_i18n()['pastOrders']}",
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                          viewController.pastOrders.value!.length,
                          (int index) => MinimalOrderCard(
                              order: viewController.pastOrders.value![index],
                              onTap: () {})),
                    ),
                    if (viewController.pastOrders.value!.length ==
                        viewController.pastOrders.value)
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: MezButton(
                          label: "View more",
                          onClick: () async {
                            viewController.pastOrdersLimit.value += 10;
                            await viewController.fetchPastOrders();
                          },
                        ),
                      ),
                  ],
                )
              : (viewController.currentOrders.value!.isEmpty)
                  ? Container(
                      margin: EdgeInsets.only(top: 10.h),
                      alignment: Alignment.center,
                      child: Center(child: NoOrdersComponent()))
                  : SizedBox()
        ],
      ),
    );
  }
}
