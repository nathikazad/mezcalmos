import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class OrderSummaryComponent extends StatelessWidget {
  final LaundryOrder order;
  const OrderSummaryComponent({Key? key, required this.order})
      : super(key: key);
  dynamic _i18n() =>
      Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
          ['LaundryCurrentOrderView']['Components']['OrderSummaryComponent'];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${_i18n()["orderSummary"]}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_i18n()["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${order.cost - 50} \$',
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
                  "50 \$",
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
                  "${_i18n()["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${order.cost} \$',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text(order.to.address, maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card laundryPricingCard(BuildContext context, LaundryOrder order) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _i18n()['laundryPricing'],
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _i18n()['fixedRate'],
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
                  _i18n()['orderWeight'],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  (order.weight != null)
                      ? order.weight.toString() + '/kg'
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
                  "${_i18n()["totalCost"]} :",
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
            if (order.weight == null)
              Column(
                children: [
                  Divider(
                    height: 25,
                  ),
                ],
              ),
            Row(
              children: [
                Icon(
                  Icons.help_outline_rounded,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(_i18n()['laundryPricingNote'], maxLines: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
