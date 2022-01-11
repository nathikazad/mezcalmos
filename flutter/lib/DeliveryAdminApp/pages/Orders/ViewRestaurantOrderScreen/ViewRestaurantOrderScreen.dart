import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/CustomerInfoCart.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

import 'components/PastOrderInfo.dart';
import 'components/restaurntsInfoComponent.dart';

final currency = new NumberFormat("#,##0.00", "en_US");
LinearGradient? buttonGraientColor;

class ViewRestaurantOrderScreen extends StatefulWidget {
  @override
  _ViewRestaurantOrderScreen createState() => _ViewRestaurantOrderScreen();
}

class _ViewRestaurantOrderScreen extends State<ViewRestaurantOrderScreen> {
  LanguageController lang = Get.find<LanguageController>();
  AuthController auth = Get.find<AuthController>();
  // Since we have alot of buttons we check loading by name

  Rxn<RestaurantOrder> order = Rxn();
  OrderController controller = Get.find<OrderController>();
  late String orderId;
  Rx<bool> hasNewMessage = false.obs;
  StreamSubscription? _orderListener;
  @override
  void initState() {
    super.initState();

    mezDbgPrint("ViewOrderScreen");
    orderId = Get.parameters['orderId']!;
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as RestaurantOrder?;
    if (order.value == null) {
      Get.back();
    } else {
      _orderListener =
          controller.getCurrentOrderStream(orderId).listen((newOrder) {
        if (newOrder != null) {
          order.value = controller.getOrder(orderId) as RestaurantOrder?;
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
    return Scaffold(
        appBar: deliveryAdminAppBar(AppBarLeftButtonType.Back, withOrder: true),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (order.value == null) {
            // Order Loading ..
            Get.back();
            return MezLogoAnimation(
              centered: true,
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  //====================Restaurant Info=======================
                  (!controller.isPast(order.value!))
                      ? RestaurantsInfoComponet(
                          order: order.value!,
                        )
                      : PastOrderInfo(order: order.value!),

                  //============================= Customer info====================
                  //getCustomerInfoCart(),
                  CustomerInfoCard(order: order),
                  //==========================>total cost=====================================

                  //=========== location========================
                  getTotalCostCart(),
                  //===============================>notes========================>
                  getNoteCart()
                ],
              ),
            );
          }
        }));
  }

  Widget getNoteCart() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text(
                "${lang.strings['customer']['restaurant']['menu']['notes']}",
                style: Theme.of(context).textTheme.headline3)),
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: Get.width,
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x80ffffff),
          ),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  order.value!.notes == null
                      ? "Nothing"
                      : "${order.value!.notes} ",
                  style: Theme.of(context).textTheme.bodyText1)),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget getTotalCostCart() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text(
              "${lang.strings['customer']['restaurant']['cart']['totalCost']}",
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.left),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: Get.width,
          height: 113,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: const Color(0xffececec), width: 0.5),
            color: const Color(0x80ffffff),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                          "${lang.strings['customer']['restaurant']['cart']['deliveryCost']}",
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.left),
                      Spacer(),
                      Text(" \$40.00",
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.right)
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: Get.width,
                  height: 0.5,
                  decoration: BoxDecoration(color: const Color(0xffececec))),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      // Total
                      Text(
                          "${lang.strings['customer']['restaurant']['cart']['total']}",
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.left),
                      Spacer(),
                      Text("  \$${currency.format(order.value!.cost)}",
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.right)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
