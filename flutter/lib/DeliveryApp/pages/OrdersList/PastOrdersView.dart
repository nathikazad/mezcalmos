import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class DriverPastOrdersView extends StatefulWidget {
  const DriverPastOrdersView({Key? key}) : super(key: key);

  @override
  _DriverPastOrdersViewState createState() => _DriverPastOrdersViewState();
}

class _DriverPastOrdersViewState extends State<DriverPastOrdersView> {
  RxList<MinimalOrder> pastOrders = RxList.empty();

  @override
  void initState() {
    get_past_driver_orders(
            driverId:
                Get.find<DeliveryAuthController>().driver!.deliveryDriverId)
        .then((List<MinimalOrder>? value) {
      if (value != null) {
        pastOrders.value = value;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    pastOrders.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          autoBack: true, title: "${_i18n()["pastOrders"]}"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Obx(() {
          return _pastOrdersList(context);
        }),
      ),
    );
  }

  Widget _pastOrdersList(BuildContext context) {
    if (pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pastOrders.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Text(
                _i18n()["pastOrders"],
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          Column(
            children: List.generate(
              pastOrders.length,
              (int index) => MinimalOrderCard(
                order: pastOrders[index],
                onTap: () {
                  DvOrderView.navigate(orderId: pastOrders[index].id);
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
