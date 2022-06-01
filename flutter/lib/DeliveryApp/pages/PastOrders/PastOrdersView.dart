import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class DriverPastOrdersView extends StatefulWidget {
  const DriverPastOrdersView({Key? key}) : super(key: key);

  @override
  _DriverPastOrdersViewState createState() => _DriverPastOrdersViewState();
}

class _DriverPastOrdersViewState extends State<DriverPastOrdersView> {
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController orderController = Get.find<OrderController>();

  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    orderController.currentOrders.stream.listen((List<DeliverableOrder> value) {
      currentOrders.value = value;
    });

    orderController.pastOrders.stream.listen((List<DeliverableOrder> value) {
      pastOrders.value = value;
    });
    orderController.clearNewOrderNotificationsOfPastOrders();
    super.initState();
  }

  @override
  void dispose() {
    orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: "Past orders"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }

  Widget _pastOrdersList(BuildContext context) {
    if (orderController.pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              _i18n()["pastOrders"],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Column(
            children: List.generate(
                orderController.pastOrders.length,
                (int index) => DriverOrderCard(
                      order: orderController.pastOrders[index],
                      isPastOrder: true,
                    )).reversed.toList(),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
