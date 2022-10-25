import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpPickDriverView/components/ROpDriverSelectCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpPickDriverView/components/ROpDriversMapComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpPickDriverView/components/ROpSelfDriverCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/ROpPickDriverView/controllers/ROpPickDriverViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ROpPickDriverView extends StatefulWidget {
  const ROpPickDriverView({super.key});

  @override
  State<ROpPickDriverView> createState() => _ROpPickDriverViewState();
}

class _ROpPickDriverViewState extends State<ROpPickDriverView> {
  ROpPickDriverController viewController = ROpPickDriverController();
  String? orderID;
  Rxn<RestaurantOrder> order = Rxn();

  @override
  void initState() {
    orderID = Get.parameters["orderId"];
    if (orderID != null) {
      order.value = Get.find<ROpOrderController>().getOrder(orderID!);
      if (order.value != null) {
        viewController.init(restaurantId: order.value!.restaurantId);
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
            onClick: Get.back, title: "Pick driver"),
        body: Obx(() {
          if (order.value != null && viewController.screenLoading.isFalse) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // drivers map //
                    ROpDriversMapComponent(
                        drivers: viewController.drivers, order: order.value!),
                    const SizedBox(
                      height: 25,
                    ),
                    ROpSelfDeliveryCard(
                      restaurant: order.value!.restaurant,
                      assignCallBack: () async {
                        await viewController.assignSelfDelivery(
                            order: order.value!);
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // drivers list //
                    Column(
                      children: List.generate(
                          viewController.drivers.length,
                          (int index) => ROpDriverSelectCard(
                                driver: viewController.drivers[index],
                                assingCallback: () async {
                                  final bool result =
                                      await viewController.assignDriver(
                                          order: order.value!,
                                          driverId: viewController
                                              .drivers[index].deliveryDriverId,
                                          orderId: order.value!.orderId,
                                          isChanging:
                                              order.value!.dropoffDriver !=
                                                  null);
                                  if (result) Get.back();
                                },
                              )),
                    )
                  ],
                ));
          } else {
            return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Assgining driver ...",
                      style: Get.textTheme.bodyText2
                          ?.copyWith(color: primaryBlueColor),
                    )
                  ],
                ));
          }
        }));
  }
}
