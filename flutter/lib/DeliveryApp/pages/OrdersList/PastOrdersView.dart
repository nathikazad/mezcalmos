import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/PastOrderViewController.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class DriverPastOrdersView extends StatefulWidget {
  const DriverPastOrdersView({Key? key}) : super(key: key);

  @override
  _DriverPastOrdersViewState createState() => _DriverPastOrdersViewState();
}

class _DriverPastOrdersViewState extends State<DriverPastOrdersView> {
  DriverPastOrdersController _viewController = DriverPastOrdersController();
  @override
  void initState() {
    _viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true, title: "${_i18n()["pastOrders"]}"),
      body: SingleChildScrollView(
        controller: _viewController.scrollController,
        padding: const EdgeInsets.all(8),
        child: Obx(() {
          return _pastOrdersList(context);
        }),
      ),
    );
  }

  Widget _pastOrdersList(BuildContext context) {
    if (_viewController.pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_viewController.pastOrders.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Text(
                _i18n()["pastOrders"],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          Column(
            children: List.generate(
              _viewController.pastOrders.length,
              (int index) => MinimalOrderCard(
                order: _viewController.pastOrders[index],
                onTap: () {
                  DvOrderView.navigate(
                      orderId: _viewController.pastOrders[index].id);
                },
              ),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
