import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
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
  Rxn<DeliveryOrder> order = Rxn();

  @override
  void initState() {
    final String orderId = Get.parameters['orderId']!;
    mezDbgPrint("Get.parameters ===> $orderId");
    if (int.tryParse(orderId) != null) {
      get_driver_order_by_id(orderId: int.parse(orderId))
          .then((DeliveryOrder? value) => order.value = value);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
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
                  style: Get.textTheme.bodyLarge,
                ),

                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(order.value?.pickupLocation?.address ?? "")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${_i18n()["deliveredTo"]}",
                  style: Get.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${order.value!.dropoffLocation.address}"),
                SizedBox(
                  height: 20,
                ),
                //     OrderPaymentMethod(order: order.value!),
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
                      style: Get.textTheme.bodyLarge,
                    ),
                    Text(
                      order.value!.deliveryCost.toPriceString(),
                      style: Get.textTheme.bodyLarge,
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

  Container _orderDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat("dd MMMM, hh:mm a")
                .format(order.value!.orderTime.toLocal()),
            style: Get.textTheme.bodyLarge,
          ),
          Text(
              order.value!.isCanceled()
                  ? "${_i18n()["cancelled"]}"
                  : "${_i18n()["approved"]}",
              style: Get.textTheme.bodyLarge?.copyWith(
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
                  CachedNetworkImageProvider(order.value!.customerInfo.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${order.value!.customerInfo.name}",
              style: Get.textTheme.bodyLarge,
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
              backgroundImage:
                  CachedNetworkImageProvider(order.value!.serviceInfo.image),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${order.value!.serviceInfo.name}",
              style: Get.textTheme.bodyLarge,
            ),
            Spacer(),
            Text(_getOrderType())
          ],
        ),
      ),
    );
  }

  String _getOrderType() {
    switch (order.value!.serviceProviderType) {
      case ServiceProviderType.Restaurant:
        return "${_i18n()["restaurant"]}";
      case ServiceProviderType.Laundry:
        return "${_i18n()["laundry"]}";

      default:
        return "";
    }
  }
}
