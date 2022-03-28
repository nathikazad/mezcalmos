import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryOrderSummary extends StatelessWidget {
  final LaundryOrder order;
  LaundryOrderSummary({Key? key, required this.order}) : super(key: key);

  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
      ["pages"] 
 ["Orders"]["LaundryOrder"]["Components"]["LaundryOrderSummary"];

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: Text(
            '${_i18n()['orderSummary']}',
            style: txt.headline3,
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _i18n()['orderWeight'],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.weight != null)
                          ? order.weight.toString() + ' kg'
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_i18n()["orderCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.cost != 0)
                          ? '\$' + order.cost.toStringAsFixed(0)
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_i18n()["deliveryCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "\$5",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Divider(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_i18n()["totalCost"]} :",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      (order.cost != 0)
                          ? '\$' + (order.cost + 5).toString()
                          : '-',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
