import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantOrderView/components/OrderItemsItemCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

class OrderItemsCard extends StatelessWidget {
  OrderItemsCard({Key? key, required this.order, this.isWebVersion})
      : super(key: key);

  final RestaurantOrder order;
  bool? isWebVersion = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    mezDbgPrint("[544D] order.items.length ==> ${order.items.length}");
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
            style: txt.bodyText1!
                .copyWith(fontSize: (isWebVersion == true) ? 16 : null),
          ),
        ),
        SizedBox(
          height: (isWebVersion == true) ? 10 : 15,
        ),
        Column(
          children: List.generate(
              order.items.length,
              (int index) => OrderItemsItemCard(
                    item: order.items[index],
                    order: order,
                    isWebVersion: isWebVersion,
                  )),
        )
      ],
    );
  }
}
