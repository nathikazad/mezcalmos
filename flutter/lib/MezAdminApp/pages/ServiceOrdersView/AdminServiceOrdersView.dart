import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/ServiceOrdersView/controllers/AdminServiceOrdersViewController.dart';
import 'package:mezcalmos/MezAdminApp/router/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdminServiceOrdersView"];

//
class AdminServiceOrdersView extends StatefulWidget {
  const AdminServiceOrdersView({super.key});

  static Future<void> navigate(
      {required int serviceProviderId,
      required String serviceName,
      required ServiceProviderType serviceProviderType}) {
    return MezRouter.toPath(
        MezAdminRoutes.kServiceOrdersRoute
            .replaceAll(":serviceProviderId", serviceProviderId.toString()),
        arguments: <String, dynamic>{
          'serviceProviderType': serviceProviderType,
          'serviceName': serviceName
        });
  }

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
    serviceProviderType = MezRouter.bodyArguments?["serviceProviderType"]
        .toString() as ServiceProviderType?;
    serviceName = MezRouter.bodyArguments?["serviceName"].toString();
    serviceProviderId =
        int.tryParse(MezRouter.urlArguments["serviceProviderId"].toString());

    if (hasValues) {
      viewController.init(
          serviceId: serviceProviderId!,
          serviceProviderType: serviceProviderType!);
    } else {
      MezRouter.back();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
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
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                      viewController.currentOrders.value!.length,
                      (int index) => MinimalOrderCard(
                          order: viewController.currentOrders.value![index],
                          onTap: () {
                            switch (viewController.providerType) {
                              case ServiceProviderType.DeliveryCompany:
                                //   MezRouter.toNamed(getDvCompanyOrderRoute(
                                //       viewController
                                //           .currentOrders.value![index].id));
                                //   break;
                                // case ServiceProviderType.Laundry:
                                //   MezRouter.toNamed(getLaundryOrderRoute(
                                //       viewController
                                //           .currentOrders.value![index].id));
                                //   break;
                                // case ServiceProviderType.Restaurant:
                                //   MezRouter.toNamed(getRestaurantOrderRoute(
                                //       viewController
                                //           .currentOrders.value![index].id));

                                break;
                              default:
                            }
                          })),
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
                      style: context.txt.bodyLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                          viewController.pastOrders.value!.length,
                          (int index) => MinimalOrderCard(
                              order: viewController.pastOrders.value![index],
                              onTap: () {
                                // @m66are TODO add routing
                                // switch (viewController.providerType) {
                                //   case ServiceProviderType.DeliveryCompany:
                                //     MezRouter.toNamed(getDvCompanyOrderRoute(
                                //         viewController
                                //             .currentOrders.value![index].id));
                                //     break;
                                //   case ServiceProviderType.Laundry:
                                //     MezRouter.toNamed(getLaundryOrderRoute(
                                //         viewController
                                //             .currentOrders.value![index].id));
                                //     break;
                                //   case ServiceProviderType.Restaurant:
                                //     MezRouter.toNamed(getRestaurantOrderRoute(
                                //         viewController
                                //             .currentOrders.value![index].id));

                                //     break;
                                //   default:
                                // }
                              })),
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
