import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Components/DriverCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/BuildOrderButtons.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderCustomer.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderStatusCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryOrder/Components/LaundryOrderSummary.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

import '../../../../Shared/models/Drivers/DeliveryDriver.dart';

class LaundryOrderScreen extends StatefulWidget {
  const LaundryOrderScreen({Key? key}) : super(key: key);

  @override
  State<LaundryOrderScreen> createState() => _LaundryOrderScreenState();
}

class _LaundryOrderScreenState extends State<LaundryOrderScreen> {
  ///--------------- Controllers ------------------------//
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  LaundryOrderController controller = Get.find<LaundryOrderController>();
  DeliveryDriverController deliveryDriverController =
      Get.find<DeliveryDriverController>();

  ///--------------- Controllers ------------------------//

  /// ------------------ variables ------------------//
  Rxn<LaundryOrder> order = Rxn();

  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription? _orderListener;

  /// ------------------ variables ------------------//
  DeliveryDriverUserInfo? driver;
  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);
          if (order.value?.pickupDriver != null) {
            driver = order.value!.pickupDriver;
          }
        } else {
          Get.back();
        }
      });
    }
  }

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
        appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back, withOrder: true),
        body: Obx(() {
          if (order.value == null) {
            // Order Loading ..
            Get.back();
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LaundryOrderStatusCard(
                      order: order.value!,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // OrderMapTracking(
                    //   order: order.value!,
                    // ),
                    // Obx(() =>
                    //     OrderMapTracking(driver: driver, order: order.value!)),
                    LaundryOrderCustomer(
                      order: order.value!,
                    ),

                    if (order.value?.inProcess() ?? false)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: buildOrderButtons(order),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => DriverCard(
                        driver: getRightDriver(),
                        order: order.value!,
                        canChangeDriver: canChangeDriver(),
                        callBack: (newDriver) {
                          deliveryDriverController.assignDeliveryDriver(
                              deliveryDriverId: newDriver!.deliveryDriverId,
                              orderId: order.value!.orderId,
                              orderType: OrderType.Laundry,
                              deliveryDriverType: getRightDeliveryDriverType());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LaundryOrderSummary(
                      order: order.value!,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    deliveryLocation(txt, context),
                    SizedBox(
                      height: 10,
                    ),
                    orderNotes(txt)
                  ],
                ),
              ),
            );
          }
        }));
  }

// Card that shows the notes assigned with the orders
  Widget orderNotes(TextTheme txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${lang.strings['customer']['restaurant']['menu']['notes']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Text(
              order.value!.notes!,
            ),
          ),
        ),
      ],
    );
  }

// Card that shows the delivery location of the order
  Widget deliveryLocation(TextTheme txt, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${lang.strings['customer']['restaurant']['cart']['deliveryLocation']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.value!.to.address, maxLines: 1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DeliveryDriverUserInfo? getRightDriver() {
    switch (order.value!.status) {
      case (LaundryOrderStatus.AtLaundry):
        return order.value!.dropoffDriver;
      case (LaundryOrderStatus.ReadyForDelivery):
        return order.value!.dropoffDriver;
      case (LaundryOrderStatus.OtwDelivery):
        return order.value!.dropoffDriver;
      case (LaundryOrderStatus.Delivered):
        return order.value!.dropoffDriver;

      case (LaundryOrderStatus.OrderReceieved):
        return order.value!.pickupDriver;
      case (LaundryOrderStatus.OtwPickup):
        return order.value!.pickupDriver;
      case (LaundryOrderStatus.PickedUp):
        return order.value!.pickupDriver;

      default:
        return null;
    }
  }

  DeliveryDriverType getRightDeliveryDriverType() {
    switch (order.value!.status) {
      case (LaundryOrderStatus.AtLaundry):
        return DeliveryDriverType.DropOff;
      case (LaundryOrderStatus.ReadyForDelivery):
        return DeliveryDriverType.DropOff;
      case (LaundryOrderStatus.OtwDelivery):
        return DeliveryDriverType.DropOff;
      case (LaundryOrderStatus.Delivered):
        return DeliveryDriverType.DropOff;

      case (LaundryOrderStatus.OrderReceieved):
        return DeliveryDriverType.Pickup;
      case (LaundryOrderStatus.OtwPickup):
        return DeliveryDriverType.Pickup;
      case (LaundryOrderStatus.PickedUp):
        return DeliveryDriverType.Pickup;

      default:
        return DeliveryDriverType.Pickup;
    }
  }

  bool canChangeDriver() {
    switch (order.value!.status) {
      case (LaundryOrderStatus.AtLaundry):
        return true;
      case (LaundryOrderStatus.ReadyForDelivery):
        return true;

      case (LaundryOrderStatus.OrderReceieved):
        return true;

      default:
        return false;
    }
  }

// Card that shows the order summary (prices and total costs)
}
