import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/Components/DriverCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/CurrentOrderInfo.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderInfoCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderNoteCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderShippingLocation.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/OrderTotalCostCard.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/PastOrderInfo.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

class ViewRestaurantOrderScreen extends StatefulWidget {
  const ViewRestaurantOrderScreen({Key? key}) : super(key: key);

  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  /// AuthController
  AuthController auth = Get.find<AuthController>();

  /// RestaurantOrderController
  RestaurantOrderController controller = Get.find<RestaurantOrderController>();

  /// DeliveryDriverController
  DeliveryDriverController deliveryDriverController = Get.find<
      DeliveryDriverController>(); // Since we have alot of buttons we check loading by name

  /// driver
  DeliveryDriverUserInfo? driver;

  /// hasNewMessage
  Rx<bool> hasNewMessage = false.obs;

  /// RestaurantOrder
  Rxn<RestaurantOrder> order = Rxn<RestaurantOrder>();

  /// orderId
  late String orderId;

  /// LanguageType
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  /// _orderListener
  StreamSubscription<RestaurantOrder?>? _orderListener;

  @override
  void dispose() {
    _orderListener?.cancel();
    _orderListener = null;
    super.dispose();
  }

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
      _orderListener = controller
          .getCurrentOrderStream(orderId)
          .listen((RestaurantOrder? newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId);

          if (order.value?.dropoffDriver != null) {
            driver = order.value!.dropoffDriver;
          }
        } else {
          Get.back();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        focusColor: Colors.grey.shade100,
        hoverColor: Colors.grey.shade100,
        splashColor: Colors.grey.shade100,
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.purple.shade700,
        onPressed: () {
          Clipboard.setData(
                  ClipboardData(text: order.value?.clipBoardText(userLanguage)))
              .then((value) => MezSnackbar("Done :D", "Copied to clipboard.",
                  position: SnackPosition.TOP));
        },
        tooltip: 'Copy',
        child: new Icon(Icons.copy),
      ),
      appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back,
          withOrder: true, function: Get.back),
      // backgroundColor: Colors.white,
      body: Obx(
        () {
          if (order.value == null) {
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //====================Restaurant Info=======================
                    (!controller.isPast(order.value!))
                        ? CurrentOrderInfo(
                            order: order.value!,
                          )
                        : PastOrderInfo(order: order.value!),

                    //============================= Customer info====================
                    if (order.value?.inProcess() ?? false)
                      DriverCard(
                        driver: order.value!.dropoffDriver,
                        order: order.value!,
                        assignDriverCallback: (
                            {required bool changeDriver,
                            required DeliveryDriver deliveryDriver}) async {
                          await deliveryDriverController.assignDeliveryDriver(
                            deliveryDriverId: deliveryDriver.deliveryDriverId,
                            orderId: order.value!.orderId,
                            orderType: OrderType.Restaurant,
                            deliveryDriverType: DeliveryDriverType.DropOff,
                            changeDriver: changeDriver,
                          );
                        },
                      ),

                    //getCustomerInfoCart(),
                    OrderInfoCard(order: order),
                    //==========================>total cost=====================================
                    orderTotalCostCard(order),
                    //=========== location========================
                    orderShippingLocation(order),
                    //===============================>notes========================>
                    orderNoteCard(order)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
