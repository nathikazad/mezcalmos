import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/components/OrderItemsItemCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

class OrderItemsCard extends StatelessWidget {
  const OrderItemsCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            '${_i18n()["orderItems"]}',
            style: txt.bodyText1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(
              order.items.length,
              (int index) => OrderItemsItemCard(
                    item: order.items[index],
                    order: order,
                  )),
        )
      ],
    );
  }
}
