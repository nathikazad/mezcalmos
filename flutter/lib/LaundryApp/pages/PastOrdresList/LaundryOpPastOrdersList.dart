import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/CurrentOrdersList/components/LaundryOpOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['DashboardView']['OrdersListView']['LaundryOpOrdersListView'];

class LaundryOpPastOrdersList extends StatefulWidget {
  const LaundryOpPastOrdersList({Key? key}) : super(key: key);

  @override
  State<LaundryOpPastOrdersList> createState() =>
      _LaundryOpPastOrdersListState();
}

class _LaundryOpPastOrdersListState extends State<LaundryOpPastOrdersList> {
  OrderController orderController = Get.find<OrderController>();
  RxList<LaundryOrder> inProcessOrders = RxList.empty();
  RxList<LaundryOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener =
        orderController.currentOrders.stream.listen((List<LaundryOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener =
        orderController.pastOrders.stream.listen((List<LaundryOrder> event) {
      pastOrders.value = event;
    });

    super.initState();
  }

  @override
  void dispose() {
    _pastOrdersListener?.cancel();
    _inProcessOrdersListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: LaundryAppAppBar(
        showOrders: false,
        title: "${_i18n()["pastOrders"]}",
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: Get.back,
      ),
      body: Obx(
        () => Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: const EdgeInsets.all(10),
              children: <Widget>[
                if (inProcessOrders.isNotEmpty)
                  _buildInProcessOrders(textTheme),
                SizedBox(height: 25),
                Text(
                  "${_i18n()["pastOrders"]}",
                  style: textTheme.bodyText1,
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: pastOrders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return LaundryOpOrderCard(
                      laundryOrder: pastOrders[index],
                    );
                  },
                  separatorBuilder: (BuildContext ctx, int index) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInProcessOrders(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          "${_i18n()["currentOrders"]}",
          style: textTheme.bodyText1,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          itemCount: inProcessOrders.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return LaundryOpOrderCard(
              laundryOrder: inProcessOrders[index],
            );
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return SizedBox(
              height: 8,
            );
          },
        ),
      ],
    );
  }
}
