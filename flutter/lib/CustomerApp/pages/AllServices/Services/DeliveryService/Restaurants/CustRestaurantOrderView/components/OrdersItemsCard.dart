import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/DeliveryService/Restaurants/CustRestaurantOrderView/components/OrderItemsItemCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
    mezDbgPrint("[544D] order.items.length ==> ${order.items.length}");
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            '${_i18n()["orderItems"]}',
            style: txt.bodyText1,
          ),
        ),
        Column(
          children: List.generate(
            order.items.length,
            (int index) => Column(
              children: [
                OrderItemsItemCard(
                  item: order.items[index],
                  order: order,
                ),
                index != order.items.length - 1
                    ? SizedBox(
                        height: 8,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
