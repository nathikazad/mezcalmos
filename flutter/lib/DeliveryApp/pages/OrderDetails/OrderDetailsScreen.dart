import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["OrderDetailsScreen"];

//
class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late String orderId;
  Rxn<Order> order = Rxn();
  StreamSubscription<Order?>? _orderListener;
  OrderController controller = Get.find<OrderController>();

  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    mezDbgPrint("Get.parameters ===> $orderId");
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId);
    mezDbgPrint("order.value.id ===> ${order.value?.orderId}");
    _orderListener =
        controller.getOrderStream(orderId).listen((Order? newOrderEvent) {
      if (newOrderEvent != null) {
        order.value = newOrderEvent;

        order.refresh();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      body: Obx(() {
        if (order.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _orderDetailsHeader(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()["from"]}",
                  style: Get.textTheme.bodyText1,
                ),
                if (_getOrderFromLocation() != null)
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(_getOrderFromLocation()!)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()["deliveredTo"]}",
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${order.value!.to.address}"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()["paymentMethod"]}",
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(order.value!.paymentType.toNormalString()),
                SizedBox(
                  height: 20,
                ),
                _serviceProviderCard(),
                SizedBox(
                  height: 10,
                ),
                _customerCard(),
                Divider(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_i18n()["deliveryCost"]}",
                      style: Get.textTheme.bodyText1,
                    ),
                    if (_getOrderShippingCost() != null)
                      Text(
                        _getOrderShippingCost()!.toPriceString(),
                        style: Get.textTheme.bodyText1,
                      ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  num? _getOrderShippingCost() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return (order.value as RestaurantOrder).shippingCost;

      case OrderType.Laundry:
        return (order.value as LaundryOrder).shippingCost;
      default:
        return null;
    }
  }

  Container _orderDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("dd MMMM, hh:mm a")
                .format(order.value!.orderTime.toLocal()),
            style: Get.textTheme.bodyText1,
          ),
          Text(
              order.value!.isCanceled()
                  ? "${_i18n()["cancelled"]}"
                  : "${_i18n()["approved"]}",
              style: Get.textTheme.bodyText1?.copyWith(
                  color: order.value!.isCanceled()
                      ? Colors.red
                      : primaryBlueColor))
        ],
      ),
    );
  }

  Card _customerCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(order.value!.customer.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${order.value!.customer.name}",
              style: Get.textTheme.bodyText1,
            ),
            Spacer(),
            Text("${_i18n()["customer"]}")
          ],
        ),
      ),
    );
  }

  Card _serviceProviderCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  _getOrderServiceProvider()?.image ?? defaultUserImgUrl),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${_getOrderServiceProvider()?.name ?? ""}",
              style: Get.textTheme.bodyText1,
            ),
            Spacer(),
            Text(_getOrderType())
          ],
        ),
      ),
    );
  }

  String _getOrderType() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return "${_i18n()["restaurant"]}";
      case OrderType.Laundry:
        return "${_i18n()["laundry"]}";

      default:
        return "";
    }
  }

  ServiceInfo? _getOrderServiceProvider() {
    switch (order.value!.orderType) {
      case OrderType.Restaurant:
        return (order.value as RestaurantOrder).restaurant;
      case OrderType.Laundry:
        return (order.value as LaundryOrder).laundry;

      default:
        return null;
    }
  }

  String? _getOrderFromLocation() {
    if (order.value!.orderType == OrderType.Restaurant) {
      return (order.value as RestaurantOrder).restaurant.location.address;
    } else {
      if ((order.value as LaundryOrder).getCurrentPhase() ==
          LaundryOrderPhase.Pickup) {
        return (order.value as LaundryOrder).to.address;
      } else {
        return (order.value as LaundryOrder).laundry!.location.address;
      }
    }
  }
}
