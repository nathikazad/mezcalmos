import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/CurrentOrdersList/components/ROpOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class ROpPastOrdersList extends StatefulWidget {
  const ROpPastOrdersList({Key? key}) : super(key: key);

  @override
  State<ROpPastOrdersList> createState() => _ROpPastOrdersListState();
}

class _ROpPastOrdersListState extends State<ROpPastOrdersList> {
  ROpOrderController orderController = Get.find<ROpOrderController>();
  RxList<RestaurantOrder> inProcessOrders = RxList.empty();
  RxList<RestaurantOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener = orderController.currentOrders.stream
        .listen((List<RestaurantOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener =
        orderController.pastOrders.stream.listen((List<RestaurantOrder> event) {
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
        leftBtnType: AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
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
                Text(
                  "${_i18n()["pastOrders"]}",
                  style: textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: pastOrders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return ROpOrderCard(
                      order: pastOrders[index],
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
        Text(
          "${_i18n()["currentOrders"]}",
          style: textTheme.bodyText1,
        ),
        const SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          itemCount: inProcessOrders.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return ROpOrderCard(
              order: inProcessOrders[index],
            );
          },
        ),
        Divider(),
      ],
    );
  }
}
